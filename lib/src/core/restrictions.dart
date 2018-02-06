/// Set of restrictions for an object to be validate.
class Restrictions {
  /// Sets restrictions for an object.
  ///
  /// * [required]: The value must be not null (or not). Can be a function that returns a boolean value. Function prototype `(value) => { return bool; }`
  /// * [minValue]: self-explanatory. Can compare numbers or objects that implement the interface core.Comparable.
  /// * [maxValue]: self-explanatory. Can compare numbers or objects that implement the interface core.Comparable.
  /// * [minLength]: self-explanatory. Can check string length or objects inherited from core.Set or Constructo.IEnumerable classes.
  /// * [maxLength]: self-explanatory. Can check string length or objects inherited from core.Set or Constructo.IEnumerable classes.
  /// * [length]: Check the exact length. Can check string length or objects inherited from core.Set or Constructo.IEnumerable classes.
  /// * [inValues]: The value must be one of these. Can be used to made variables of enumeration type.
  /// * [match]: Check if the value is equal than, a regular expression that validate, or function callback that returns true. Function prototype `(value) => { return bool; }`
  /// * [contains]: Check if the variable contains one ore more of these values.
  ///     * If string, check substrings.
  ///     * If list, check elements.
  ///     * If function, must satisfy the prototype `(value) => { return bool; }`
  /// * [sanitize] function or list of functions to apply to the value BEFORE the check. Function prototype `(value) => { return newValue; }`
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
