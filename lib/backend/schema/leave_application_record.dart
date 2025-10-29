import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeaveApplicationRecord extends FirestoreRecord {
  LeaveApplicationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "userProfileId" field.
  String? _userProfileId;
  String get userProfileId => _userProfileId ?? '';
  bool hasUserProfileId() => _userProfileId != null;

  // "leaveType" field.
  String? _leaveType;
  String get leaveType => _leaveType ?? '';
  bool hasLeaveType() => _leaveType != null;

  // "duration" field.
  String? _duration;
  String get duration => _duration ?? '';
  bool hasDuration() => _duration != null;

  // "toDate" field.
  int? _toDate;
  int get toDate => _toDate ?? 0;
  bool hasToDate() => _toDate != null;

  // "fromDate" field.
  int? _fromDate;
  int get fromDate => _fromDate ?? 0;
  bool hasFromDate() => _fromDate != null;

  // "leaveNote" field.
  String? _leaveNote;
  String get leaveNote => _leaveNote ?? '';
  bool hasLeaveNote() => _leaveNote != null;

  // "managerId" field.
  String? _managerId;
  String get managerId => _managerId ?? '';
  bool hasManagerId() => _managerId != null;

  // "managerName" field.
  String? _managerName;
  String get managerName => _managerName ?? '';
  bool hasManagerName() => _managerName != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "updateddate" field.
  int? _updateddate;
  int get updateddate => _updateddate ?? 0;
  bool hasUpdateddate() => _updateddate != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "monthId" field.
  String? _monthId;
  String get monthId => _monthId ?? '';
  bool hasMonthId() => _monthId != null;

  // "leaveApplicationId" field.
  String? _leaveApplicationId;
  String get leaveApplicationId => _leaveApplicationId ?? '';
  bool hasLeaveApplicationId() => _leaveApplicationId != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  bool hasRemark() => _remark != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "noDays" field.
  double? _noDays;
  double get noDays => _noDays ?? 0.0;
  bool hasNoDays() => _noDays != null;

  // "actionTakenBy" field.
  String? _actionTakenBy;
  String get actionTakenBy => _actionTakenBy ?? '';
  bool hasActionTakenBy() => _actionTakenBy != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _userProfileId = snapshotData['userProfileId'] as String?;
    _leaveType = snapshotData['leaveType'] as String?;
    _duration = snapshotData['duration'] as String?;
    _toDate = castToType<int>(snapshotData['toDate']);
    _fromDate = castToType<int>(snapshotData['fromDate']);
    _leaveNote = snapshotData['leaveNote'] as String?;
    _managerId = snapshotData['managerId'] as String?;
    _managerName = snapshotData['managerName'] as String?;
    _status = snapshotData['status'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _updateddate = castToType<int>(snapshotData['updateddate']);
    _dayId = snapshotData['dayId'] as String?;
    _monthId = snapshotData['monthId'] as String?;
    _leaveApplicationId = snapshotData['leaveApplicationId'] as String?;
    _remark = snapshotData['remark'] as String?;
    _uid = snapshotData['uid'] as String?;
    _noDays = castToType<double>(snapshotData['noDays']);
    _actionTakenBy = snapshotData['actionTakenBy'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('LEAVE_APPLICATION')
          : FirebaseFirestore.instance.collectionGroup('LEAVE_APPLICATION');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('LEAVE_APPLICATION').doc(id);

  static Stream<LeaveApplicationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeaveApplicationRecord.fromSnapshot(s));

  static Future<LeaveApplicationRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => LeaveApplicationRecord.fromSnapshot(s));

  static LeaveApplicationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeaveApplicationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeaveApplicationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeaveApplicationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeaveApplicationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeaveApplicationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeaveApplicationRecordData({
  String? id,
  String? userProfileId,
  String? leaveType,
  String? duration,
  int? toDate,
  int? fromDate,
  String? leaveNote,
  String? managerId,
  String? managerName,
  String? status,
  int? createdDate,
  int? updateddate,
  String? dayId,
  String? monthId,
  String? leaveApplicationId,
  String? remark,
  String? uid,
  double? noDays,
  String? actionTakenBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'userProfileId': userProfileId,
      'leaveType': leaveType,
      'duration': duration,
      'toDate': toDate,
      'fromDate': fromDate,
      'leaveNote': leaveNote,
      'managerId': managerId,
      'managerName': managerName,
      'status': status,
      'createdDate': createdDate,
      'updateddate': updateddate,
      'dayId': dayId,
      'monthId': monthId,
      'leaveApplicationId': leaveApplicationId,
      'remark': remark,
      'uid': uid,
      'noDays': noDays,
      'actionTakenBy': actionTakenBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeaveApplicationRecordDocumentEquality
    implements Equality<LeaveApplicationRecord> {
  const LeaveApplicationRecordDocumentEquality();

  @override
  bool equals(LeaveApplicationRecord? e1, LeaveApplicationRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.userProfileId == e2?.userProfileId &&
        e1?.leaveType == e2?.leaveType &&
        e1?.duration == e2?.duration &&
        e1?.toDate == e2?.toDate &&
        e1?.fromDate == e2?.fromDate &&
        e1?.leaveNote == e2?.leaveNote &&
        e1?.managerId == e2?.managerId &&
        e1?.managerName == e2?.managerName &&
        e1?.status == e2?.status &&
        e1?.createdDate == e2?.createdDate &&
        e1?.updateddate == e2?.updateddate &&
        e1?.dayId == e2?.dayId &&
        e1?.monthId == e2?.monthId &&
        e1?.leaveApplicationId == e2?.leaveApplicationId &&
        e1?.remark == e2?.remark &&
        e1?.uid == e2?.uid &&
        e1?.noDays == e2?.noDays &&
        e1?.actionTakenBy == e2?.actionTakenBy;
  }

  @override
  int hash(LeaveApplicationRecord? e) => const ListEquality().hash([
        e?.id,
        e?.userProfileId,
        e?.leaveType,
        e?.duration,
        e?.toDate,
        e?.fromDate,
        e?.leaveNote,
        e?.managerId,
        e?.managerName,
        e?.status,
        e?.createdDate,
        e?.updateddate,
        e?.dayId,
        e?.monthId,
        e?.leaveApplicationId,
        e?.remark,
        e?.uid,
        e?.noDays,
        e?.actionTakenBy
      ]);

  @override
  bool isValidKey(Object? o) => o is LeaveApplicationRecord;
}
