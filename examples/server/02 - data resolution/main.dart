import 'package:constructo/constructo_serialization.dart';
import '../01 - type definition/user.dart';

main() {
  var user = new User();

  DataResolver dr = new DataResolver(user);
  print(dr.definition);
}

