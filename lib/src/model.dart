class Model {
  /// Establish the properties of an object
  /// Real [name]. If not provided, is extracted from the class or variable name.
  /// The [slug] is an internal name used to identificate the object uniquivocamente. If not provided, is extracted from [name].
  /// The [description] of the object or atribute.
  /// If [id] is set, two object are equals if his property/properties specified are equals.
  /// The canonical [type] in Constructo definition. Any direct equivalences are set by default for non inherited types:
  ///  - core.Object => Constructo.Object
  ///  - core.Map => Constructo.Object
  ///  - core.List => Constructo.List
  ///  - core.String => Constructo.String
  ///  - core.bool => Constructo.Boolean
  ///  - core.num => Constructo.Float64
  ///  - core.double => Constructo.Float64
  ///  - core.int => Constructo.Int64
  const Model(
      {String name = null,
      String slug = null,
      String description = null,
      id = null,
      Type type});
}
