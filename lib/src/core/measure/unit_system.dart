import 'magnitude.dart';

/// Unit system of measurement
class UnitSystem {
  final String name;
  final List<String> standards;
  final Magnitude magnitude;

  /// Declares a unit system of measurement, with a [name], which expresses
  /// a [magnitude] and defined by some [standards].
  const UnitSystem(String name, List<String> standards, Magnitude magnitude)
      : this.name = name,
        this.standards = standards,
        this.magnitude = magnitude;
}
