import 'package:stac_logger/src/log_interface.dart';

import 'log_stub.dart'
    if (dart.library.io) 'log_io.dart'
    if (dart.library.html) 'log_web.dart'
    if (dart.library.wasm) 'log_web.dart';

/// A reusable logging utility for the Stac framework.
///
/// **Performance Optimizations:**
/// - Platform-specific implementations selected at compile time via conditional imports
/// - Singleton logger instance created once and reused
/// - Direct method delegation for minimal overhead
/// - Web builds have zero overhead in release mode (`kDebugMode` check)
///
/// **Usage:**
/// ```dart
/// import 'package:stac_logger/stac_logger.dart';
///
/// void main() {
///   Log.d('Debug message');
///   Log.i('Info message');
///   Log.w('Warning message');
///   Log.e('Error message');
/// }
/// ```
///
/// **Performance Tips:**
/// - In release builds on web, debug logs are automatically disabled
/// - For expensive string operations, consider checking log level first
/// - The logger instance is created once and reused, minimizing allocations
///
/// For information about Stac, visit [Stac](https://github.com/StacDev/stac).

class Log {
  const Log._();

  // Get the logger instance directly from the conditionally imported file
  // The compiler will select the appropriate implementation at compile time
  // This singleton pattern ensures the logger is created once and reused
  static final LogInterface _logger = createLogger();

  /// Logs a debug message
  ///
  /// **Performance:** On web, this has zero overhead in release builds.
  static void d(dynamic message) => _logger.d(message);

  /// Logs an info message
  static void i(dynamic message) => _logger.i(message);

  /// Logs a warning message
  static void w(dynamic message) => _logger.w(message);

  /// Logs an error message
  static void e(dynamic message) => _logger.e(message);
}
