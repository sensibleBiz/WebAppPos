// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CallLogNameStruct extends FFFirebaseStruct {
  CallLogNameStruct({
    String? name,
    List<int>? stats,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _stats = stats,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "stats" field.
  List<int>? _stats;
  List<int> get stats => _stats ?? const [];
  set stats(List<int>? val) => _stats = val;

  void updateStats(Function(List<int>) updateFn) {
    updateFn(_stats ??= []);
  }

  bool hasStats() => _stats != null;

  static CallLogNameStruct fromMap(Map<String, dynamic> data) =>
      CallLogNameStruct(
        name: data['name'] as String?,
        stats: getDataList(data['stats']),
      );

  static CallLogNameStruct? maybeFromMap(dynamic data) => data is Map
      ? CallLogNameStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'stats': _stats,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'stats': serializeParam(
          _stats,
          ParamType.int,
          isList: true,
        ),
      }.withoutNulls;

  static CallLogNameStruct fromSerializableMap(Map<String, dynamic> data) =>
      CallLogNameStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        stats: deserializeParam<int>(
          data['stats'],
          ParamType.int,
          true,
        ),
      );

  @override
  String toString() => 'CallLogNameStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CallLogNameStruct &&
        name == other.name &&
        listEquality.equals(stats, other.stats);
  }

  @override
  int get hashCode => const ListEquality().hash([name, stats]);
}

CallLogNameStruct createCallLogNameStruct({
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CallLogNameStruct(
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CallLogNameStruct? updateCallLogNameStruct(
  CallLogNameStruct? callLogName, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    callLogName
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCallLogNameStructData(
  Map<String, dynamic> firestoreData,
  CallLogNameStruct? callLogName,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (callLogName == null) {
    return;
  }
  if (callLogName.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && callLogName.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final callLogNameData =
      getCallLogNameFirestoreData(callLogName, forFieldValue);
  final nestedData =
      callLogNameData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = callLogName.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCallLogNameFirestoreData(
  CallLogNameStruct? callLogName, [
  bool forFieldValue = false,
]) {
  if (callLogName == null) {
    return {};
  }
  final firestoreData = mapToFirestore(callLogName.toMap());

  // Add any Firestore field values
  callLogName.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCallLogNameListFirestoreData(
  List<CallLogNameStruct>? callLogNames,
) =>
    callLogNames?.map((e) => getCallLogNameFirestoreData(e, true)).toList() ??
    [];
