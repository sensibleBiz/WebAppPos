import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamTreeRecord extends FirestoreRecord {
  TeamTreeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "userName" field.
  String? _userName;
  String get userName => _userName ?? '';
  bool hasUserName() => _userName != null;

  // "userProfileId" field.
  String? _userProfileId;
  String get userProfileId => _userProfileId ?? '';
  bool hasUserProfileId() => _userProfileId != null;

  // "teamHeadProfileId" field.
  String? _teamHeadProfileId;
  String get teamHeadProfileId => _teamHeadProfileId ?? '';
  bool hasTeamHeadProfileId() => _teamHeadProfileId != null;

  // "zone" field.
  String? _zone;
  String get zone => _zone ?? '';
  bool hasZone() => _zone != null;

  // "roleInZone" field.
  String? _roleInZone;
  String get roleInZone => _roleInZone ?? '';
  bool hasRoleInZone() => _roleInZone != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "zoneHeadProfileId" field.
  String? _zoneHeadProfileId;
  String get zoneHeadProfileId => _zoneHeadProfileId ?? '';
  bool hasZoneHeadProfileId() => _zoneHeadProfileId != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "zoneList" field.
  List<String>? _zoneList;
  List<String> get zoneList => _zoneList ?? const [];
  bool hasZoneList() => _zoneList != null;

  // "stageAccessList" field.
  List<StageAccessDataTypeStruct>? _stageAccessList;
  List<StageAccessDataTypeStruct> get stageAccessList =>
      _stageAccessList ?? const [];
  bool hasStageAccessList() => _stageAccessList != null;

  // "workMode" field.
  String? _workMode;
  String get workMode => _workMode ?? '';
  bool hasWorkMode() => _workMode != null;

  // "team" field.
  String? _team;
  String get team => _team ?? '';
  bool hasTeam() => _team != null;

  // "isOnPayRoll" field.
  bool? _isOnPayRoll;
  bool get isOnPayRoll => _isOnPayRoll ?? false;
  bool hasIsOnPayRoll() => _isOnPayRoll != null;

  // "code" field.
  String? _code;
  String get code => _code ?? '';
  bool hasCode() => _code != null;

  // "onRole" field.
  bool? _onRole;
  bool get onRole => _onRole ?? false;
  bool hasOnRole() => _onRole != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _userName = snapshotData['userName'] as String?;
    _userProfileId = snapshotData['userProfileId'] as String?;
    _teamHeadProfileId = snapshotData['teamHeadProfileId'] as String?;
    _zone = snapshotData['zone'] as String?;
    _roleInZone = snapshotData['roleInZone'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _zoneHeadProfileId = snapshotData['zoneHeadProfileId'] as String?;
    _uid = snapshotData['uid'] as String?;
    _zoneList = getDataList(snapshotData['zoneList']);
    _stageAccessList = getStructList(
      snapshotData['stageAccessList'],
      StageAccessDataTypeStruct.fromMap,
    );
    _workMode = snapshotData['workMode'] as String?;
    _team = snapshotData['team'] as String?;
    _isOnPayRoll = snapshotData['isOnPayRoll'] as bool?;
    _code = snapshotData['code'] as String?;
    _onRole = snapshotData['onRole'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('TEAM_TREE')
          : FirebaseFirestore.instance.collectionGroup('TEAM_TREE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('TEAM_TREE').doc(id);

  static Stream<TeamTreeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TeamTreeRecord.fromSnapshot(s));

  static Future<TeamTreeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TeamTreeRecord.fromSnapshot(s));

  static TeamTreeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TeamTreeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TeamTreeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TeamTreeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TeamTreeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TeamTreeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTeamTreeRecordData({
  String? id,
  String? userName,
  String? userProfileId,
  String? teamHeadProfileId,
  String? zone,
  String? roleInZone,
  bool? isActive,
  String? zoneHeadProfileId,
  String? uid,
  String? workMode,
  String? team,
  bool? isOnPayRoll,
  String? code,
  bool? onRole,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'userName': userName,
      'userProfileId': userProfileId,
      'teamHeadProfileId': teamHeadProfileId,
      'zone': zone,
      'roleInZone': roleInZone,
      'isActive': isActive,
      'zoneHeadProfileId': zoneHeadProfileId,
      'uid': uid,
      'workMode': workMode,
      'team': team,
      'isOnPayRoll': isOnPayRoll,
      'code': code,
      'onRole': onRole,
    }.withoutNulls,
  );

  return firestoreData;
}

class TeamTreeRecordDocumentEquality implements Equality<TeamTreeRecord> {
  const TeamTreeRecordDocumentEquality();

  @override
  bool equals(TeamTreeRecord? e1, TeamTreeRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.userName == e2?.userName &&
        e1?.userProfileId == e2?.userProfileId &&
        e1?.teamHeadProfileId == e2?.teamHeadProfileId &&
        e1?.zone == e2?.zone &&
        e1?.roleInZone == e2?.roleInZone &&
        e1?.isActive == e2?.isActive &&
        e1?.zoneHeadProfileId == e2?.zoneHeadProfileId &&
        e1?.uid == e2?.uid &&
        listEquality.equals(e1?.zoneList, e2?.zoneList) &&
        listEquality.equals(e1?.stageAccessList, e2?.stageAccessList) &&
        e1?.workMode == e2?.workMode &&
        e1?.team == e2?.team &&
        e1?.isOnPayRoll == e2?.isOnPayRoll &&
        e1?.code == e2?.code &&
        e1?.onRole == e2?.onRole;
  }

  @override
  int hash(TeamTreeRecord? e) => const ListEquality().hash([
        e?.id,
        e?.userName,
        e?.userProfileId,
        e?.teamHeadProfileId,
        e?.zone,
        e?.roleInZone,
        e?.isActive,
        e?.zoneHeadProfileId,
        e?.uid,
        e?.zoneList,
        e?.stageAccessList,
        e?.workMode,
        e?.team,
        e?.isOnPayRoll,
        e?.code,
        e?.onRole
      ]);

  @override
  bool isValidKey(Object? o) => o is TeamTreeRecord;
}
