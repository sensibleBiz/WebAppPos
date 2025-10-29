// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StageAccessDataTypeStruct extends FFFirebaseStruct {
  StageAccessDataTypeStruct({
    String? id,
    String? title,
    int? value,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _title = title,
        _value = value,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  set title(String? val) => _title = val;

  bool hasTitle() => _title != null;

  // "value" field.
  int? _value;
  int get value => _value ?? 0;
  set value(int? val) => _value = val;

  void incrementValue(int amount) => value = value + amount;

  bool hasValue() => _value != null;

  static StageAccessDataTypeStruct fromMap(Map<String, dynamic> data) =>
      StageAccessDataTypeStruct(
        id: data['id'] as String?,
        title: data['title'] as String?,
        value: castToType<int>(data['value']),
      );

  static StageAccessDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? StageAccessDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'title': _title,
        'value': _value,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'title': serializeParam(
          _title,
          ParamType.String,
        ),
        'value': serializeParam(
          _value,
          ParamType.int,
        ),
      }.withoutNulls;

  static StageAccessDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      StageAccessDataTypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
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
  String toString() => 'StageAccessDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StageAccessDataTypeStruct &&
        id == other.id &&
        title == other.title &&
        value == other.value;
  }

  @override
  int get hashCode => const ListEquality().hash([id, title, value]);
}

StageAccessDataTypeStruct createStageAccessDataTypeStruct({
  String? id,
  String? title,
  int? value,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StageAccessDataTypeStruct(
      id: id,
      title: title,
      value: value,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StageAccessDataTypeStruct? updateStageAccessDataTypeStruct(
  StageAccessDataTypeStruct? stageAccessDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stageAccessDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStageAccessDataTypeStructData(
  Map<String, dynamic> firestoreData,
  StageAccessDataTypeStruct? stageAccessDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stageAccessDataType == null) {
    return;
  }
  if (stageAccessDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stageAccessDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stageAccessDataTypeData =
      getStageAccessDataTypeFirestoreData(stageAccessDataType, forFieldValue);
  final nestedData =
      stageAccessDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      stageAccessDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStageAccessDataTypeFirestoreData(
  StageAccessDataTypeStruct? stageAccessDataType, [
  bool forFieldValue = false,
]) {
  if (stageAccessDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stageAccessDataType.toMap());

  // Add any Firestore field values
  stageAccessDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStageAccessDataTypeListFirestoreData(
  List<StageAccessDataTypeStruct>? stageAccessDataTypes,
) =>
    stageAccessDataTypes
        ?.map((e) => getStageAccessDataTypeFirestoreData(e, true))
        .toList() ??
    [];
