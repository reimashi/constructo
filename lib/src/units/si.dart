import 'package:constructo/src/core/measure/magnitude.dart';
import 'package:constructo/src/core/measure/unit.dart';
import 'package:constructo/src/core/measure/unit_system.dart';

const SIName = "International System of Units";
const SIStandards = const ["ISO 80000", "IEC 80000"];

const SIConversion = const {
  "y": 1e-24,
  "z": 1e-21,
  "a": 1e-18,
  "f": 1e-15,
  "p": 1e-12,
  "n": 1e-9,
  "µ": 1e-6,
  "m": 1e-3,
  "c": 1e-2,
  "d": 1e-1,
  "": 1,
  "da": 1e1,
  "h": 1e2,
  "K": 1e3,
  "M": 1e6,
  "G": 1e9,
  "T": 1e12,
  "P": 1e15,
  "E": 1e18,
  "Z": 1e21,
  "Y": 1e24
};

class SIUnit extends Unit {
  final String scaleSymbol;
  final String unitSymbol;

  const SIUnit(UnitSystem system, String name, String scaleSymbol, String symbol, Magnitude magnitude)
      : this.scaleSymbol = scaleSymbol,
        this.unitSymbol = symbol,
        super(system, name, scaleSymbol + symbol, magnitude);

  num convert(Unit to, num value) {
    if (to is SIUnit && this.magnitude == to.magnitude && SIConversion.containsKey(to.scaleSymbol)) {
      num fromMultiplier = SIConversion[this.scaleSymbol];
      num toMultiplier = SIConversion[to.scaleSymbol];
      return value * fromMultiplier / toMultiplier;
    } else
      throw new Exception("${this.name} units can't be converted to ${to.name}");
  }
}
