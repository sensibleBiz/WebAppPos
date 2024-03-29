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
    }.withoutNulls,
  );

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
        e1?.yearId == e2?.yearId;
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
        e?.yearId
      ]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}
