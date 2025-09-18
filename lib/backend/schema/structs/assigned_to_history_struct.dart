// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AssignedToHistoryStruct extends FFFirebaseStruct {
  AssignedToHistoryStruct({
    String? userProfileId,
    int? assignedDate,
    DateTime? assignedDateTime,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _userProfileId = userProfileId,
        _assignedDate = assignedDate,
        _assignedDateTime = assignedDateTime,
        super(firestoreUtilData);

  // "userProfileId" field.
  String? _userProfileId;
  String get userProfileId => _userProfileId ?? '';
  set userProfileId(String? val) => _userProfileId = val;

  bool hasUserProfileId() => _userProfileId != null;

  // "assignedDate" field.
  int? _assignedDate;
  int get assignedDate => _assignedDate ?? 0;
  set assignedDate(int? val) => _assignedDate = val;

  void incrementAssignedDate(int amount) =>
      assignedDate = assignedDate + amount;

  bool hasAssignedDate() => _assignedDate != null;

  // "assignedDateTime" field.
  DateTime? _assignedDateTime;
  DateTime? get assignedDateTime => _assignedDateTime;
  set assignedDateTime(DateTime? val) => _assignedDateTime = val;

  bool hasAssignedDateTime() => _assignedDateTime != null;

  static AssignedToHistoryStruct fromMap(Map<String, dynamic> data) =>
      AssignedToHistoryStruct(
        userProfileId: data['userProfileId'] as String?,
        assignedDate: castToType<int>(data['assignedDate']),
        assignedDateTime: data['assignedDateTime'] as DateTime?,
      );

  static AssignedToHistoryStruct? maybeFromMap(dynamic data) => data is Map
      ? AssignedToHistoryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'userProfileId': _userProfileId,
        'assignedDate': _assignedDate,
        'assignedDateTime': _assignedDateTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'userProfileId': serializeParam(
          _userProfileId,
          ParamType.String,
        ),
        'assignedDate': serializeParam(
          _assignedDate,
          ParamType.int,
        ),
        'assignedDateTime': serializeParam(
          _assignedDateTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AssignedToHistoryStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AssignedToHistoryStruct(
        userProfileId: deserializeParam(
          data['userProfileId'],
          ParamType.String,
          false,
        ),
        assignedDate: deserializeParam(
          data['assignedDate'],
          ParamType.int,
          false,
        ),
        assignedDateTime: deserializeParam(
          data['assignedDateTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AssignedToHistoryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AssignedToHistoryStruct &&
        userProfileId == other.userProfileId &&
        assignedDate == other.assignedDate &&
        assignedDateTime == other.assignedDateTime;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([userProfileId, assignedDate, assignedDateTime]);
}

AssignedToHistoryStruct createAssignedToHistoryStruct({
  String? userProfileId,
  int? assignedDate,
  DateTime? assignedDateTime,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AssignedToHistoryStruct(
      userProfileId: userProfileId,
      assignedDate: assignedDate,
      assignedDateTime: assignedDateTime,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AssignedToHistoryStruct? updateAssignedToHistoryStruct(
  AssignedToHistoryStruct? assignedToHistory, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    assignedToHistory
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAssignedToHistoryStructData(
  Map<String, dynamic> firestoreData,
  AssignedToHistoryStruct? assignedToHistory,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (assignedToHistory == null) {
    return;
  }
  if (assignedToHistory.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && assignedToHistory.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final assignedToHistoryData =
      getAssignedToHistoryFirestoreData(assignedToHistory, forFieldValue);
  final nestedData =
      assignedToHistoryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = assignedToHistory.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAssignedToHistoryFirestoreData(
  AssignedToHistoryStruct? assignedToHistory, [
  bool forFieldValue = false,
]) {
  if (assignedToHistory == null) {
    return {};
  }
  final firestoreData = mapToFirestore(assignedToHistory.toMap());

  // Add any Firestore field values
  assignedToHistory.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAssignedToHistoryListFirestoreData(
  List<AssignedToHistoryStruct>? assignedToHistorys,
) =>
    assignedToHistorys
        ?.map((e) => getAssignedToHistoryFirestoreData(e, true))
        .toList() ??
    [];
