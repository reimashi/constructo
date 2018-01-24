import 'package:constructo/constructo.dart' as CTT;

main() {
  var user = new User();
}

class TestExpressions {
  static bool ParentContains(String field, User parent) {
    return parent.age > 18;
  }

  static String Trim(String field) {
    return field.toString().trim();
  }
}

@CTT.Definition(
    name: "User",
    slug: "user",
    id: const ["name", "age"],
    description: "User of the system",
    type: CTT.Object)
@CTT.Permissions(
    user: "testuser",
    group: "testgroup",
    read: true,
    write: true
)
class User {
  @CTT.Definition(
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

  @CTT.Definition(initValue: 1)
  @CTT.Restrictions(
      required: false, minValue: 1.0, maxValue: 8, inValues: const [1, 5, 7])
  int age;
}
