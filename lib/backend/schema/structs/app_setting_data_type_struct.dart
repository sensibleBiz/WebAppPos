// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppSettingDataTypeStruct extends FFFirebaseStruct {
  AppSettingDataTypeStruct({
    String? display,
    bool? isDeleted,
    String? title,
    bool? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _display = display,
        _isDeleted = isDeleted,
        _title = title,
        _value = value,
        super(firestoreUtilData);

  // "display" field.
  String? _display;
  String get display => _display ?? '';
  set display(String? val) => _display = val;

  bool hasDisplay() => _display != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "value" field.
  bool? _value;
  bool get value => _value ?? false;
  set value(bool? val) => _value = val;

  bool hasValue() => _value != null;

  static AppSettingDataTypeStruct fromMap(Map<String, dynamic> data) =>
      AppSettingDataTypeStruct(
        display: data['display'] as String?,
        isDeleted: data['isDeleted'] as bool?,
        title: data['title'] as String?,
        value: data['value'] as bool?,
      );

  static AppSettingDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? AppSettingDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'display': _display,
        'isDeleted': _isDeleted,
        'title': _title,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'display': serializeParam(
          _display,
          ParamType.String,
        ),
        'isDeleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.bool,
        ),
      }.withoutNulls;

  static AppSettingDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AppSettingDataTypeStruct(
        display: deserializeParam(
          data['display'],
          ParamType.String,
          false,
        ),
        isDeleted: deserializeParam(
          data['isDeleted'],
          ParamType.bool,
          false,
        ),
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'AppSettingDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppSettingDataTypeStruct &&
        display == other.display &&
        isDeleted == other.isDeleted &&
        title == other.title &&
        value == other.value;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([display, isDeleted, title, value]);
}

AppSettingDataTypeStruct createAppSettingDataTypeStruct({
  String? display,
  bool? isDeleted,
  String? title,
  bool? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppSettingDataTypeStruct(
      display: display,
      isDeleted: isDeleted,
      title: title,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppSettingDataTypeStruct? updateAppSettingDataTypeStruct(
  AppSettingDataTypeStruct? appSettingDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appSettingDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppSettingDataTypeStructData(
  Map<String, dynamic> firestoreData,
  AppSettingDataTypeStruct? appSettingDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appSettingDataType == null) {
    return;
  }
  if (appSettingDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && appSettingDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appSettingDataTypeData =
      getAppSettingDataTypeFirestoreData(appSettingDataType, forFieldValue);
  final nestedData =
      appSettingDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      appSettingDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppSettingDataTypeFirestoreData(
  AppSettingDataTypeStruct? appSettingDataType, [
  bool forFieldValue = false,
]) {
  if (appSettingDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appSettingDataType.toMap());

  // Add any Firestore field values
  appSettingDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppSettingDataTypeListFirestoreData(
  List<AppSettingDataTypeStruct>? appSettingDataTypes,
) =>
    appSettingDataTypes
        ?.map((e) => getAppSettingDataTypeFirestoreData(e, true))
        .toList() ??
    [];
