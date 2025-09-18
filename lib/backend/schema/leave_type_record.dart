import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeaveTypeRecord extends FirestoreRecord {
  LeaveTypeRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "shortCode" field.
  String? _shortCode;
  String get shortCode => _shortCode ?? '';
  bool hasShortCode() => _shortCode != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _shortCode = snapshotData['shortCode'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('LEAVE_TYPE')
          : FirebaseFirestore.instance.collectionGroup('LEAVE_TYPE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('LEAVE_TYPE').doc(id);

  static Stream<LeaveTypeRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeaveTypeRecord.fromSnapshot(s));

  static Future<LeaveTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeaveTypeRecord.fromSnapshot(s));

  static LeaveTypeRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeaveTypeRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeaveTypeRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeaveTypeRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeaveTypeRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeaveTypeRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeaveTypeRecordData({
  String? id,
  String? name,
  String? shortCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'shortCode': shortCode,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeaveTypeRecordDocumentEquality implements Equality<LeaveTypeRecord> {
  const LeaveTypeRecordDocumentEquality();

  @override
  bool equals(LeaveTypeRecord? e1, LeaveTypeRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.shortCode == e2?.shortCode;
  }

  @override
  int hash(LeaveTypeRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.shortCode]);

  @override
  bool isValidKey(Object? o) => o is LeaveTypeRecord;
}
