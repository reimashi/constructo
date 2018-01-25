import 'package:constructo/constructo.dart' as CTT;
import 'utils.dart';

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
      required: isNameRequired,
      minLength: 1,
      maxLength: 20,
      length: 14,
      inValues: const ["sam", "samuel"],
      match: "/[A-z]/",
      contains: "am",
      sanitize: const[
        StringSanitizer.Trim
      ])
  String name;

  static bool isNameRequired(String name, User user) {
    return user.age < 18;
  }

  @CTT.Definition(initValue: 1)
  @CTT.Restrictions(
      required: false, minValue: 1.0, maxValue: 8, inValues: const [1, 5, 7])
  int age;
}