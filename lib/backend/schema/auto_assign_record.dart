import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

/// Contains the USER_PROFILE Ids of Users in Deye Auto Assign Complaints
/// System.
///
/// Used for dynamic resolution of Auto Assigned IDs at runtime.
class AutoAssignRecord extends FirestoreRecord {
  AutoAssignRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "managerName" field.
  String? _managerName;
  String get managerName => _managerName ?? '';
  bool hasManagerName() => _managerName != null;

  // "managerId" field.
  String? _managerId;
  String get managerId => _managerId ?? '';
  bool hasManagerId() => _managerId != null;

  // "testManagerName" field.
  String? _testManagerName;
  String get testManagerName => _testManagerName ?? '';
  bool hasTestManagerName() => _testManagerName != null;

  // "testManagerId" field.
  String? _testManagerId;
  String get testManagerId => _testManagerId ?? '';
  bool hasTestManagerId() => _testManagerId != null;

  // "user1Name" field.
  String? _user1Name;
  String get user1Name => _user1Name ?? '';
  bool hasUser1Name() => _user1Name != null;

  // "user1Id" field.
  String? _user1Id;
  String get user1Id => _user1Id ?? '';
  bool hasUser1Id() => _user1Id != null;

  // "user2Name" field.
  String? _user2Name;
  String get user2Name => _user2Name ?? '';
  bool hasUser2Name() => _user2Name != null;

  // "user2Id" field.
  String? _user2Id;
  String get user2Id => _user2Id ?? '';
  bool hasUser2Id() => _user2Id != null;

  // "testUserName" field.
  String? _testUserName;
  String get testUserName => _testUserName ?? '';
  bool hasTestUserName() => _testUserName != null;

  // "testUserId" field.
  String? _testUserId;
  String get testUserId => _testUserId ?? '';
  bool hasTestUserId() => _testUserId != null;

  // "workloadCap" field.
  int? _workloadCap;
  int get workloadCap => _workloadCap ?? 0;
  bool hasWorkloadCap() => _workloadCap != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _managerName = snapshotData['managerName'] as String?;
    _managerId = snapshotData['managerId'] as String?;
    _testManagerName = snapshotData['testManagerName'] as String?;
    _testManagerId = snapshotData['testManagerId'] as String?;
    _user1Name = snapshotData['user1Name'] as String?;
    _user1Id = snapshotData['user1Id'] as String?;
    _user2Name = snapshotData['user2Name'] as String?;
    _user2Id = snapshotData['user2Id'] as String?;
    _testUserName = snapshotData['testUserName'] as String?;
    _testUserId = snapshotData['testUserId'] as String?;
    _workloadCap = castToType<int>(snapshotData['workloadCap']);
    _id = snapshotData['id'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('AUTO_ASSIGN')
          : FirebaseFirestore.instance.collectionGroup('AUTO_ASSIGN');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('AUTO_ASSIGN').doc(id);

  static Stream<AutoAssignRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AutoAssignRecord.fromSnapshot(s));

  static Future<AutoAssignRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AutoAssignRecord.fromSnapshot(s));

  static AutoAssignRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AutoAssignRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AutoAssignRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AutoAssignRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AutoAssignRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AutoAssignRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAutoAssignRecordData({
  String? managerName,
  String? managerId,
  String? testManagerName,
  String? testManagerId,
  String? user1Name,
  String? user1Id,
  String? user2Name,
  String? user2Id,
  String? testUserName,
  String? testUserId,
  int? workloadCap,
  String? id,
  bool? isActive,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'managerName': managerName,
      'managerId': managerId,
      'testManagerName': testManagerName,
      'testManagerId': testManagerId,
      'user1Name': user1Name,
      'user1Id': user1Id,
      'user2Name': user2Name,
      'user2Id': user2Id,
      'testUserName': testUserName,
      'testUserId': testUserId,
      'workloadCap': workloadCap,
      'id': id,
      'isActive': isActive,
    }.withoutNulls,
  );

  return firestoreData;
}

class AutoAssignRecordDocumentEquality implements Equality<AutoAssignRecord> {
  const AutoAssignRecordDocumentEquality();

  @override
  bool equals(AutoAssignRecord? e1, AutoAssignRecord? e2) {
    return e1?.managerName == e2?.managerName &&
        e1?.managerId == e2?.managerId &&
        e1?.testManagerName == e2?.testManagerName &&
        e1?.testManagerId == e2?.testManagerId &&
        e1?.user1Name == e2?.user1Name &&
        e1?.user1Id == e2?.user1Id &&
        e1?.user2Name == e2?.user2Name &&
        e1?.user2Id == e2?.user2Id &&
        e1?.testUserName == e2?.testUserName &&
        e1?.testUserId == e2?.testUserId &&
        e1?.workloadCap == e2?.workloadCap &&
        e1?.id == e2?.id &&
        e1?.isActive == e2?.isActive;
  }

  @override
  int hash(AutoAssignRecord? e) => const ListEquality().hash([
        e?.managerName,
        e?.managerId,
        e?.testManagerName,
        e?.testManagerId,
        e?.user1Name,
        e?.user1Id,
        e?.user2Name,
        e?.user2Id,
        e?.testUserName,
        e?.testUserId,
        e?.workloadCap,
        e?.id,
        e?.isActive
      ]);

  @override
  bool isValidKey(Object? o) => o is AutoAssignRecord;
}
