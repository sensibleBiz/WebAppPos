import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompanyDetailsRecord extends FirestoreRecord {
  CompanyDetailsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  bool hasText() => _text != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _text = snapshotData['text'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('COMPANY_DETAILS');

  static Stream<CompanyDetailsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompanyDetailsRecord.fromSnapshot(s));

  static Future<CompanyDetailsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompanyDetailsRecord.fromSnapshot(s));

  static CompanyDetailsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompanyDetailsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompanyDetailsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompanyDetailsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompanyDetailsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompanyDetailsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompanyDetailsRecordData({
  String? id,
  String? text,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'text': text,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompanyDetailsRecordDocumentEquality
    implements Equality<CompanyDetailsRecord> {
  const CompanyDetailsRecordDocumentEquality();

  @override
  bool equals(CompanyDetailsRecord? e1, CompanyDetailsRecord? e2) {
    return e1?.id == e2?.id && e1?.text == e2?.text;
  }

  @override
  int hash(CompanyDetailsRecord? e) =>
      const ListEquality().hash([e?.id, e?.text]);

  @override
  bool isValidKey(Object? o) => o is CompanyDetailsRecord;
}
