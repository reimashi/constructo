enum CType {
  Object,
  List,
  Byte,
  Int,
  Double,
  Boolean,
  String,
  Moment,
  // Money // TODO: g10n support
}

// Shortcuts
const CObject = CType.Object;
const CList = CType.List;
const CByte = CType.Byte;
const CInt = CType.Int;
const CDouble = CType.Double;
const CBoolean = CType.Boolean;
const CString = CType.String;
const CMoment = CType.Moment;