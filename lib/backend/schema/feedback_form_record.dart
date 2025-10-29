import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FeedbackFormRecord extends FirestoreRecord {
  FeedbackFormRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('FEEDBACK_FORM')
          : FirebaseFirestore.instance.collectionGroup('FEEDBACK_FORM');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('FEEDBACK_FORM').doc(id);

  static Stream<FeedbackFormRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FeedbackFormRecord.fromSnapshot(s));

  static Future<FeedbackFormRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FeedbackFormRecord.fromSnapshot(s));

  static FeedbackFormRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FeedbackFormRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FeedbackFormRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FeedbackFormRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FeedbackFormRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FeedbackFormRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFeedbackFormRecordData({
  String? id,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
    }.withoutNulls,
  );

  return firestoreData;
}

class FeedbackFormRecordDocumentEquality
    implements Equality<FeedbackFormRecord> {
  const FeedbackFormRecordDocumentEquality();

  @override
  bool equals(FeedbackFormRecord? e1, FeedbackFormRecord? e2) {
    return e1?.id == e2?.id;
  }

  @override
  int hash(FeedbackFormRecord? e) => const ListEquality().hash([e?.id]);

  @override
  bool isValidKey(Object? o) => o is FeedbackFormRecord;
}
