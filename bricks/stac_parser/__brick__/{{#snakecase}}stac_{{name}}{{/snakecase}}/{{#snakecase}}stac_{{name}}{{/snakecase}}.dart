import 'package:freezed_annotation/freezed_annotation.dart';

part '{{#snakeCase}}stac_{{name}}{{/snakeCase}}.freezed.dart';
part '{{#snakeCase}}stac_{{name}}{{/snakeCase}}.g.dart';

/// A Stac model representing the `{{#snakeCase}}{{name}}{{/snakeCase}}` widget type.
///
/// This model is used to deserialize JSON widget definitions into a type-safe
/// Dart object. The model is generated using [freezed] for immutability and
/// [json_serializable] for efficient JSON serialization/deserialization.
///
/// **Performance Notes:**
/// - Uses const factory constructor for compile-time optimization
/// - Efficient JSON deserialization via code generation
/// - Immutable by default (freezed), preventing accidental mutations
///
/// **Usage:**
/// ```dart
/// // From JSON
/// final model = Stac{{#pascalCase}}{{name}}{{/pascalCase}}.fromJson({
///   // Add your JSON properties here
/// });
///
/// // Direct instantiation (const)
/// const model = Stac{{#pascalCase}}{{name}}{{/pascalCase}}(
///   // Add your properties here
/// );
/// ```
///
/// **Next Steps:**
/// 1. Add properties to this model class
/// 2. Run `dart run build_runner build` to generate freezed/json_serializable code
/// 3. Update the parser's `parse` method to use these properties
@freezed
abstract class Stac{{#pascalCase}}{{name}}{{/pascalCase}} with _$Stac{{#pascalCase}}{{name}}{{/pascalCase}} {
  /// Creates a [Stac{{#pascalCase}}{{name}}{{/pascalCase}}] instance.
  ///
  /// Use this const factory constructor for direct instantiation.
  /// All properties should be added here as named parameters.
  ///
  /// **Example:**
  /// ```dart
  /// const Stac{{#pascalCase}}{{name}}{{/pascalCase}}(
  ///   // property1: value1,
  ///   // property2: value2,
  /// )
  /// ```
  const factory Stac{{#pascalCase}}{{name}}{{/pascalCase}}({
    // TODO: Add your model properties here
    // Example:
    //   String? title,
    //   int? count,
    //   StacWidget? child,
  }) = _Stac{{#pascalCase}}{{name}}{{/pascalCase}};

  /// Creates a [Stac{{#pascalCase}}{{name}}{{/pascalCase}}] instance from a JSON map.
  ///
  /// This factory constructor is used by the parser to deserialize JSON
  /// widget definitions. The JSON map should contain all properties
  /// defined in the model.
  ///
  /// **Performance:** This uses code-generated deserialization for optimal performance.
  ///
  /// **Parameters:**
  /// - [json]: The JSON map containing widget properties
  ///
  /// **Returns:** A [Stac{{#pascalCase}}{{name}}{{/pascalCase}}] instance
  ///
  /// **Example:**
  /// ```dart
  /// final model = Stac{{#pascalCase}}{{name}}{{/pascalCase}}.fromJson({
  ///   'type': '{{#snakeCase}}{{name}}{{/snakeCase}}',
  ///   // Add your JSON properties here
  /// });
  /// ```
  factory Stac{{#pascalCase}}{{name}}{{/pascalCase}}.fromJson(Map<String, dynamic> json) => _$Stac{{#pascalCase}}{{name}}{{/pascalCase}}FromJson(json);
}
