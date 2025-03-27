import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadStatusRecord extends FirestoreRecord {
  LeadStatusRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "display" field.
  String? _display;
  String get display => _display ?? '';
  bool hasDisplay() => _display != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "stageId" field.
  String? _stageId;
  String get stageId => _stageId ?? '';
  bool hasStageId() => _stageId != null;

  // "stageRef" field.
  DocumentReference? _stageRef;
  DocumentReference? get stageRef => _stageRef;
  bool hasStageRef() => _stageRef != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _code = castToType<int>(snapshotData['code']);
    _name = snapshotData['name'] as String?;
    _display = snapshotData['display'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _id = snapshotData['id'] as String?;
    _stageId = snapshotData['stageId'] as String?;
    _stageRef = snapshotData['stageRef'] as DocumentReference?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('LEAD_STATUS')
          : FirebaseFirestore.instance.collectionGroup('LEAD_STATUS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('LEAD_STATUS').doc(id);

  static Stream<LeadStatusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadStatusRecord.fromSnapshot(s));

  static Future<LeadStatusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadStatusRecord.fromSnapshot(s));

  static LeadStatusRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadStatusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadStatusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadStatusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadStatusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadStatusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadStatusRecordData({
  int? code,
  String? name,
  String? display,
  bool? isActive,
  bool? isDeleted,
  String? id,
  String? stageId,
  DocumentReference? stageRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'code': code,
      'name': name,
      'display': display,
      'isActive': isActive,
      'isDeleted': isDeleted,
      'id': id,
      'stageId': stageId,
      'stageRef': stageRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadStatusRecordDocumentEquality implements Equality<LeadStatusRecord> {
  const LeadStatusRecordDocumentEquality();

  @override
  bool equals(LeadStatusRecord? e1, LeadStatusRecord? e2) {
    return e1?.code == e2?.code &&
        e1?.name == e2?.name &&
        e1?.display == e2?.display &&
        e1?.isActive == e2?.isActive &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.id == e2?.id &&
        e1?.stageId == e2?.stageId &&
        e1?.stageRef == e2?.stageRef;
  }

  @override
  int hash(LeadStatusRecord? e) => const ListEquality().hash([
        e?.code,
        e?.name,
        e?.display,
        e?.isActive,
        e?.isDeleted,
        e?.id,
        e?.stageId,
        e?.stageRef
      ]);

  @override
  bool isValidKey(Object? o) => o is LeadStatusRecord;
}
