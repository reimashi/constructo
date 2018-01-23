class Permissions {
  /// Access permissions for a [user] or [group] of users.
  ///
  /// A user that can [read], can see all objects of this type.
  ///
  /// A user that can [write], can create, modify or delete all objects of this type.
  ///
  /// The properties of an object inherit his permissions by default.
  /// In case of conflict, the true value is the most selective.
  ///
  /// (Ex: An user that can't write a object can modify a property if defined as write: true.)
  const Permissions(
      { String user = null,
        String group = null,
        bool read = null,
        bool write = null
      });
}