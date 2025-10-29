import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ZoneRecord extends FirestoreRecord {
  ZoneRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "zone" field.
  String? _zone;
  String get zone => _zone ?? '';
  bool hasZone() => _zone != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _zone = snapshotData['zone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ZONE');

  static Stream<ZoneRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ZoneRecord.fromSnapshot(s));

  static Future<ZoneRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ZoneRecord.fromSnapshot(s));

  static ZoneRecord fromSnapshot(DocumentSnapshot snapshot) => ZoneRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ZoneRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ZoneRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ZoneRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ZoneRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createZoneRecordData({
  String? id,
  String? zone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'zone': zone,
    }.withoutNulls,
  );

  return firestoreData;
}

class ZoneRecordDocumentEquality implements Equality<ZoneRecord> {
  const ZoneRecordDocumentEquality();

  @override
  bool equals(ZoneRecord? e1, ZoneRecord? e2) {
    return e1?.id == e2?.id && e1?.zone == e2?.zone;
  }

  @override
  int hash(ZoneRecord? e) => const ListEquality().hash([e?.id, e?.zone]);

  @override
  bool isValidKey(Object? o) => o is ZoneRecord;
}
