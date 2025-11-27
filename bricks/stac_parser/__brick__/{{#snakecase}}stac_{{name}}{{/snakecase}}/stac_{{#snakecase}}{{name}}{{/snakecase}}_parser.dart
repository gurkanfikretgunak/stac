import 'package:flutter/material.dart';
import 'package:stac/stac.dart';

/// [Stac{{#pascalCase}}{{name}}{{/pascalCase}}Parser] is a parser for the `{{#snakeCase}}{{name}}{{/snakeCase}}` widget type.
///
/// This parser converts JSON objects with `"type": "{{#snakeCase}}{{name}}{{/snakeCase}}"` into
/// [Stac{{#pascalCase}}{{name}}{{/pascalCase}}] models and then builds Flutter widgets.
///
/// **Usage Example:**
/// ```dart
/// // Register the parser during Stac initialization
/// await Stac.initialize(
///   parsers: const [
///     Stac{{#pascalCase}}{{name}}{{/pascalCase}}Parser(),
///   ],
/// );
/// ```
///
/// **Performance Notes:**
/// - Uses const constructor for compile-time optimization
/// - Type string is const for faster registry lookups
/// - Consider caching parsed models if parsing the same JSON multiple times
class Stac{{#pascalCase}}{{name}}{{/pascalCase}}Parser extends StacParser<Stac{{#pascalCase}}{{name}}{{/pascalCase}}> {
  const Stac{{#pascalCase}}{{name}}{{/pascalCase}}Parser();

  /// The widget type string used in JSON to identify this parser.
  ///
  /// This should match the `"type"` field in your JSON widget definitions.
  /// Example: `{"type": "{{#snakeCase}}{{name}}{{/snakeCase}}", ...}`
  static const String _type = '{{#snakeCase}}{{name}}{{/snakeCase}}';

  @override
  String get type => _type;

  /// Parses a JSON object into a [Stac{{#pascalCase}}{{name}}{{/pascalCase}}] model.
  ///
  /// This method is called automatically by the Stac framework when processing
  /// JSON widget definitions. The JSON object should contain all properties
  /// required by the [Stac{{#pascalCase}}{{name}}{{/pascalCase}}] model.
  ///
  /// **Performance:** This uses efficient JSON deserialization via freezed.
  /// For frequently parsed JSON, consider implementing caching at a higher level.
  ///
  /// **Parameters:**
  /// - [json]: The JSON map containing widget properties
  ///
  /// **Returns:** A [Stac{{#pascalCase}}{{name}}{{/pascalCase}}] model instance
  @override
  Stac{{#pascalCase}}{{name}}{{/pascalCase}} getModel(Map<String, dynamic> json) => Stac{{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(json);

  /// Builds a Flutter [Widget] from a [Stac{{#pascalCase}}{{name}}{{/pascalCase}}] model.
  ///
  /// This method is called after [getModel] to convert the parsed model
  /// into a Flutter widget tree. Use the [model] properties to configure
  /// your widget.
  ///
  /// **Performance Tips:**
  /// - Use const widgets where possible to avoid unnecessary rebuilds
  /// - Extract complex widget trees into separate methods for better readability
  /// - Consider using [Builder] or [Consumer] widgets if you need context-dependent behavior
  ///
  /// **Parameters:**
  /// - [context]: The current [BuildContext] for theme/configuration access
  /// - [model]: The parsed [Stac{{#pascalCase}}{{name}}{{/pascalCase}}] model instance
  ///
  /// **Returns:** A Flutter [Widget] representing the parsed model
  ///
  /// **Example Implementation:**
  /// ```dart
  /// @override
  /// Widget parse(BuildContext context, Stac{{#pascalCase}}{{name}}{{/pascalCase}} model) {
  ///   return Container(
  ///     // Configure your widget using model properties
  ///     child: Text(model.title ?? 'Default'),
  ///   );
  /// }
  /// ```
  @override
  Widget parse(BuildContext context, Stac{{#pascalCase}}{{name}}{{/pascalCase}} model) {
    // TODO: Implement widget building logic
    // Replace this with your actual widget implementation
    // Example:
    //   return Container(
    //     child: Text(model.someProperty ?? 'Default'),
    //   );
    throw UnimplementedError('Stac{{#pascalCase}}{{name}}{{/pascalCase}}Parser.parse() must be implemented');
  }
}