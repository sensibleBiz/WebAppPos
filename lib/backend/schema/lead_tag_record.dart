import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadTagRecord extends FirestoreRecord {
  LeadTagRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "leadTagName" field.
  String? _leadTagName;
  String get leadTagName => _leadTagName ?? '';
  bool hasLeadTagName() => _leadTagName != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _leadTagName = snapshotData['leadTagName'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _type = snapshotData['type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('LEAD_TAG')
          : FirebaseFirestore.instance.collectionGroup('LEAD_TAG');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('LEAD_TAG').doc(id);

  static Stream<LeadTagRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadTagRecord.fromSnapshot(s));

  static Future<LeadTagRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadTagRecord.fromSnapshot(s));

  static LeadTagRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadTagRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadTagRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadTagRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadTagRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadTagRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadTagRecordData({
  String? id,
  int? code,
  String? leadTagName,
  bool? isDeleted,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'code': code,
      'leadTagName': leadTagName,
      'isDeleted': isDeleted,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadTagRecordDocumentEquality implements Equality<LeadTagRecord> {
  const LeadTagRecordDocumentEquality();

  @override
  bool equals(LeadTagRecord? e1, LeadTagRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.code == e2?.code &&
        e1?.leadTagName == e2?.leadTagName &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.type == e2?.type;
  }

  @override
  int hash(LeadTagRecord? e) => const ListEquality()
      .hash([e?.id, e?.code, e?.leadTagName, e?.isDeleted, e?.type]);

  @override
  bool isValidKey(Object? o) => o is LeadTagRecord;
}
