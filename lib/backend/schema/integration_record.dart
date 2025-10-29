import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IntegrationRecord extends FirestoreRecord {
  IntegrationRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "integrationKey" field.
  String? _integrationKey;
  String get integrationKey => _integrationKey ?? '';
  bool hasIntegrationKey() => _integrationKey != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "modifiedDate" field.
  int? _modifiedDate;
  int get modifiedDate => _modifiedDate ?? 0;
  bool hasModifiedDate() => _modifiedDate != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "outletId" field.
  String? _outletId;
  String get outletId => _outletId ?? '';
  bool hasOutletId() => _outletId != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _description = snapshotData['description'] as String?;
    _integrationKey = snapshotData['integrationKey'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _modifiedDate = castToType<int>(snapshotData['modifiedDate']);
    _type = snapshotData['type'] as String?;
    _outletId = snapshotData['outletId'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('INTEGRATION');

  static Stream<IntegrationRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IntegrationRecord.fromSnapshot(s));

  static Future<IntegrationRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => IntegrationRecord.fromSnapshot(s));

  static IntegrationRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IntegrationRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IntegrationRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IntegrationRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IntegrationRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IntegrationRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIntegrationRecordData({
  String? id,
  int? createdDate,
  String? description,
  String? integrationKey,
  bool? isActive,
  int? modifiedDate,
  String? type,
  String? outletId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'createdDate': createdDate,
      'description': description,
      'integrationKey': integrationKey,
      'isActive': isActive,
      'modifiedDate': modifiedDate,
      'type': type,
      'outletId': outletId,
    }.withoutNulls,
  );

  return firestoreData;
}

class IntegrationRecordDocumentEquality implements Equality<IntegrationRecord> {
  const IntegrationRecordDocumentEquality();

  @override
  bool equals(IntegrationRecord? e1, IntegrationRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.createdDate == e2?.createdDate &&
        e1?.description == e2?.description &&
        e1?.integrationKey == e2?.integrationKey &&
        e1?.isActive == e2?.isActive &&
        e1?.modifiedDate == e2?.modifiedDate &&
        e1?.type == e2?.type &&
        e1?.outletId == e2?.outletId;
  }

  @override
  int hash(IntegrationRecord? e) => const ListEquality().hash([
        e?.id,
        e?.createdDate,
        e?.description,
        e?.integrationKey,
        e?.isActive,
        e?.modifiedDate,
        e?.type,
        e?.outletId
      ]);

  @override
  bool isValidKey(Object? o) => o is IntegrationRecord;
}
