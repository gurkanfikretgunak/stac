/// Abstract interface for logging functionality
///
/// This interface provides a platform-agnostic way to log messages.
/// Implementations are selected at compile time using conditional imports,
/// ensuring optimal performance for each platform.
///
/// **Performance Considerations:**
/// - Messages are passed as `dynamic` to allow flexible input types
/// - String conversion happens lazily in the implementation
/// - Web implementations check `kDebugMode` for zero overhead in release builds
abstract class LogInterface {
  /// Log a debug message
  ///
  /// Typically used for detailed diagnostic information during development.
  /// In release builds (web), this has zero overhead when `kDebugMode` is false.
  void d(dynamic message);

  /// Log an info message
  ///
  /// Used for general informational messages about application flow.
  void i(dynamic message);

  /// Log a warning message
  ///
  /// Used to indicate potential issues or unexpected conditions.
  void w(dynamic message);

  /// Log an error message
  ///
  /// Used to indicate errors that need attention.
  void e(dynamic message);
}
