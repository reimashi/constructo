class Restrictions {
  /// Establish a set of restrictions to be validate
  /// [required] or not. Can be a function that returns a boolean value.
  /// [minValue] self-explanatory. Can compare numbers or objects that implement the interface core.Comparable.
  /// [maxValue] self-explanatory. Can compare numbers or objects that implement the interface core.Comparable.
  /// [minLength] self-explanatory. Can check string length or objects inherited from core.Set or Constructo.IEnumerable classes.
  /// [maxLength] self-explanatory. Can check string length or objects inherited from core.Set or Constructo.IEnumerable classes.
  /// Exact [length]. Can check string length or objects inherited from core.Set or Constructo.IEnumerable classes.
  /// Check if object value is [inValues]. Can be used to made variables of enumeration type.
  /// [match] is true if the variable is equal, regular expression is provided and match, or function callback return true.
  /// [contains] multiple values. If string, check substrings. If list, check elements.
  /// [sanitize] function or list of functions to apply to the value BEFORE the check.
  const Restrictions(
      {required = false,
      minValue = null,
      maxValue = null,
      num minLength = null,
      num maxLength = null,
      num length = null,
      List inValues = null,
      match = null,
      contains = null,
      sanitize = null});
}
