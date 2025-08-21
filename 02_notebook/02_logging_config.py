# 02_logging_config.py
"""
Logging configuration for football data analysis project.
Provides structured logging for data cleaning, analysis, and model training.
"""

import logging
import logging.config
import os
from datetime import datetime
import json
import sys

# Create logs directory if it doesn't exist
LOG_DIR = "../04_logs"
os.makedirs(LOG_DIR, exist_ok=True)

# Current timestamp for log file naming
CURRENT_TIMESTAMP = datetime.now().strftime("%Y%m%d_%H%M%S")

# Define log file paths
LOG_FILE = os.path.join(LOG_DIR, f"football_analysis_{CURRENT_TIMESTAMP}.log")
ERROR_LOG_FILE = os.path.join(LOG_DIR, f"errors_{CURRENT_TIMESTAMP}.log")

# Logging configuration dictionary
LOGGING_CONFIG = {
    "version": 1,
    "disable_existing_loggers": False,
    "formatters": {
        "standard": {
            "format": "%(asctime)s - %(name)s - %(levelname)s - %(message)s",
            "datefmt": "%Y-%m-%d %H:%M:%S"
        },
        "detailed": {
            "format": "%(asctime)s - %(name)s - %(levelname)s - %(filename)s:%(lineno)d - %(message)s",
            "datefmt": "%Y-%m-%d %H:%M:%S"
        },
        "json": {
            "()": "pythonjsonlogger.jsonlogger.JsonFormatter",
            "format": """
                asctime: %(asctime)s
                name: %(name)s
                levelname: %(levelname)s
                filename: %(filename)s
                lineno: %(lineno)d
                message: %(message)s
                module: %(module)s
                funcName: %(funcName)s
            """,
            "datefmt": "%Y-%m-%d %H:%M:%S"
        }
    },
    
    "handlers": {
        "console": {
            "class": "logging.StreamHandler",
            "level": "INFO",
            "formatter": "standard",
            "stream": sys.stdout
        },
        "file": {
            "class": "logging.handlers.RotatingFileHandler",
            "level": "DEBUG",
            "formatter": "detailed",
            "filename": LOG_FILE,
            "maxBytes": 10485760,  # 10MB
            "backupCount": 5,
            "encoding": "utf8"
        },
        "error_file": {
            "class": "logging.handlers.RotatingFileHandler",
            "level": "WARNING",
            "formatter": "detailed",
            "filename": ERROR_LOG_FILE,
            "maxBytes": 10485760,  # 10MB
            "backupCount": 3,
            "encoding": "utf8"
        },
        "data_quality_handler": {
            "class": "logging.handlers.RotatingFileHandler",
            "level": "INFO",
            "formatter": "json",
            "filename": os.path.join(LOG_DIR, f"data_quality_{CURRENT_TIMESTAMP}.json"),
            "maxBytes": 5242880,  # 5MB
            "backupCount": 2,
            "encoding": "utf8"
        }
    },
    
    "loggers": {
        "": {  # Root logger
            "handlers": ["console", "file", "error_file"],
            "level": "DEBUG",
            "propagate": True
        },
        "data_quality": {
            "handlers": ["data_quality_handler", "console"],
            "level": "INFO",
            "propagate": False
        },
        "data_cleaning": {
            "handlers": ["file", "console"],
            "level": "INFO",
            "propagate": False
        },
        "model_training": {
            "handlers": ["file", "console"],
            "level": "INFO",
            "propagate": False
        },
        "analysis": {
            "handlers": ["file", "console"],
            "level": "INFO",
            "propagate": False
        },
        "pandas": {
            "handlers": ["file"],
            "level": "WARNING",
            "propagate": False
        },
        "matplotlib": {
            "handlers": ["file"],
            "level": "WARNING",
            "propagate": False
        }
    }
}

def setup_logging():
    """
    Initialize logging configuration for the project.
    """
    try:
        logging.config.dictConfig(LOGGING_CONFIG)
        logger = logging.getLogger(__name__)
        logger.info("Logging configuration initialized successfully")
        logger.info(f"Main log file: {LOG_FILE}")
        logger.info(f"Error log file: {ERROR_LOG_FILE}")
        return True
    except Exception as e:
        print(f"Failed to configure logging: {e}")
        return False

def get_logger(name):
    """
    Get a configured logger instance.
    
    Args:
        name (str): Name of the logger (usually __name__)
    
    Returns:
        logging.Logger: Configured logger instance
    """
    return logging.getLogger(name)

def log_data_quality_report(df, logger_name="data_quality"):
    """
    Log comprehensive data quality report.
    
    Args:
        df (pd.DataFrame): DataFrame to analyze
        logger_name (str): Logger to use for reporting
    """
    logger = logging.getLogger(logger_name)
    
    quality_report = {
        "timestamp": datetime.now().isoformat(),
        "dataset_shape": df.shape,
        "memory_usage_mb": df.memory_usage(deep=True).sum() / 1024**2,
        "missing_values": {
            "total": df.isnull().sum().sum(),
            "by_column": df.isnull().sum().to_dict(),
            "percentage": (df.isnull().sum() / len(df) * 100).to_dict()
        },
        "data_types": df.dtypes.astype(str).to_dict(),
        "duplicate_rows": df.duplicated().sum(),
        "numeric_stats": df.describe().to_dict() if len(df.select_dtypes(include=['number'])) > 0 else {}
    }
    
    logger.info("Data Quality Report", extra={"quality_report": quality_report})
    return quality_report

def log_exception(logger_name="root"):
    """
    Decorator to log exceptions in functions.
    
    Args:
        logger_name (str): Name of the logger to use
    """
    def decorator(func):
        def wrapper(*args, **kwargs):
            logger = logging.getLogger(logger_name)
            try:
                logger.debug(f"Starting {func.__name__}")
                result = func(*args, **kwargs)
                logger.debug(f"Completed {func.__name__} successfully")
                return result
            except Exception as e:
                logger.error(f"Error in {func.__name__}: {str(e)}", exc_info=True)
                raise
        return wrapper
    return decorator

class PerformanceLogger:
    """
    Context manager for logging performance of code blocks.
    """
    def __init__(self, operation_name, logger_name="root", level="INFO"):
        self.operation_name = operation_name
        self.logger = logging.getLogger(logger_name)
        self.level = level
        self.start_time = None
    
    def __enter__(self):
        self.start_time = datetime.now()
        self.logger.log(
            getattr(logging, self.level),
            f"Starting operation: {self.operation_name}"
        )
        return self
    
    def __exit__(self, exc_type, exc_val, exc_tb):
        end_time = datetime.now()
        duration = (end_time - self.start_time).total_seconds()
        
        if exc_type:
            self.logger.error(
                f"Operation {self.operation_name} failed after {duration:.2f}s",
                exc_info=(exc_type, exc_val, exc_tb)
            )
        else:
            self.logger.log(
                getattr(logging, self.level),
                f"Completed operation: {self.operation_name} in {duration:.2f}s"
            )

# Initialize logging when module is imported
if setup_logging():
    logger = get_logger(__name__)
    logger.info("Logging module imported and configured")
else:
    print("Warning: Logging configuration failed. Using basic logging.")
    logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')

# Example usage
if __name__ == "__main__":
    logger = get_logger(__name__)
    logger.debug("This is a debug message")
    logger.info("This is an info message")
    logger.warning("This is a warning message")
    logger.error("This is an error message")
    logger.critical("This is a critical message")
    
    # Example with performance logging
    with PerformanceLogger("test_operation"):
        import time
        time.sleep(0.1)
    
    print("Logging configuration test completed. Check log files in ../04_logs/")