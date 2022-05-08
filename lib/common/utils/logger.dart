import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart' as logger;

@singleton
class Logger {
  final _logger = logger.Logger();

  void logInfo(String message) {
    _logger.i(message);
  }

  void logError(String message) {
    _logger.e(message);
  }

  void logWarning(String message) {
    _logger.w(message);
  }

  void logDebug(String message) {
    _logger.d(message);
  }

  void logVerbose(String message) {
    _logger.v(message);
  }
}
