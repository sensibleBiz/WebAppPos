// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadTagListStruct extends FFFirebaseStruct {
  LeadTagListStruct({
    int? code,
    bool? isDeleted,
    String? leadTagName,
    String? type,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _isDeleted = isDeleted,
        _leadTagName = leadTagName,
        _type = type,
        super(firestoreUtilData);

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;
  void incrementCode(int amount) => _code = code + amount;
  bool hasCode() => _code != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;
  bool hasIsDeleted() => _isDeleted != null;

  // "leadTagName" field.
  String? _leadTagName;
  String get leadTagName => _leadTagName ?? '';
  set leadTagName(String? val) => _leadTagName = val;
  bool hasLeadTagName() => _leadTagName != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;
  bool hasType() => _type != null;

  static LeadTagListStruct fromMap(Map<String, dynamic> data) =>
      LeadTagListStruct(
        code: castToType<int>(data['code']),
        isDeleted: data['isDeleted'] as bool?,
        leadTagName: data['leadTagName'] as String?,
        type: data['type'] as String?,
      );

  static LeadTagListStruct? maybeFromMap(dynamic data) => data is Map
      ? LeadTagListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'isDeleted': _isDeleted,
        'leadTagName': _leadTagName,
        'type': _type,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'isDeleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'leadTagName': serializeParam(
          _leadTagName,
          ParamType.String,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
      }.withoutNulls;

  static LeadTagListStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeadTagListStruct(
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        isDeleted: deserializeParam(
          data['isDeleted'],
          ParamType.bool,
          false,
        ),
        leadTagName: deserializeParam(
          data['leadTagName'],
          ParamType.String,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LeadTagListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeadTagListStruct &&
        code == other.code &&
        isDeleted == other.isDeleted &&
        leadTagName == other.leadTagName &&
        type == other.type;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([code, isDeleted, leadTagName, type]);
}

LeadTagListStruct createLeadTagListStruct({
  int? code,
  bool? isDeleted,
  String? leadTagName,
  String? type,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LeadTagListStruct(
      code: code,
      isDeleted: isDeleted,
      leadTagName: leadTagName,
      type: type,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LeadTagListStruct? updateLeadTagListStruct(
  LeadTagListStruct? leadTagList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    leadTagList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLeadTagListStructData(
  Map<String, dynamic> firestoreData,
  LeadTagListStruct? leadTagList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (leadTagList == null) {
    return;
  }
  if (leadTagList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && leadTagList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final leadTagListData =
      getLeadTagListFirestoreData(leadTagList, forFieldValue);
  final nestedData =
      leadTagListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = leadTagList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLeadTagListFirestoreData(
  LeadTagListStruct? leadTagList, [
  bool forFieldValue = false,
]) {
  if (leadTagList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(leadTagList.toMap());

  // Add any Firestore field values
  leadTagList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLeadTagListListFirestoreData(
  List<LeadTagListStruct>? leadTagLists,
) =>
    leadTagLists?.map((e) => getLeadTagListFirestoreData(e, true)).toList() ??
    [];
