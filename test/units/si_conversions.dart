import 'package:constructo/constructo_units_si.dart';
import 'package:test/test.dart';

void main() {
  group('SI Mass. Conversions', () {
    setUp(() {
    });

    test('Kg => g', () {
      expect(Kilogram.convert(Gram, 10), 10000);
    });

    test('g => Kg', () {
      expect(Gram.convert(Kilogram, 10000), 10);
    });
  });
}
