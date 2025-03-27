// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadCountStruct extends FFFirebaseStruct {
  LeadCountStruct({
    String? stage,
    List<SourceCountStruct>? sourceList,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _stage = stage,
        _sourceList = sourceList,
        super(firestoreUtilData);

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  set stage(String? val) => _stage = val;

  bool hasStage() => _stage != null;

  // "sourceList" field.
  List<SourceCountStruct>? _sourceList;
  List<SourceCountStruct> get sourceList => _sourceList ?? const [];
  set sourceList(List<SourceCountStruct>? val) => _sourceList = val;

  void updateSourceList(Function(List<SourceCountStruct>) updateFn) {
    updateFn(_sourceList ??= []);
  }

  bool hasSourceList() => _sourceList != null;

  static LeadCountStruct fromMap(Map<String, dynamic> data) => LeadCountStruct(
        stage: data['stage'] as String?,
        sourceList: getStructList(
          data['sourceList'],
          SourceCountStruct.fromMap,
        ),
      );

  static LeadCountStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadCountStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'stage': _stage,
        'sourceList': _sourceList?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'stage': serializeParam(
          _stage,
          ParamType.String,
        ),
        'sourceList': serializeParam(
          _sourceList,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static LeadCountStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeadCountStruct(
        stage: deserializeParam(
          data['stage'],
          ParamType.String,
          false,
        ),
        sourceList: deserializeStructParam<SourceCountStruct>(
          data['sourceList'],
          ParamType.DataStruct,
          true,
          structBuilder: SourceCountStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'LeadCountStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LeadCountStruct &&
        stage == other.stage &&
        listEquality.equals(sourceList, other.sourceList);
  }

  @override
  int get hashCode => const ListEquality().hash([stage, sourceList]);
}

LeadCountStruct createLeadCountStruct({
  String? stage,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadCountStruct(
      stage: stage,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadCountStruct? updateLeadCountStruct(
  LeadCountStruct? leadCount, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadCount
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadCountStructData(
  Map<String, dynamic> firestoreData,
  LeadCountStruct? leadCount,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadCount == null) {
    return;
  }
  if (leadCount.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadCount.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadCountData = getLeadCountFirestoreData(leadCount, forFieldValue);
  final nestedData = leadCountData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = leadCount.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadCountFirestoreData(
  LeadCountStruct? leadCount, [
  bool forFieldValue = false,
]) {
  if (leadCount == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadCount.toMap());

  // Add any Firestore field values
  leadCount.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadCountListFirestoreData(
  List<LeadCountStruct>? leadCounts,
) =>
    leadCounts?.map((e) => getLeadCountFirestoreData(e, true)).toList() ?? [];
