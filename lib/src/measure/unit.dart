import 'package:constructo/src/measure/magnitude.dart';
import 'unit_system.dart';

/// Unit of measurement
abstract class Unit {
  final UnitSystem unitSystem;
  final String name;
  final String symbol;
  final Magnitude magnitude;

  /// Declare a unit of measurement, with a [name] and a [symbol], which
  /// expresses a [magnitude] in a [unitSystem].
  const Unit(UnitSystem unitSystem,
      String name,
      String symbol,
      Magnitude magnitude)
      : this.unitSystem = unitSystem,
        this.name = name,
        this.symbol = symbol,
        this.magnitude = magnitude;

  /// Convert a [value] from this unit [to] other.
  num convert(Unit to, num value);
}
