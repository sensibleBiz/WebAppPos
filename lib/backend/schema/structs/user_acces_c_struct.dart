// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserAccesCStruct extends FFFirebaseStruct {
  UserAccesCStruct({
    String? title,
    int? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _title = title,
        _value = value,
        super(firestoreUtilData);

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;
  bool hasTitle() => _title != null;

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  set value(int? val) => _value = val;
  void incrementValue(int amount) => _value = value + amount;
  bool hasValue() => _value != null;

  static UserAccesCStruct fromMap(Map<String, dynamic> data) =>
      UserAccesCStruct(
        title: data['title'] as String?,
        value: castToType<int>(data['value']),
      );

  static UserAccesCStruct? maybeFromMap(dynamic data) => data is Map
      ? UserAccesCStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'title': _title,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserAccesCStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserAccesCStruct(
        title: deserializeParam(
          data['title'],
          ParamType.String,
          false,
        ),
        value: deserializeParam(
          data['value'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserAccesCStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserAccesCStruct &&
        title == other.title &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([title, value]);
}

UserAccesCStruct createUserAccesCStruct({
  String? title,
  int? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    UserAccesCStruct(
      title: title,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

UserAccesCStruct? updateUserAccesCStruct(
  UserAccesCStruct? userAccesC, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    userAccesC
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addUserAccesCStructData(
  Map<String, dynamic> firestoreData,
  UserAccesCStruct? userAccesC,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (userAccesC == null) {
    return;
  }
  if (userAccesC.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && userAccesC.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final userAccesCData = getUserAccesCFirestoreData(userAccesC, forFieldValue);
  final nestedData = userAccesCData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = userAccesC.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getUserAccesCFirestoreData(
  UserAccesCStruct? userAccesC, [
  bool forFieldValue = false,
]) {
  if (userAccesC == null) {
    return {};
  }
  final firestoreData = mapToFirestore(userAccesC.toMap());

  // Add any Firestore field values
  userAccesC.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getUserAccesCListFirestoreData(
  List<UserAccesCStruct>? userAccesCs,
) =>
    userAccesCs?.map((e) => getUserAccesCFirestoreData(e, true)).toList() ?? [];
