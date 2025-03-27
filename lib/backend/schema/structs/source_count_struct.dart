// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SourceCountStruct extends FFFirebaseStruct {
  SourceCountStruct({
    String? name,
    int? count,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _count = count,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "count" field.
  int? _count;
  int get count => _count ?? 0;
  set count(int? val) => _count = val;

  void incrementCount(int amount) => count = count + amount;

  bool hasCount() => _count != null;

  static SourceCountStruct fromMap(Map<String, dynamic> data) =>
      SourceCountStruct(
        name: data['name'] as String?,
        count: castToType<int>(data['count']),
      );

  static SourceCountStruct? maybeFromMap(dynamic data) => data is Map
      ? SourceCountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'count': _count,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'count': serializeParam(
          _count,
          ParamType.int,
        ),
      }.withoutNulls;

  static SourceCountStruct fromSerializableMap(Map<String, dynamic> data) =>
      SourceCountStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        count: deserializeParam(
          data['count'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'SourceCountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SourceCountStruct &&
        name == other.name &&
        count == other.count;
  }

  @override
  int get hashCode => const ListEquality().hash([name, count]);
}

SourceCountStruct createSourceCountStruct({
  String? name,
  int? count,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SourceCountStruct(
      name: name,
      count: count,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SourceCountStruct? updateSourceCountStruct(
  SourceCountStruct? sourceCount, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sourceCount
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSourceCountStructData(
  Map<String, dynamic> firestoreData,
  SourceCountStruct? sourceCount,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sourceCount == null) {
    return;
  }
  if (sourceCount.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sourceCount.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sourceCountData =
      getSourceCountFirestoreData(sourceCount, forFieldValue);
  final nestedData =
      sourceCountData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sourceCount.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSourceCountFirestoreData(
  SourceCountStruct? sourceCount, [
  bool forFieldValue = false,
]) {
  if (sourceCount == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sourceCount.toMap());

  // Add any Firestore field values
  sourceCount.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSourceCountListFirestoreData(
  List<SourceCountStruct>? sourceCounts,
) =>
    sourceCounts?.map((e) => getSourceCountFirestoreData(e, true)).toList() ??
    [];
