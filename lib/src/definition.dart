
/// Definition of an object.
class Definition {
  /// Establish the properties of an object.
  ///
  /// * [name]: Real name. If not provided, is extracted from the class or variable name.
  /// * [slug]: Is an internal name used to identificate the object unequivocally. If not provided, is extracted from [name].
  /// * [description] of the object or attribute.
  /// * [id]: For complex objects. If set, two object are equals if his property/properties specified are equals.
  /// * [initValue]: The default value if not set explicitly. If not defined, the value is null even for numbers or booleans.
  /// * [type]: The canonical [type] in Constructo definition. Any direct equivalences are set by default for non inherited types:
  ///     * `Object` => `Complex`
  ///     * `Map`    => `Complex`
  ///     * `List`   => `List`
  ///     * `String` => `Text`
  ///     * `bool`   => `Boolean`
  ///     * `num`    => `Float64`
  ///     * `double` => `Float64`
  ///     * `int`    => `Int64`
  /// * [magnitude]: Measurement type of the size.
  /// * [unit]: Unit of measure that stores.
  const Definition(
      {String name = null,
      String slug = null,
      String description = null,
      id = null,
      initValue = null,
      Type type});
}
