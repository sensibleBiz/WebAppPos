import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadsCustomerRecord extends FirestoreRecord {
  LeadsCustomerRecord._(
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

  // "createdDateTime" field.
  DateTime? _createdDateTime;
  DateTime? get createdDateTime => _createdDateTime;
  bool hasCreatedDateTime() => _createdDateTime != null;

  // "createdDate" field.
  String? _createdDate;
  String get createdDate => _createdDate ?? '';
  bool hasCreatedDate() => _createdDate != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  bool hasNumber() => _number != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "checkInLocation" field.
  String? _checkInLocation;
  String get checkInLocation => _checkInLocation ?? '';
  bool hasCheckInLocation() => _checkInLocation != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _createdDateTime = snapshotData['createdDateTime'] as DateTime?;
    _createdDate = snapshotData['createdDate'] as String?;
    _number = snapshotData['number'] as String?;
    _note = snapshotData['note'] as String?;
    _checkInLocation = snapshotData['checkInLocation'] as String?;
    _code = castToType<int>(snapshotData['code']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('LEADS_CUSTOMER')
          : FirebaseFirestore.instance.collectionGroup('LEADS_CUSTOMER');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('LEADS_CUSTOMER').doc(id);

  static Stream<LeadsCustomerRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadsCustomerRecord.fromSnapshot(s));

  static Future<LeadsCustomerRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadsCustomerRecord.fromSnapshot(s));

  static LeadsCustomerRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadsCustomerRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadsCustomerRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadsCustomerRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadsCustomerRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadsCustomerRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadsCustomerRecordData({
  String? id,
  String? name,
  DateTime? createdDateTime,
  String? createdDate,
  String? number,
  String? note,
  String? checkInLocation,
  int? code,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'createdDateTime': createdDateTime,
      'createdDate': createdDate,
      'number': number,
      'note': note,
      'checkInLocation': checkInLocation,
      'code': code,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadsCustomerRecordDocumentEquality
    implements Equality<LeadsCustomerRecord> {
  const LeadsCustomerRecordDocumentEquality();

  @override
  bool equals(LeadsCustomerRecord? e1, LeadsCustomerRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.createdDateTime == e2?.createdDateTime &&
        e1?.createdDate == e2?.createdDate &&
        e1?.number == e2?.number &&
        e1?.note == e2?.note &&
        e1?.checkInLocation == e2?.checkInLocation &&
        e1?.code == e2?.code;
  }

  @override
  int hash(LeadsCustomerRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.createdDateTime,
        e?.createdDate,
        e?.number,
        e?.note,
        e?.checkInLocation,
        e?.code
      ]);

  @override
  bool isValidKey(Object? o) => o is LeadsCustomerRecord;
}
