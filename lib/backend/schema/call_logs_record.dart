import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CallLogsRecord extends FirestoreRecord {
  CallLogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "createdAt" field.
  int? _createdAt;
  int get createdAt => _createdAt ?? 0;
  bool hasCreatedAt() => _createdAt != null;

  // "department" field.
  String? _department;
  String get department => _department ?? '';
  bool hasDepartment() => _department != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "direction" field.
  CallLogStatus? _direction;
  CallLogStatus? get direction => _direction;
  bool hasDirection() => _direction != null;

  // "durationSeconds" field.
  int? _durationSeconds;
  int get durationSeconds => _durationSeconds ?? 0;
  bool hasDurationSeconds() => _durationSeconds != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  bool hasNumber() => _number != null;

  // "phoneAccountId" field.
  String? _phoneAccountId;
  String get phoneAccountId => _phoneAccountId ?? '';
  bool hasPhoneAccountId() => _phoneAccountId != null;

  // "receiverMobileNo" field.
  String? _receiverMobileNo;
  String get receiverMobileNo => _receiverMobileNo ?? '';
  bool hasReceiverMobileNo() => _receiverMobileNo != null;

  // "receiverName" field.
  String? _receiverName;
  String get receiverName => _receiverName ?? '';
  bool hasReceiverName() => _receiverName != null;

  // "simLabel" field.
  String? _simLabel;
  String get simLabel => _simLabel ?? '';
  bool hasSimLabel() => _simLabel != null;

  // "simPhoneNumber" field.
  String? _simPhoneNumber;
  String get simPhoneNumber => _simPhoneNumber ?? '';
  bool hasSimPhoneNumber() => _simPhoneNumber != null;

  // "subscriptionId" field.
  String? _subscriptionId;
  String get subscriptionId => _subscriptionId ?? '';
  bool hasSubscriptionId() => _subscriptionId != null;

  // "timestamp" field.
  int? _timestamp;
  int get timestamp => _timestamp ?? 0;
  bool hasTimestamp() => _timestamp != null;

  // "uploadedAt" field.
  String? _uploadedAt;
  String get uploadedAt => _uploadedAt ?? '';
  bool hasUploadedAt() => _uploadedAt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _createdAt = castToType<int>(snapshotData['createdAt']);
    _department = snapshotData['department'] as String?;
    _deviceId = snapshotData['deviceId'] as String?;
    _direction = snapshotData['direction'] is CallLogStatus
        ? snapshotData['direction']
        : deserializeEnum<CallLogStatus>(snapshotData['direction']);
    _durationSeconds = castToType<int>(snapshotData['durationSeconds']);
    _id = snapshotData['id'] as String?;
    _name = snapshotData['name'] as String?;
    _number = snapshotData['number'] as String?;
    _phoneAccountId = snapshotData['phoneAccountId'] as String?;
    _receiverMobileNo = snapshotData['receiverMobileNo'] as String?;
    _receiverName = snapshotData['receiverName'] as String?;
    _simLabel = snapshotData['simLabel'] as String?;
    _simPhoneNumber = snapshotData['simPhoneNumber'] as String?;
    _subscriptionId = snapshotData['subscriptionId'] as String?;
    _timestamp = castToType<int>(snapshotData['timestamp']);
    _uploadedAt = snapshotData['uploadedAt'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CALL_LOGS')
          : FirebaseFirestore.instance.collectionGroup('CALL_LOGS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('CALL_LOGS').doc(id);

  static Stream<CallLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CallLogsRecord.fromSnapshot(s));

  static Future<CallLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CallLogsRecord.fromSnapshot(s));

  static CallLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CallLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CallLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CallLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CallLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CallLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCallLogsRecordData({
  int? createdAt,
  String? department,
  String? deviceId,
  CallLogStatus? direction,
  int? durationSeconds,
  String? id,
  String? name,
  String? number,
  String? phoneAccountId,
  String? receiverMobileNo,
  String? receiverName,
  String? simLabel,
  String? simPhoneNumber,
  String? subscriptionId,
  int? timestamp,
  String? uploadedAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'createdAt': createdAt,
      'department': department,
      'deviceId': deviceId,
      'direction': direction,
      'durationSeconds': durationSeconds,
      'id': id,
      'name': name,
      'number': number,
      'phoneAccountId': phoneAccountId,
      'receiverMobileNo': receiverMobileNo,
      'receiverName': receiverName,
      'simLabel': simLabel,
      'simPhoneNumber': simPhoneNumber,
      'subscriptionId': subscriptionId,
      'timestamp': timestamp,
      'uploadedAt': uploadedAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CallLogsRecordDocumentEquality implements Equality<CallLogsRecord> {
  const CallLogsRecordDocumentEquality();

  @override
  bool equals(CallLogsRecord? e1, CallLogsRecord? e2) {
    return e1?.createdAt == e2?.createdAt &&
        e1?.department == e2?.department &&
        e1?.deviceId == e2?.deviceId &&
        e1?.direction == e2?.direction &&
        e1?.durationSeconds == e2?.durationSeconds &&
        e1?.id == e2?.id &&
        e1?.name == e2?.name &&
        e1?.number == e2?.number &&
        e1?.phoneAccountId == e2?.phoneAccountId &&
        e1?.receiverMobileNo == e2?.receiverMobileNo &&
        e1?.receiverName == e2?.receiverName &&
        e1?.simLabel == e2?.simLabel &&
        e1?.simPhoneNumber == e2?.simPhoneNumber &&
        e1?.subscriptionId == e2?.subscriptionId &&
        e1?.timestamp == e2?.timestamp &&
        e1?.uploadedAt == e2?.uploadedAt;
  }

  @override
  int hash(CallLogsRecord? e) => const ListEquality().hash([
        e?.createdAt,
        e?.department,
        e?.deviceId,
        e?.direction,
        e?.durationSeconds,
        e?.id,
        e?.name,
        e?.number,
        e?.phoneAccountId,
        e?.receiverMobileNo,
        e?.receiverName,
        e?.simLabel,
        e?.simPhoneNumber,
        e?.subscriptionId,
        e?.timestamp,
        e?.uploadedAt
      ]);

  @override
  bool isValidKey(Object? o) => o is CallLogsRecord;
}
