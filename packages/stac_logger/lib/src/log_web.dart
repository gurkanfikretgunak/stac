import 'package:flutter/foundation.dart';
import 'package:stac_logger/src/log_interface.dart';

LogInterface createLogger() => LogWeb.instance;

/// Web/WASM-compatible implementation of LogInterface
///
/// **Performance Optimizations:**
/// - Early return when `kDebugMode` is false (zero overhead in release builds)
/// - Const string prefixes to avoid repeated allocations
/// - Efficient string concatenation using string interpolation
class LogWeb implements LogInterface {
  LogWeb._();

  static final LogWeb _instance = LogWeb._();
  static LogWeb get instance => _instance;

  // Const strings for log level prefixes to avoid repeated allocations
  static const String _debugPrefix = '[DEBUG] ';
  static const String _infoPrefix = '[INFO] ';
  static const String _warningPrefix = '[WARNING] ';
  static const String _errorPrefix = '[ERROR] ';

  @override
  void d(dynamic message) {
    // Early return optimization: check kDebugMode before any string operations
    // This ensures zero overhead in release builds
    if (!kDebugMode) return;
    debugPrint('$_debugPrefix$message');
  }

  @override
  void i(dynamic message) {
    if (!kDebugMode) return;
    debugPrint('$_infoPrefix$message');
  }

  @override
  void w(dynamic message) {
    if (!kDebugMode) return;
    debugPrint('$_warningPrefix$message');
  }

  @override
  void e(dynamic message) {
    if (!kDebugMode) return;
    debugPrint('$_errorPrefix$message');
  }
}
