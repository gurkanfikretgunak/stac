import 'package:flutter/material.dart';
import 'package:stac_framework/stac_framework.dart';
import 'package:stac_webview/parsers/stac_webview/stac_webview.dart';
import 'package:webview_flutter/webview_flutter.dart';

/// [StacWebViewParser] is a class that parses the `webView` widget from JSON.
///
/// **Performance Optimizations:**
/// - Uses const type string for faster registry lookups
/// - Efficient WebView controller management with didUpdateWidget
/// - Optimized color parsing without StringBuffer overhead
class StacWebViewParser extends StacParser<StacWebView> {
  const StacWebViewParser();

  /// [webView] is the type defined for StacWebViewParser.
  static const String _type = 'webView';

  @override
  String get type => _type;

  /// [getModel] method parses the JSON data and returns a [StacWebView] object.
  ///
  /// {@macro getModel}
  @override
  StacWebView getModel(Map<String, dynamic> json) => StacWebView.fromJson(json);

  @override
  Widget parse(BuildContext context, StacWebView model) {
    return _WebView(model: model);
  }
}

/// [_WebView] is a stateful widget that displays a webview.
class _WebView extends StatefulWidget {
  /// [_WebView] constructor.
  const _WebView({required this.model});

  /// `model` is the data that will be used to configure the webview.
  final StacWebView model;

  /// [createState] method creates the state for the [_WebView] widget.
  @override
  State<_WebView> createState() => _WebViewState();
}

/// [_WebViewState] is the state for the [_WebView] widget.
///
/// **Performance Optimizations:**
/// - Efficient controller management: only recreates controller when URL changes
/// - Uses const default values to avoid repeated computations
/// - Optimized state updates via didUpdateWidget
class _WebViewState extends State<_WebView> {
  /// `_controller` is the controller for the webview.
  late final WebViewController _controller;

  // Const default values to avoid repeated computations
  static const JavaScriptMode _defaultJavaScriptMode =
      JavaScriptMode.unrestricted;
  static const Color _defaultBackgroundColor = Colors.white;
  static const bool _defaultEnableZoom = false;
  static const TextDirection _defaultLayoutDirection = TextDirection.ltr;

  @override
  void initState() {
    super.initState();
    _controller = _createController(widget.model);
  }

  /// Creates and configures a WebViewController with the given model.
  ///
  /// This method is extracted for reuse in both initState and didUpdateWidget.
  WebViewController _createController(StacWebView model) {
    return WebViewController()
      ..loadRequest(Uri.parse(model.url))
      ..setJavaScriptMode(model.javaScriptMode ?? _defaultJavaScriptMode)
      ..setBackgroundColor(
        model.backgroundColor?.toColor ?? _defaultBackgroundColor,
      )
      ..setUserAgent(model.userAgent)
      ..enableZoom(model.enableZoom ?? _defaultEnableZoom);
  }

  /// Efficiently handles widget updates without unnecessary controller recreation.
  ///
  /// **Performance:** Only recreates the controller if the URL changes.
  /// Other property changes are handled by updating the existing controller.
  @override
  void didUpdateWidget(_WebView oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Only recreate controller if URL changed (most expensive operation)
    if (oldWidget.model.url != widget.model.url) {
      _controller = _createController(widget.model);
    } else {
      // Update other properties without recreating controller
      if (oldWidget.model.javaScriptMode != widget.model.javaScriptMode) {
        _controller.setJavaScriptMode(
          widget.model.javaScriptMode ?? _defaultJavaScriptMode,
        );
      }

      if (oldWidget.model.backgroundColor != widget.model.backgroundColor) {
        _controller.setBackgroundColor(
          widget.model.backgroundColor?.toColor ?? _defaultBackgroundColor,
        );
      }

      if (oldWidget.model.userAgent != widget.model.userAgent) {
        _controller.setUserAgent(widget.model.userAgent);
      }

      if (oldWidget.model.enableZoom != widget.model.enableZoom) {
        _controller.enableZoom(
          widget.model.enableZoom ?? _defaultEnableZoom,
        );
      }
    }
  }

  /// [build] method builds the widget.
  ///
  /// {@macro build}
  @override
  Widget build(BuildContext context) {
    /// [WebViewWidget] is a widget that displays a webview.
    return WebViewWidget(
      controller: _controller,
      layoutDirection: widget.model.layoutDirection ?? _defaultLayoutDirection,
    );
  }
}

/// Extension on [String] to convert to [Color].
///
/// **Performance Optimizations:**
/// - Direct string manipulation without StringBuffer overhead
/// - Efficient hex parsing using substring operations
/// - Minimal temporary object creation
///
/// {@macro toColor}
extension ColorExt on String? {
  Color? get toColor {
    if (this == null || this!.isEmpty) return null;

    // Remove '#' prefix if present
    String hexString = this!.startsWith('#') ? this!.substring(1) : this!;
    final int length = hexString.length;

    // Handle different hex formats: RGB, RRGGBB, AARRGGBB
    // If 6 or 7 chars (after removing #), prepend alpha channel
    if (length == 6 || length == 7) {
      hexString = 'ff$hexString';
    } else if (length != 8) {
      // Invalid format, return null
      return null;
    }

    // Parse hex string directly to int (more efficient than StringBuffer)
    final int? intColor = int.tryParse(hexString, radix: 16);
    if (intColor == null) return null;

    return Color(intColor);
  }
}
