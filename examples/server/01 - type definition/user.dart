import 'package:constructo/constructo.dart';
import 'package:constructo/constructo_types.dart' as Types;
import 'package:constructo/constructo_units_si.dart';
import 'utils.dart';

/// User of a computer system
@Definition(name: "User", slug: "user", id: "idWithOtherName")
@Permissions(user: "root", read: true, write: true)
@Permissions(group: "it_staff", read: true, write: false)
class User {
  int idWithOtherName;

  @Definition(description: "User real name")
  @Restrictions(
      required: isNameRequired,
      minLength: 1,
      maxLength: 20,
      inValues: const ["sam", "samantha"],
      match: "/[A-z]/",
      contains: "sam",
      sanitize: const[ StringSanitizer.Trim ])
  String name;

  static bool isNameRequired(String name, User user) {
    return user.age < 18;
  }

  @Definition(type: Types.UInt16)
  @Restrictions(required: true, minValue: 0.0, maxValue: 150)
  int age = 1;

  @Definition(unit: Kilogram)
  double weight = 50.0;
}