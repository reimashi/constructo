//@MirrorsUsed()
import 'dart:mirrors';
import 'package:constructo/constructo.dart';
import 'type_properties.dart';

final RegExp SlugMatcher = new RegExp(r"^[A-z][A-z0-9_]{1,64}$");

/// Load definitions and properties of a dart object or type
class DataResolver {
  static Map<Symbol, TypeProperties> _metadataCache = {};

  ClassMirror _class;
  InstanceMirror _instance;
  TypeProperties _metadata;

  DataResolver(data) {
    if (data is Type) {
      this._class = reflectClass(data);
      this._instance = this._class.newInstance(new Symbol(''), []);
    }
    else {
      this._instance = reflect(data);
      this._class = this._instance.type;
    }

    if (!DataResolver._metadataCache.containsKey(this._class.qualifiedName)) {
      Definition baseDefinition = null;
      Restrictions baseRestrictions = null;
      List<Permissions> basePermissions = [];

      for (InstanceMirror s in this._class.metadata) {
        if (s.reflectee is Definition) {
          if (baseDefinition == null) {
            Definition loadDef = s.reflectee;
            Definition baseDef = _getBaseClassDefinition(this._class);

            baseDefinition = new Definition(
              name: loadDef.name == null || loadDef.name == "" ? baseDef.name : loadDef.name,
              slug: loadDef.slug == null || loadDef.slug == "" || !SlugMatcher.hasMatch(loadDef.slug) ? baseDef.slug : loadDef.slug,
              description: loadDef.description == null || loadDef.description == "" ? baseDef.description : loadDef.description,
              id: loadDef.id is List<String> ? loadDef.id : (loadDef.id == null ? [] : [loadDef.id.toString()]),
              type: loadDef.type ?? baseDef.type,
              unit: loadDef.unit
            );
          }
          else {
            throw new FormatException("${MirrorSystem.getName(this._class.qualifiedName)} contains more than one definition");
          }
        }
        else if (s.reflectee is Restrictions) {
          if (baseRestrictions == null) {
            baseRestrictions = s.reflectee;
          }
          else {
            throw new FormatException("${MirrorSystem.getName(this._class.qualifiedName)} contains more than one definition of restrictions");
          }
        }
        else if (s.reflectee is Permissions) {
          basePermissions.add(s.reflectee);
        }
      }

      // Definition fallback
      if (baseDefinition == null) baseDefinition = _getBaseClassDefinition(this._class);

      // Check slug collisions
      _metadataCache.forEach((Symbol key, TypeProperties value) {
        if (value.definition.slug == baseDefinition.slug) {
          throw new FormatException("Exists a conflict between this class ${MirrorSystem.getName(this._class.qualifiedName)} slug <${baseDefinition.slug}> and the slug of the class ${MirrorSystem.getName(key)}");
        }
      });

      if (baseDefinition.type == CType.Object) {
        // TODO: Load childs
      }

      // Add to definition cache
      this._metadata = new TypeProperties(baseDefinition, baseRestrictions, basePermissions);
      _metadataCache[this._class.qualifiedName] = this._metadata;
    }
    else {
      this._metadata = _metadataCache[this._class.qualifiedName];
    }
  }

  Definition get definition => this._metadata.definition;
  Restrictions get restrictions => this._metadata.restrictions;
  List<Permissions> get permissions => new List.from(this._metadata.permissions);

  /// Infers constructo definition from [classMirror].
  static Definition _getBaseClassDefinition(ClassMirror classMirror) {
    return new Definition(
        name: MirrorSystem.getName(classMirror.simpleName),
        slug: MirrorSystem.getName(classMirror.qualifiedName).replaceAll(".", "_"),
        description: "",
        id: null,
        type: _getType(classMirror),
        unit: null
    );
  }

  /// Infers constructo type from [classMirror] of dart type.
  static CType _getType(ClassMirror classMirror) {
    switch (classMirror.runtimeType) {
      case List:
        return CList;
      case String:
        return CString;
      case bool:
        return CBoolean;
      case int:
        return CInt;
      case DateTime:
        return CMoment;
      case num:
      case double:
        return CDouble;
      case Map:
      case Object:
      default:
        return CObject;
    }
  }
}