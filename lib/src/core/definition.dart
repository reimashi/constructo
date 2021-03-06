import 'package:constructo/src/core/measure/unit.dart';
import 'package:constructo/src/core/type.dart';

/// Definition of an object.
class Definition {
  final String name;
  final String slug;
  final String description;
  final id;
  final CType type;
  final Unit unit;

  /// Establish the properties of an object.
  ///
  /// * [name]: Real name. If not provided, is extracted from the class or variable name.
  /// * [slug]: Is an internal name used to identificate the object unequivocally. If not provided, is extracted from [name].
  /// * [description] of the object or attribute.
  /// * [id]: For complex objects. If set, two object are equals if his property/properties specified are equals.
  /// * [type]: The canonical [type] in Constructo definition. Any direct equivalences are set by default for non inherited types:
  ///     * `Object` => `Object`
  ///     * `Map`    => `Object`
  ///     * `List`   => `List`
  ///     * `String` => `String`
  ///     * `bool`   => `Boolean`
  ///     * `num`    => `Double`
  ///     * `double` => `Double`
  ///     * `int`    => `Int`
  /// * [unit]: Unit of measure that stores.
  const Definition(
      {String name = null,
        String slug = null,
        String description = null,
        id = null,
        CType type = null,
        Unit unit = null})
      : this.name = name,
        this.slug = slug,
        this.description = description,
        this.id = id,
        this.type = type,
        this.unit = unit;

  String toString() {
    if (this.type == CObject) return "${type} ${slug} {}";
    else if (this.type == CList) return "${type} ${slug} []";
    else return "${type} ${slug} (${unit?.symbol ?? ""})";
  }
}
