import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DealerActivityRecord extends FirestoreRecord {
  DealerActivityRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "dealerId" field.
  String? _dealerId;
  String get dealerId => _dealerId ?? '';
  bool hasDealerId() => _dealerId != null;

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  bool hasMode() => _mode != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "scheduleDate" field.
  int? _scheduleDate;
  int get scheduleDate => _scheduleDate ?? 0;
  bool hasScheduleDate() => _scheduleDate != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "dealerName" field.
  String? _dealerName;
  String get dealerName => _dealerName ?? '';
  bool hasDealerName() => _dealerName != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _dealerId = snapshotData['dealerId'] as String?;
    _mode = snapshotData['mode'] as String?;
    _type = snapshotData['type'] as String?;
    _scheduleDate = castToType<int>(snapshotData['scheduleDate']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _description = snapshotData['description'] as String?;
    _createdBy = snapshotData['createdBy'] as String?;
    _status = snapshotData['status'] as String?;
    _dealerName = snapshotData['dealerName'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('DEALER_ACTIVITY')
          : FirebaseFirestore.instance.collectionGroup('DEALER_ACTIVITY');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('DEALER_ACTIVITY').doc(id);

  static Stream<DealerActivityRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DealerActivityRecord.fromSnapshot(s));

  static Future<DealerActivityRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DealerActivityRecord.fromSnapshot(s));

  static DealerActivityRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DealerActivityRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DealerActivityRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DealerActivityRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DealerActivityRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DealerActivityRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDealerActivityRecordData({
  String? id,
  String? dealerId,
  String? mode,
  String? type,
  int? scheduleDate,
  int? createdDate,
  String? description,
  String? createdBy,
  String? status,
  String? dealerName,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'dealerId': dealerId,
      'mode': mode,
      'type': type,
      'scheduleDate': scheduleDate,
      'createdDate': createdDate,
      'description': description,
      'createdBy': createdBy,
      'status': status,
      'dealerName': dealerName,
    }.withoutNulls,
  );

  return firestoreData;
}

class DealerActivityRecordDocumentEquality
    implements Equality<DealerActivityRecord> {
  const DealerActivityRecordDocumentEquality();

  @override
  bool equals(DealerActivityRecord? e1, DealerActivityRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.dealerId == e2?.dealerId &&
        e1?.mode == e2?.mode &&
        e1?.type == e2?.type &&
        e1?.scheduleDate == e2?.scheduleDate &&
        e1?.createdDate == e2?.createdDate &&
        e1?.description == e2?.description &&
        e1?.createdBy == e2?.createdBy &&
        e1?.status == e2?.status &&
        e1?.dealerName == e2?.dealerName;
  }

  @override
  int hash(DealerActivityRecord? e) => const ListEquality().hash([
        e?.id,
        e?.dealerId,
        e?.mode,
        e?.type,
        e?.scheduleDate,
        e?.createdDate,
        e?.description,
        e?.createdBy,
        e?.status,
        e?.dealerName
      ]);

  @override
  bool isValidKey(Object? o) => o is DealerActivityRecord;
}
