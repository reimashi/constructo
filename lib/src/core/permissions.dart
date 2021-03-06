/// Define access permissions.
class Permissions {
  /// Access permissions for a [user] or [group] of users.
  ///
  /// A [user]/[group] that can [read], can see all objects of this type.
  ///
  /// A [user]/[group] that can [write], can create, modify or delete all objects of this type.
  ///
  /// The properties of an object inherit his permissions by default.
  /// In case of conflict, the true value is the most selective.
  ///
  /// (Example: An user that can't write a object can modify a property if defined as write: true).
  const Permissions(
      { String user = null,
        String group = null,
        bool read = false,
        bool write = false
      });
}