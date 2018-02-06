import 'package:constructo/constructo.dart';
import 'package:constructo/constructo_serialization.dart';
import 'package:test/test.dart';

@Definition(name: "Test")
@Definition(slug: "class")
class TestClass1 {}

@Restrictions()
@Restrictions()
class TestClass2 extends TestClass1 {}

class TestClass3 {}

@Definition(slug: "_TestClass3")
class TestClass4 {}

void main() {
  group('Data resolver. Parsing classes', () {
    setUp(() {});

    test('Double definition exception', () {
      expect(() => new DataResolver(TestClass1), throwsFormatException);
    });

    test('Double restrictions exception', () {
      expect(() => new DataResolver(TestClass2), throwsFormatException);
    });

    test('Duplicate slug exception', () {
      new DataResolver(TestClass3);
      expect(() => new DataResolver(TestClass4), throwsFormatException);
    });
  });
}
