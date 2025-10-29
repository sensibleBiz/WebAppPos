// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamTreeDatatypeStruct extends FFFirebaseStruct {
  TeamTreeDatatypeStruct({
    String? id,
    String? username,
    String? userProfileId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _username = username,
        _userProfileId = userProfileId,
        super(firestoreUtilData);

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  set username(String? val) => _username = val;

  bool hasUsername() => _username != null;

  // "userProfileId" field.
  String? _userProfileId;
  String get userProfileId => _userProfileId ?? '';
  set userProfileId(String? val) => _userProfileId = val;

  bool hasUserProfileId() => _userProfileId != null;

  static TeamTreeDatatypeStruct fromMap(Map<String, dynamic> data) =>
      TeamTreeDatatypeStruct(
        id: data['id'] as String?,
        username: data['username'] as String?,
        userProfileId: data['userProfileId'] as String?,
      );

  static TeamTreeDatatypeStruct? maybeFromMap(dynamic data) => data is Map
      ? TeamTreeDatatypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'username': _username,
        'userProfileId': _userProfileId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'username': serializeParam(
          _username,
          ParamType.String,
        ),
        'userProfileId': serializeParam(
          _userProfileId,
          ParamType.String,
        ),
      }.withoutNulls;

  static TeamTreeDatatypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      TeamTreeDatatypeStruct(
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        username: deserializeParam(
          data['username'],
          ParamType.String,
          false,
        ),
        userProfileId: deserializeParam(
          data['userProfileId'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TeamTreeDatatypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeamTreeDatatypeStruct &&
        id == other.id &&
        username == other.username &&
        userProfileId == other.userProfileId;
  }

  @override
  int get hashCode => const ListEquality().hash([id, username, userProfileId]);
}

TeamTreeDatatypeStruct createTeamTreeDatatypeStruct({
  String? id,
  String? username,
  String? userProfileId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeamTreeDatatypeStruct(
      id: id,
      username: username,
      userProfileId: userProfileId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TeamTreeDatatypeStruct? updateTeamTreeDatatypeStruct(
  TeamTreeDatatypeStruct? teamTreeDatatype, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    teamTreeDatatype
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTeamTreeDatatypeStructData(
  Map<String, dynamic> firestoreData,
  TeamTreeDatatypeStruct? teamTreeDatatype,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (teamTreeDatatype == null) {
    return;
  }
  if (teamTreeDatatype.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && teamTreeDatatype.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final teamTreeDatatypeData =
      getTeamTreeDatatypeFirestoreData(teamTreeDatatype, forFieldValue);
  final nestedData =
      teamTreeDatatypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = teamTreeDatatype.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTeamTreeDatatypeFirestoreData(
  TeamTreeDatatypeStruct? teamTreeDatatype, [
  bool forFieldValue = false,
]) {
  if (teamTreeDatatype == null) {
    return {};
  }
  final firestoreData = mapToFirestore(teamTreeDatatype.toMap());

  // Add any Firestore field values
  teamTreeDatatype.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTeamTreeDatatypeListFirestoreData(
  List<TeamTreeDatatypeStruct>? teamTreeDatatypes,
) =>
    teamTreeDatatypes
        ?.map((e) => getTeamTreeDatatypeFirestoreData(e, true))
        .toList() ??
    [];
