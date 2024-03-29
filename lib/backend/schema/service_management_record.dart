import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ServiceManagementRecord extends FirestoreRecord {
  ServiceManagementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "customerName" field.
  String? _customerName;
  String get customerName => _customerName ?? '';
  bool hasCustomerName() => _customerName != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "address" field.
  String? _address;
  String get address => _address ?? '';
  bool hasAddress() => _address != null;

  // "outletName" field.
  String? _outletName;
  String get outletName => _outletName ?? '';
  bool hasOutletName() => _outletName != null;

  // "contactPerson" field.
  String? _contactPerson;
  String get contactPerson => _contactPerson ?? '';
  bool hasContactPerson() => _contactPerson != null;

  // "designation" field.
  String? _designation;
  String get designation => _designation ?? '';
  bool hasDesignation() => _designation != null;

  // "typeOfService" field.
  String? _typeOfService;
  String get typeOfService => _typeOfService ?? '';
  bool hasTypeOfService() => _typeOfService != null;

  // "machineModel" field.
  String? _machineModel;
  String get machineModel => _machineModel ?? '';
  bool hasMachineModel() => _machineModel != null;

  // "machineNumber" field.
  String? _machineNumber;
  String get machineNumber => _machineNumber ?? '';
  bool hasMachineNumber() => _machineNumber != null;

  // "travelMode" field.
  String? _travelMode;
  String get travelMode => _travelMode ?? '';
  bool hasTravelMode() => _travelMode != null;

  // "extraDetails" field.
  String? _extraDetails;
  String get extraDetails => _extraDetails ?? '';
  bool hasExtraDetails() => _extraDetails != null;

  // "contactPersonMobile" field.
  String? _contactPersonMobile;
  String get contactPersonMobile => _contactPersonMobile ?? '';
  bool hasContactPersonMobile() => _contactPersonMobile != null;

  // "checkInLocation" field.
  LatLng? _checkInLocation;
  LatLng? get checkInLocation => _checkInLocation;
  bool hasCheckInLocation() => _checkInLocation != null;

  // "checkInTime" field.
  int? _checkInTime;
  int get checkInTime => _checkInTime ?? 0;
  bool hasCheckInTime() => _checkInTime != null;

  // "checkOutTime" field.
  int? _checkOutTime;
  int get checkOutTime => _checkOutTime ?? 0;
  bool hasCheckOutTime() => _checkOutTime != null;

  // "checkOutLocation" field.
  LatLng? _checkOutLocation;
  LatLng? get checkOutLocation => _checkOutLocation;
  bool hasCheckOutLocation() => _checkOutLocation != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "updatedDate" field.
  int? _updatedDate;
  int get updatedDate => _updatedDate ?? 0;
  bool hasUpdatedDate() => _updatedDate != null;

  // "currentTime" field.
  DateTime? _currentTime;
  DateTime? get currentTime => _currentTime;
  bool hasCurrentTime() => _currentTime != null;

  // "monthId" field.
  String? _monthId;
  String get monthId => _monthId ?? '';
  bool hasMonthId() => _monthId != null;

  // "yearId" field.
  String? _yearId;
  String get yearId => _yearId ?? '';
  bool hasYearId() => _yearId != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _customerName = snapshotData['customerName'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _address = snapshotData['address'] as String?;
    _outletName = snapshotData['outletName'] as String?;
    _contactPerson = snapshotData['contactPerson'] as String?;
    _designation = snapshotData['designation'] as String?;
    _typeOfService = snapshotData['typeOfService'] as String?;
    _machineModel = snapshotData['machineModel'] as String?;
    _machineNumber = snapshotData['machineNumber'] as String?;
    _travelMode = snapshotData['travelMode'] as String?;
    _extraDetails = snapshotData['extraDetails'] as String?;
    _contactPersonMobile = snapshotData['contactPersonMobile'] as String?;
    _checkInLocation = snapshotData['checkInLocation'] as LatLng?;
    _checkInTime = castToType<int>(snapshotData['checkInTime']);
    _checkOutTime = castToType<int>(snapshotData['checkOutTime']);
    _checkOutLocation = snapshotData['checkOutLocation'] as LatLng?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _currentTime = snapshotData['currentTime'] as DateTime?;
    _monthId = snapshotData['monthId'] as String?;
    _yearId = snapshotData['yearId'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SERVICE_MANAGEMENT')
          : FirebaseFirestore.instance.collectionGroup('SERVICE_MANAGEMENT');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SERVICE_MANAGEMENT').doc(id);

  static Stream<ServiceManagementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ServiceManagementRecord.fromSnapshot(s));

  static Future<ServiceManagementRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => ServiceManagementRecord.fromSnapshot(s));

  static ServiceManagementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ServiceManagementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ServiceManagementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ServiceManagementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ServiceManagementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ServiceManagementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createServiceManagementRecordData({
  String? id,
  String? customerName,
  String? mobile,
  String? address,
  String? outletName,
  String? contactPerson,
  String? designation,
  String? typeOfService,
  String? machineModel,
  String? machineNumber,
  String? travelMode,
  String? extraDetails,
  String? contactPersonMobile,
  LatLng? checkInLocation,
  int? checkInTime,
  int? checkOutTime,
  LatLng? checkOutLocation,
  int? createdDate,
  int? updatedDate,
  DateTime? currentTime,
  String? monthId,
  String? yearId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'customerName': customerName,
      'mobile': mobile,
      'address': address,
      'outletName': outletName,
      'contactPerson': contactPerson,
      'designation': designation,
      'typeOfService': typeOfService,
      'machineModel': machineModel,
      'machineNumber': machineNumber,
      'travelMode': travelMode,
      'extraDetails': extraDetails,
      'contactPersonMobile': contactPersonMobile,
      'checkInLocation': checkInLocation,
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'checkOutLocation': checkOutLocation,
      'createdDate': createdDate,
      'updatedDate': updatedDate,
      'currentTime': currentTime,
      'monthId': monthId,
      'yearId': yearId,
    }.withoutNulls,
  );

  return firestoreData;
}

class ServiceManagementRecordDocumentEquality
    implements Equality<ServiceManagementRecord> {
  const ServiceManagementRecordDocumentEquality();

  @override
  bool equals(ServiceManagementRecord? e1, ServiceManagementRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.customerName == e2?.customerName &&
        e1?.mobile == e2?.mobile &&
        e1?.address == e2?.address &&
        e1?.outletName == e2?.outletName &&
        e1?.contactPerson == e2?.contactPerson &&
        e1?.designation == e2?.designation &&
        e1?.typeOfService == e2?.typeOfService &&
        e1?.machineModel == e2?.machineModel &&
        e1?.machineNumber == e2?.machineNumber &&
        e1?.travelMode == e2?.travelMode &&
        e1?.extraDetails == e2?.extraDetails &&
        e1?.contactPersonMobile == e2?.contactPersonMobile &&
        e1?.checkInLocation == e2?.checkInLocation &&
        e1?.checkInTime == e2?.checkInTime &&
        e1?.checkOutTime == e2?.checkOutTime &&
        e1?.checkOutLocation == e2?.checkOutLocation &&
        e1?.createdDate == e2?.createdDate &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.currentTime == e2?.currentTime &&
        e1?.monthId == e2?.monthId &&
        e1?.yearId == e2?.yearId;
  }

  @override
  int hash(ServiceManagementRecord? e) => const ListEquality().hash([
        e?.id,
        e?.customerName,
        e?.mobile,
        e?.address,
        e?.outletName,
        e?.contactPerson,
        e?.designation,
        e?.typeOfService,
        e?.machineModel,
        e?.machineNumber,
        e?.travelMode,
        e?.extraDetails,
        e?.contactPersonMobile,
        e?.checkInLocation,
        e?.checkInTime,
        e?.checkOutTime,
        e?.checkOutLocation,
        e?.createdDate,
        e?.updatedDate,
        e?.currentTime,
        e?.monthId,
        e?.yearId
      ]);

  @override
  bool isValidKey(Object? o) => o is ServiceManagementRecord;
}
