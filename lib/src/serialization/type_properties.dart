import 'package:constructo/constructo.dart';

class TypeProperties {
  final Definition definition;
  final Restrictions restrictions;
  final List<Permissions> permissions;

  TypeProperties(
      Definition definition,
      Restrictions restrictions,
      List<Permissions> permissions
      )
      : this.definition = definition,
        this.restrictions = restrictions,
        this.permissions = permissions;
}