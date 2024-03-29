import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DealersRecord extends FirestoreRecord {
  DealersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "companyName" field.
  String? _companyName;
  String get companyName => _companyName ?? '';
  bool hasCompanyName() => _companyName != null;

  // "emailId" field.
  String? _emailId;
  String get emailId => _emailId ?? '';
  bool hasEmailId() => _emailId != null;

  // "gstNumber" field.
  String? _gstNumber;
  String get gstNumber => _gstNumber ?? '';
  bool hasGstNumber() => _gstNumber != null;

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "userProfileId" field.
  String? _userProfileId;
  String get userProfileId => _userProfileId ?? '';
  bool hasUserProfileId() => _userProfileId != null;

  // "contactNumber" field.
  String? _contactNumber;
  String get contactNumber => _contactNumber ?? '';
  bool hasContactNumber() => _contactNumber != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _address = snapshotData['address'] as String?;
    _companyName = snapshotData['companyName'] as String?;
    _emailId = snapshotData['emailId'] as String?;
    _gstNumber = snapshotData['gstNumber'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _name = snapshotData['name'] as String?;
    _state = snapshotData['state'] as String?;
    _userProfileId = snapshotData['userProfileId'] as String?;
    _contactNumber = snapshotData['contactNumber'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('DEALERS')
          : FirebaseFirestore.instance.collectionGroup('DEALERS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('DEALERS').doc(id);

  static Stream<DealersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => DealersRecord.fromSnapshot(s));

  static Future<DealersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => DealersRecord.fromSnapshot(s));

  static DealersRecord fromSnapshot(DocumentSnapshot snapshot) =>
      DealersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static DealersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      DealersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'DealersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is DealersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createDealersRecordData({
  String? id,
  String? address,
  String? companyName,
  String? emailId,
  String? gstNumber,
  bool? isActive,
  String? name,
  String? state,
  String? userProfileId,
  String? contactNumber,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'address': address,
      'companyName': companyName,
      'emailId': emailId,
      'gstNumber': gstNumber,
      'isActive': isActive,
      'name': name,
      'state': state,
      'userProfileId': userProfileId,
      'contactNumber': contactNumber,
    }.withoutNulls,
  );

  return firestoreData;
}

class DealersRecordDocumentEquality implements Equality<DealersRecord> {
  const DealersRecordDocumentEquality();

  @override
  bool equals(DealersRecord? e1, DealersRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.address == e2?.address &&
        e1?.companyName == e2?.companyName &&
        e1?.emailId == e2?.emailId &&
        e1?.gstNumber == e2?.gstNumber &&
        e1?.isActive == e2?.isActive &&
        e1?.name == e2?.name &&
        e1?.state == e2?.state &&
        e1?.userProfileId == e2?.userProfileId &&
        e1?.contactNumber == e2?.contactNumber;
  }

  @override
  int hash(DealersRecord? e) => const ListEquality().hash([
        e?.id,
        e?.address,
        e?.companyName,
        e?.emailId,
        e?.gstNumber,
        e?.isActive,
        e?.name,
        e?.state,
        e?.userProfileId,
        e?.contactNumber
      ]);

  @override
  bool isValidKey(Object? o) => o is DealersRecord;
}
