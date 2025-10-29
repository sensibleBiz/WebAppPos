import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadActivitiesRecord extends FirestoreRecord {
  LeadActivitiesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "leadRefId" field.
  String? _leadRefId;
  String get leadRefId => _leadRefId ?? '';
  bool hasLeadRefId() => _leadRefId != null;

  // "scheduledDate" field.
  int? _scheduledDate;
  int get scheduledDate => _scheduledDate ?? 0;
  bool hasScheduledDate() => _scheduledDate != null;

  // "scheduledTime" field.
  int? _scheduledTime;
  int get scheduledTime => _scheduledTime ?? 0;
  bool hasScheduledTime() => _scheduledTime != null;

  // "createdDateInMill" field.
  int? _createdDateInMill;
  int get createdDateInMill => _createdDateInMill ?? 0;
  bool hasCreatedDateInMill() => _createdDateInMill != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "assignedTo" field.
  String? _assignedTo;
  String get assignedTo => _assignedTo ?? '';
  bool hasAssignedTo() => _assignedTo != null;

  // "leadName" field.
  String? _leadName;
  String get leadName => _leadName ?? '';
  bool hasLeadName() => _leadName != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  bool hasMode() => _mode != null;

  // "solution" field.
  String? _solution;
  String get solution => _solution ?? '';
  bool hasSolution() => _solution != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _leadRefId = snapshotData['leadRefId'] as String?;
    _scheduledDate = castToType<int>(snapshotData['scheduledDate']);
    _scheduledTime = castToType<int>(snapshotData['scheduledTime']);
    _createdDateInMill = castToType<int>(snapshotData['createdDateInMill']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _description = snapshotData['description'] as String?;
    _assignedTo = snapshotData['assignedTo'] as String?;
    _leadName = snapshotData['leadName'] as String?;
    _type = snapshotData['type'] as String?;
    _status = snapshotData['status'] as String?;
    _mode = snapshotData['mode'] as String?;
    _solution = snapshotData['solution'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('LEAD_ACTIVITIES')
          : FirebaseFirestore.instance.collectionGroup('LEAD_ACTIVITIES');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('LEAD_ACTIVITIES').doc(id);

  static Stream<LeadActivitiesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadActivitiesRecord.fromSnapshot(s));

  static Future<LeadActivitiesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadActivitiesRecord.fromSnapshot(s));

  static LeadActivitiesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadActivitiesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadActivitiesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadActivitiesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadActivitiesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadActivitiesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadActivitiesRecordData({
  String? id,
  String? leadRefId,
  int? scheduledDate,
  int? scheduledTime,
  int? createdDateInMill,
  DateTime? createdDate,
  String? description,
  String? assignedTo,
  String? leadName,
  String? type,
  String? status,
  String? mode,
  String? solution,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'leadRefId': leadRefId,
      'scheduledDate': scheduledDate,
      'scheduledTime': scheduledTime,
      'createdDateInMill': createdDateInMill,
      'createdDate': createdDate,
      'description': description,
      'assignedTo': assignedTo,
      'leadName': leadName,
      'type': type,
      'status': status,
      'mode': mode,
      'solution': solution,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadActivitiesRecordDocumentEquality
    implements Equality<LeadActivitiesRecord> {
  const LeadActivitiesRecordDocumentEquality();

  @override
  bool equals(LeadActivitiesRecord? e1, LeadActivitiesRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.leadRefId == e2?.leadRefId &&
        e1?.scheduledDate == e2?.scheduledDate &&
        e1?.scheduledTime == e2?.scheduledTime &&
        e1?.createdDateInMill == e2?.createdDateInMill &&
        e1?.createdDate == e2?.createdDate &&
        e1?.description == e2?.description &&
        e1?.assignedTo == e2?.assignedTo &&
        e1?.leadName == e2?.leadName &&
        e1?.type == e2?.type &&
        e1?.status == e2?.status &&
        e1?.mode == e2?.mode &&
        e1?.solution == e2?.solution;
  }

  @override
  int hash(LeadActivitiesRecord? e) => const ListEquality().hash([
        e?.id,
        e?.leadRefId,
        e?.scheduledDate,
        e?.scheduledTime,
        e?.createdDateInMill,
        e?.createdDate,
        e?.description,
        e?.assignedTo,
        e?.leadName,
        e?.type,
        e?.status,
        e?.mode,
        e?.solution
      ]);

  @override
  bool isValidKey(Object? o) => o is LeadActivitiesRecord;
}
