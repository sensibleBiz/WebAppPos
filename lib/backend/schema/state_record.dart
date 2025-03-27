import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StateRecord extends FirestoreRecord {
  StateRecord._(
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

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "zone" field.
  String? _zone;
  String get zone => _zone ?? '';
  bool hasZone() => _zone != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _code = castToType<int>(snapshotData['code']);
    _zone = snapshotData['zone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('STATE');

  static Stream<StateRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StateRecord.fromSnapshot(s));

  static Future<StateRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StateRecord.fromSnapshot(s));

  static StateRecord fromSnapshot(DocumentSnapshot snapshot) => StateRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StateRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StateRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StateRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StateRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStateRecordData({
  String? id,
  String? name,
  int? code,
  String? zone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'code': code,
      'zone': zone,
    }.withoutNulls,
  );

  return firestoreData;
}

class StateRecordDocumentEquality implements Equality<StateRecord> {
  const StateRecordDocumentEquality();

  @override
  bool equals(StateRecord? e1, StateRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.code == e2?.code &&
        e1?.zone == e2?.zone;
  }

  @override
  int hash(StateRecord? e) =>
      const ListEquality().hash([e?.id, e?.name, e?.code, e?.zone]);

  @override
  bool isValidKey(Object? o) => o is StateRecord;
}
