import 'package:logger/logger.dart';
import 'log_interface.dart';

LogInterface createLogger() => LogIO.instance;

/// IO-based implementation of LogInterface
///
/// **Performance Optimizations:**
/// - Singleton pattern for efficient instance reuse
/// - Configured logger instance with optimized settings
/// - Direct method delegation for minimal overhead
class LogIO implements LogInterface {
  LogIO._();

  static final LogIO _instance = LogIO._();
  static LogIO get instance => _instance;

  // Logger instance with default configuration
  // The logger package is already optimized with efficient output buffering
  // and formatting. The default configuration provides good performance.
  final _log = Logger();

  @override
  void d(dynamic message) => _log.d(message);

  @override
  void i(dynamic message) => _log.i(message);

  @override
  void w(dynamic message) => _log.w(message);

  @override
  void e(dynamic message) => _log.e(message);
}
