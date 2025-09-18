import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceRecord extends FirestoreRecord {
  AttendanceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  bool hasNote() => _note != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "checkInTime" field.
  int? _checkInTime;
  int get checkInTime => _checkInTime ?? 0;
  bool hasCheckInTime() => _checkInTime != null;

  // "checkOutTime" field.
  int? _checkOutTime;
  int get checkOutTime => _checkOutTime ?? 0;
  bool hasCheckOutTime() => _checkOutTime != null;

  // "checkOutLocation" field.
  String? _checkOutLocation;
  String get checkOutLocation => _checkOutLocation ?? '';
  bool hasCheckOutLocation() => _checkOutLocation != null;

  // "outletId" field.
  String? _outletId;
  String get outletId => _outletId ?? '';
  bool hasOutletId() => _outletId != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "status" field.
  bool? _status;
  bool get status => _status ?? false;
  bool hasStatus() => _status != null;

  // "checkInLocation" field.
  String? _checkInLocation;
  String get checkInLocation => _checkInLocation ?? '';
  bool hasCheckInLocation() => _checkInLocation != null;

  // "monthId" field.
  String? _monthId;
  String get monthId => _monthId ?? '';
  bool hasMonthId() => _monthId != null;

  // "yearId" field.
  String? _yearId;
  String get yearId => _yearId ?? '';
  bool hasYearId() => _yearId != null;

  // "locationName" field.
  String? _locationName;
  String get locationName => _locationName ?? '';
  bool hasLocationName() => _locationName != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  bool hasStreet() => _street != null;

  // "locality" field.
  String? _locality;
  String get locality => _locality ?? '';
  bool hasLocality() => _locality != null;

  // "subLocality" field.
  String? _subLocality;
  String get subLocality => _subLocality ?? '';
  bool hasSubLocality() => _subLocality != null;

  // "postalCode" field.
  int? _postalCode;
  int get postalCode => _postalCode ?? 0;
  bool hasPostalCode() => _postalCode != null;

  // "checkInLocationDetails" field.
  LocationDetailsStruct? _checkInLocationDetails;
  LocationDetailsStruct get checkInLocationDetails =>
      _checkInLocationDetails ?? LocationDetailsStruct();
  bool hasCheckInLocationDetails() => _checkInLocationDetails != null;

  // "checkOutLocationDetails" field.
  LocationDetailsStruct? _checkOutLocationDetails;
  LocationDetailsStruct get checkOutLocationDetails =>
      _checkOutLocationDetails ?? LocationDetailsStruct();
  bool hasCheckOutLocationDetails() => _checkOutLocationDetails != null;

  // "createdDate" field.
  DateTime? _createdDate;
  DateTime? get createdDate => _createdDate;
  bool hasCreatedDate() => _createdDate != null;

  // "isPresent" field.
  bool? _isPresent;
  bool get isPresent => _isPresent ?? false;
  bool hasIsPresent() => _isPresent != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _note = snapshotData['note'] as String?;
    _userId = snapshotData['userId'] as String?;
    _checkInTime = castToType<int>(snapshotData['checkInTime']);
    _checkOutTime = castToType<int>(snapshotData['checkOutTime']);
    _checkOutLocation = snapshotData['checkOutLocation'] as String?;
    _outletId = snapshotData['outletId'] as String?;
    _dayId = snapshotData['dayId'] as String?;
    _status = snapshotData['status'] as bool?;
    _checkInLocation = snapshotData['checkInLocation'] as String?;
    _monthId = snapshotData['monthId'] as String?;
    _yearId = snapshotData['yearId'] as String?;
    _locationName = snapshotData['locationName'] as String?;
    _street = snapshotData['street'] as String?;
    _locality = snapshotData['locality'] as String?;
    _subLocality = snapshotData['subLocality'] as String?;
    _postalCode = castToType<int>(snapshotData['postalCode']);
    _checkInLocationDetails =
        snapshotData['checkInLocationDetails'] is LocationDetailsStruct
            ? snapshotData['checkInLocationDetails']
            : LocationDetailsStruct.maybeFromMap(
                snapshotData['checkInLocationDetails']);
    _checkOutLocationDetails =
        snapshotData['checkOutLocationDetails'] is LocationDetailsStruct
            ? snapshotData['checkOutLocationDetails']
            : LocationDetailsStruct.maybeFromMap(
                snapshotData['checkOutLocationDetails']);
    _createdDate = snapshotData['createdDate'] as DateTime?;
    _isPresent = snapshotData['isPresent'] as bool?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('ATTENDANCE')
          : FirebaseFirestore.instance.collectionGroup('ATTENDANCE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('ATTENDANCE').doc(id);

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceRecord.fromSnapshot(s));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceRecord.fromSnapshot(s));

  static AttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceRecordData({
  String? id,
  String? note,
  String? userId,
  int? checkInTime,
  int? checkOutTime,
  String? checkOutLocation,
  String? outletId,
  String? dayId,
  bool? status,
  String? checkInLocation,
  String? monthId,
  String? yearId,
  String? locationName,
  String? street,
  String? locality,
  String? subLocality,
  int? postalCode,
  LocationDetailsStruct? checkInLocationDetails,
  LocationDetailsStruct? checkOutLocationDetails,
  DateTime? createdDate,
  bool? isPresent,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'note': note,
      'userId': userId,
      'checkInTime': checkInTime,
      'checkOutTime': checkOutTime,
      'checkOutLocation': checkOutLocation,
      'outletId': outletId,
      'dayId': dayId,
      'status': status,
      'checkInLocation': checkInLocation,
      'monthId': monthId,
      'yearId': yearId,
      'locationName': locationName,
      'street': street,
      'locality': locality,
      'subLocality': subLocality,
      'postalCode': postalCode,
      'checkInLocationDetails': LocationDetailsStruct().toMap(),
      'checkOutLocationDetails': LocationDetailsStruct().toMap(),
      'createdDate': createdDate,
      'isPresent': isPresent,
    }.withoutNulls,
  );

  // Handle nested data for "checkInLocationDetails" field.
  addLocationDetailsStructData(
      firestoreData, checkInLocationDetails, 'checkInLocationDetails');

  // Handle nested data for "checkOutLocationDetails" field.
  addLocationDetailsStructData(
      firestoreData, checkOutLocationDetails, 'checkOutLocationDetails');

  return firestoreData;
}

class AttendanceRecordDocumentEquality implements Equality<AttendanceRecord> {
  const AttendanceRecordDocumentEquality();

  @override
  bool equals(AttendanceRecord? e1, AttendanceRecord? e2) {
    return e1?.id == e2?.id &&
        e1?.note == e2?.note &&
        e1?.userId == e2?.userId &&
        e1?.checkInTime == e2?.checkInTime &&
        e1?.checkOutTime == e2?.checkOutTime &&
        e1?.checkOutLocation == e2?.checkOutLocation &&
        e1?.outletId == e2?.outletId &&
        e1?.dayId == e2?.dayId &&
        e1?.status == e2?.status &&
        e1?.checkInLocation == e2?.checkInLocation &&
        e1?.monthId == e2?.monthId &&
        e1?.yearId == e2?.yearId &&
        e1?.locationName == e2?.locationName &&
        e1?.street == e2?.street &&
        e1?.locality == e2?.locality &&
        e1?.subLocality == e2?.subLocality &&
        e1?.postalCode == e2?.postalCode &&
        e1?.checkInLocationDetails == e2?.checkInLocationDetails &&
        e1?.checkOutLocationDetails == e2?.checkOutLocationDetails &&
        e1?.createdDate == e2?.createdDate &&
        e1?.isPresent == e2?.isPresent;
  }

  @override
  int hash(AttendanceRecord? e) => const ListEquality().hash([
        e?.id,
        e?.note,
        e?.userId,
        e?.checkInTime,
        e?.checkOutTime,
        e?.checkOutLocation,
        e?.outletId,
        e?.dayId,
        e?.status,
        e?.checkInLocation,
        e?.monthId,
        e?.yearId,
        e?.locationName,
        e?.street,
        e?.locality,
        e?.subLocality,
        e?.postalCode,
        e?.checkInLocationDetails,
        e?.checkOutLocationDetails,
        e?.createdDate,
        e?.isPresent
      ]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}
