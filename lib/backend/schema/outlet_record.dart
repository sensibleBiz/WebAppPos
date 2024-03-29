import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OutletRecord extends FirestoreRecord {
  OutletRecord._(
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

  // "businessType" field.
  DocumentReference? _businessType;
  DocumentReference? get businessType => _businessType;
  bool hasBusinessType() => _businessType != null;

  // "branch" field.
  String? _branch;
  String get branch => _branch ?? '';
  bool hasBranch() => _branch != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "pincode" field.
  int? _pincode;
  int get pincode => _pincode ?? 0;
  bool hasPincode() => _pincode != null;

  // "active" field.
  bool? _active;
  bool get active => _active ?? false;
  bool hasActive() => _active != null;

  // "renewalDate" field.
  int? _renewalDate;
  int get renewalDate => _renewalDate ?? 0;
  bool hasRenewalDate() => _renewalDate != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "fssaiLicenceNo" field.
  String? _fssaiLicenceNo;
  String get fssaiLicenceNo => _fssaiLicenceNo ?? '';
  bool hasFssaiLicenceNo() => _fssaiLicenceNo != null;

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "businessMaster" field.
  DocumentReference? _businessMaster;
  DocumentReference? get businessMaster => _businessMaster;
  bool hasBusinessMaster() => _businessMaster != null;

  // "multicounter" field.
  bool? _multicounter;
  bool get multicounter => _multicounter ?? false;
  bool hasMulticounter() => _multicounter != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "latLang" field.
  LatLng? _latLang;
  LatLng? get latLang => _latLang;
  bool hasLatLang() => _latLang != null;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _businessType = snapshotData['businessType'] as DocumentReference?;
    _branch = snapshotData['branch'] as String?;
    _city = snapshotData['city'] as String?;
    _state = snapshotData['state'] as String?;
    _pincode = castToType<int>(snapshotData['pincode']);
    _active = snapshotData['active'] as bool?;
    _renewalDate = castToType<int>(snapshotData['renewalDate']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _fssaiLicenceNo = snapshotData['fssaiLicenceNo'] as String?;
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _address = snapshotData['address'] as String?;
    _businessMaster = snapshotData['businessMaster'] as DocumentReference?;
    _multicounter = snapshotData['multicounter'] as bool?;
    _code = castToType<int>(snapshotData['code']);
    _userId = snapshotData['userId'] as String?;
    _latLang = snapshotData['latLang'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('OUTLET');

  static Stream<OutletRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OutletRecord.fromSnapshot(s));

  static Future<OutletRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OutletRecord.fromSnapshot(s));

  static OutletRecord fromSnapshot(DocumentSnapshot snapshot) => OutletRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OutletRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OutletRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OutletRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OutletRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOutletRecordData({
  String? id,
  String? name,
  DocumentReference? businessType,
  String? branch,
  String? city,
  String? state,
  int? pincode,
  bool? active,
  int? renewalDate,
  int? createdDate,
  String? fssaiLicenceNo,
  DocumentReference? userRef,
  DocumentReference? createdBy,
  String? address,
  DocumentReference? businessMaster,
  bool? multicounter,
  int? code,
  String? userId,
  LatLng? latLang,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'name': name,
      'businessType': businessType,
      'branch': branch,
      'city': city,
      'state': state,
      'pincode': pincode,
      'active': active,
      'renewalDate': renewalDate,
      'createdDate': createdDate,
      'fssaiLicenceNo': fssaiLicenceNo,
      'userRef': userRef,
      'createdBy': createdBy,
      'address': address,
      'businessMaster': businessMaster,
      'multicounter': multicounter,
      'code': code,
      'userId': userId,
      'latLang': latLang,
    }.withoutNulls,
  );

  return firestoreData;
}

class OutletRecordDocumentEquality implements Equality<OutletRecord> {
  const OutletRecordDocumentEquality();

  @override
  bool equals(OutletRecord? e1, OutletRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.businessType == e2?.businessType &&
        e1?.branch == e2?.branch &&
        e1?.city == e2?.city &&
        e1?.state == e2?.state &&
        e1?.pincode == e2?.pincode &&
        e1?.active == e2?.active &&
        e1?.renewalDate == e2?.renewalDate &&
        e1?.createdDate == e2?.createdDate &&
        e1?.fssaiLicenceNo == e2?.fssaiLicenceNo &&
        e1?.userRef == e2?.userRef &&
        e1?.createdBy == e2?.createdBy &&
        e1?.address == e2?.address &&
        e1?.businessMaster == e2?.businessMaster &&
        e1?.multicounter == e2?.multicounter &&
        e1?.code == e2?.code &&
        e1?.userId == e2?.userId &&
        e1?.latLang == e2?.latLang;
  }

  @override
  int hash(OutletRecord? e) => const ListEquality().hash([
        e?.id,
        e?.name,
        e?.businessType,
        e?.branch,
        e?.city,
        e?.state,
        e?.pincode,
        e?.active,
        e?.renewalDate,
        e?.createdDate,
        e?.fssaiLicenceNo,
        e?.userRef,
        e?.createdBy,
        e?.address,
        e?.businessMaster,
        e?.multicounter,
        e?.code,
        e?.userId,
        e?.latLang
      ]);

  @override
  bool isValidKey(Object? o) => o is OutletRecord;
}
