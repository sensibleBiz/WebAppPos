import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadFollowUpRecord extends FirestoreRecord {
  LeadFollowUpRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  int? _date;
  int get date => _date ?? 0;
  bool hasDate() => _date != null;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  bool hasTime() => _time != null;

  // "followUpName" field.
  String? _followUpName;
  String get followUpName => _followUpName ?? '';
  bool hasFollowUpName() => _followUpName != null;

  // "leadPriority" field.
  String? _leadPriority;
  String get leadPriority => _leadPriority ?? '';
  bool hasLeadPriority() => _leadPriority != null;

  // "assignedTo" field.
  String? _assignedTo;
  String get assignedTo => _assignedTo ?? '';
  bool hasAssignedTo() => _assignedTo != null;

  // "discription" field.
  String? _discription;
  String get discription => _discription ?? '';
  bool hasDiscription() => _discription != null;

  // "leadMRefId" field.
  String? _leadMRefId;
  String get leadMRefId => _leadMRefId ?? '';
  bool hasLeadMRefId() => _leadMRefId != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = castToType<int>(snapshotData['date']);
    _time = castToType<int>(snapshotData['time']);
    _followUpName = snapshotData['followUpName'] as String?;
    _leadPriority = snapshotData['leadPriority'] as String?;
    _assignedTo = snapshotData['assignedTo'] as String?;
    _discription = snapshotData['discription'] as String?;
    _leadMRefId = snapshotData['leadMRefId'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('LEAD_FOLLOW_UP')
          : FirebaseFirestore.instance.collectionGroup('LEAD_FOLLOW_UP');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('LEAD_FOLLOW_UP').doc(id);

  static Stream<LeadFollowUpRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadFollowUpRecord.fromSnapshot(s));

  static Future<LeadFollowUpRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadFollowUpRecord.fromSnapshot(s));

  static LeadFollowUpRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadFollowUpRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadFollowUpRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadFollowUpRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadFollowUpRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadFollowUpRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadFollowUpRecordData({
  int? date,
  int? time,
  String? followUpName,
  String? leadPriority,
  String? assignedTo,
  String? discription,
  String? leadMRefId,
  String? mobile,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'time': time,
      'followUpName': followUpName,
      'leadPriority': leadPriority,
      'assignedTo': assignedTo,
      'discription': discription,
      'leadMRefId': leadMRefId,
      'mobile': mobile,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadFollowUpRecordDocumentEquality
    implements Equality<LeadFollowUpRecord> {
  const LeadFollowUpRecordDocumentEquality();

  @override
  bool equals(LeadFollowUpRecord? e1, LeadFollowUpRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.followUpName == e2?.followUpName &&
        e1?.leadPriority == e2?.leadPriority &&
        e1?.assignedTo == e2?.assignedTo &&
        e1?.discription == e2?.discription &&
        e1?.leadMRefId == e2?.leadMRefId &&
        e1?.mobile == e2?.mobile &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(LeadFollowUpRecord? e) => const ListEquality().hash([
        e?.date,
        e?.time,
        e?.followUpName,
        e?.leadPriority,
        e?.assignedTo,
        e?.discription,
        e?.leadMRefId,
        e?.mobile,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is LeadFollowUpRecord;
}
