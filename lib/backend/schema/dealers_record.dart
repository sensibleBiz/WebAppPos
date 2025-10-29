import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

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

  // "isActive" field.
  bool? _isActive;
  bool get isActive => _isActive ?? false;
  bool hasIsActive() => _isActive != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "userProfileId" field.
  String? _userProfileId;
  String get userProfileId => _userProfileId ?? '';
  bool hasUserProfileId() => _userProfileId != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "dealerCode" field.
  String? _dealerCode;
  String get dealerCode => _dealerCode ?? '';
  bool hasDealerCode() => _dealerCode != null;

  // "firmName" field.
  String? _firmName;
  String get firmName => _firmName ?? '';
  bool hasFirmName() => _firmName != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "dealerName" field.
  String? _dealerName;
  String get dealerName => _dealerName ?? '';
  bool hasDealerName() => _dealerName != null;

  // "gst" field.
  String? _gst;
  String get gst => _gst ?? '';
  bool hasGst() => _gst != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "pincode" field.
  String? _pincode;
  String get pincode => _pincode ?? '';
  bool hasPincode() => _pincode != null;

  // "outletId" field.
  String? _outletId;
  String get outletId => _outletId ?? '';
  bool hasOutletId() => _outletId != null;

  // "area" field.
  String? _area;
  String get area => _area ?? '';
  bool hasArea() => _area != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "alternateMobNo" field.
  String? _alternateMobNo;
  String get alternateMobNo => _alternateMobNo ?? '';
  bool hasAlternateMobNo() => _alternateMobNo != null;

  // "isOnBoarded" field.
  bool? _isOnBoarded;
  bool get isOnBoarded => _isOnBoarded ?? false;
  bool hasIsOnBoarded() => _isOnBoarded != null;

  // "partnerName" field.
  String? _partnerName;
  String get partnerName => _partnerName ?? '';
  bool hasPartnerName() => _partnerName != null;

  // "partnerMobNo" field.
  String? _partnerMobNo;
  String get partnerMobNo => _partnerMobNo ?? '';
  bool hasPartnerMobNo() => _partnerMobNo != null;

  // "dealsIn" field.
  String? _dealsIn;
  String get dealsIn => _dealsIn ?? '';
  bool hasDealsIn() => _dealsIn != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _address = snapshotData['address'] as String?;
    _isActive = snapshotData['isActive'] as bool?;
    _state = snapshotData['state'] as String?;
    _userProfileId = snapshotData['userProfileId'] as String?;
    _isDeleted = snapshotData['isDeleted'] as bool?;
    _dealerCode = snapshotData['dealerCode'] as String?;
    _firmName = snapshotData['firmName'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _dealerName = snapshotData['dealerName'] as String?;
    _gst = snapshotData['gst'] as String?;
    _city = snapshotData['city'] as String?;
    _pincode = snapshotData['pincode'] as String?;
    _outletId = snapshotData['outletId'] as String?;
    _area = snapshotData['area'] as String?;
    _name = snapshotData['name'] as String?;
    _alternateMobNo = snapshotData['alternateMobNo'] as String?;
    _isOnBoarded = snapshotData['isOnBoarded'] as bool?;
    _partnerName = snapshotData['partnerName'] as String?;
    _partnerMobNo = snapshotData['partnerMobNo'] as String?;
    _dealsIn = snapshotData['dealsIn'] as String?;
    _status = snapshotData['status'] as String?;
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
  bool? isActive,
  String? state,
  String? userProfileId,
  bool? isDeleted,
  String? dealerCode,
  String? firmName,
  String? mobile,
  String? dealerName,
  String? gst,
  String? city,
  String? pincode,
  String? outletId,
  String? area,
  String? name,
  String? alternateMobNo,
  bool? isOnBoarded,
  String? partnerName,
  String? partnerMobNo,
  String? dealsIn,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'address': address,
      'isActive': isActive,
      'state': state,
      'userProfileId': userProfileId,
      'isDeleted': isDeleted,
      'dealerCode': dealerCode,
      'firmName': firmName,
      'mobile': mobile,
      'dealerName': dealerName,
      'gst': gst,
      'city': city,
      'pincode': pincode,
      'outletId': outletId,
      'area': area,
      'name': name,
      'alternateMobNo': alternateMobNo,
      'isOnBoarded': isOnBoarded,
      'partnerName': partnerName,
      'partnerMobNo': partnerMobNo,
      'dealsIn': dealsIn,
      'status': status,
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
        e1?.isActive == e2?.isActive &&
        e1?.state == e2?.state &&
        e1?.userProfileId == e2?.userProfileId &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.dealerCode == e2?.dealerCode &&
        e1?.firmName == e2?.firmName &&
        e1?.mobile == e2?.mobile &&
        e1?.dealerName == e2?.dealerName &&
        e1?.gst == e2?.gst &&
        e1?.city == e2?.city &&
        e1?.pincode == e2?.pincode &&
        e1?.outletId == e2?.outletId &&
        e1?.area == e2?.area &&
        e1?.name == e2?.name &&
        e1?.alternateMobNo == e2?.alternateMobNo &&
        e1?.isOnBoarded == e2?.isOnBoarded &&
        e1?.partnerName == e2?.partnerName &&
        e1?.partnerMobNo == e2?.partnerMobNo &&
        e1?.dealsIn == e2?.dealsIn &&
        e1?.status == e2?.status;
  }

  @override
  int hash(DealersRecord? e) => const ListEquality().hash([
        e?.id,
        e?.address,
        e?.isActive,
        e?.state,
        e?.userProfileId,
        e?.isDeleted,
        e?.dealerCode,
        e?.firmName,
        e?.mobile,
        e?.dealerName,
        e?.gst,
        e?.city,
        e?.pincode,
        e?.outletId,
        e?.area,
        e?.name,
        e?.alternateMobNo,
        e?.isOnBoarded,
        e?.partnerName,
        e?.partnerMobNo,
        e?.dealsIn,
        e?.status
      ]);

  @override
  bool isValidKey(Object? o) => o is DealersRecord;
}
