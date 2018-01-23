import 'package:constructo/constructo.dart' as CTT;

main() {
  var user = new User();
}

class TestExpressions {
  static bool ParentContains(object, parent) {
    return parent.age > 18;
  }

  static String Trim(object) {
    return object.toString().trim();
  }
}

@CTT.Model(
    name: "User",
    slug: "user",
    id: const ["name", "age"],
    description: "User of the system",
    type: CTT.Object)
class User {
  @CTT.Model(
      name: "Name",
      slug: "name",
      description: "User of the system",
      type: CTT.String)
  @CTT.Restrictions(
      required: TestExpressions.ParentContains,
      minLength: 1,
      maxLength: 20,
      length: 14,
      inValues: const ["sam", "samuel"],
      match: "/[A-z]/",
      contains: "am",
      sanitize: TestExpressions.Trim)
  String name;

  @CTT.Restrictions(
      required: false, minValue: 1.0, maxValue: 8, inValues: const [1, 5, 7])
  int age;
}
