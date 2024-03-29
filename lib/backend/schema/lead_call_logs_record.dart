import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadCallLogsRecord extends FirestoreRecord {
  LeadCallLogsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "date" field.
  int? _date;
  int get date => _date ?? 0;
  bool hasDate() => _date != null;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  bool hasTime() => _time != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "call_note" field.
  String? _callNote;
  String get callNote => _callNote ?? '';
  bool hasCallNote() => _callNote != null;

  // "leadMId" field.
  String? _leadMId;
  String get leadMId => _leadMId ?? '';
  bool hasLeadMId() => _leadMId != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "minute" field.
  int? _minute;
  int get minute => _minute ?? 0;
  bool hasMinute() => _minute != null;

  // "sec" field.
  int? _sec;
  int get sec => _sec ?? 0;
  bool hasSec() => _sec != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "timestamp" field.
  DateTime? _timestamp;
  DateTime? get timestamp => _timestamp;
  bool hasTimestamp() => _timestamp != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _date = castToType<int>(snapshotData['date']);
    _time = castToType<int>(snapshotData['time']);
    _type = snapshotData['type'] as String?;
    _callNote = snapshotData['call_note'] as String?;
    _leadMId = snapshotData['leadMId'] as String?;
    _username = snapshotData['username'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _minute = castToType<int>(snapshotData['minute']);
    _sec = castToType<int>(snapshotData['sec']);
    _id = snapshotData['id'] as String?;
    _timestamp = snapshotData['timestamp'] as DateTime?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('LEAD_CALL_LOGS')
          : FirebaseFirestore.instance.collectionGroup('LEAD_CALL_LOGS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('LEAD_CALL_LOGS').doc(id);

  static Stream<LeadCallLogsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadCallLogsRecord.fromSnapshot(s));

  static Future<LeadCallLogsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadCallLogsRecord.fromSnapshot(s));

  static LeadCallLogsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadCallLogsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadCallLogsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadCallLogsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadCallLogsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadCallLogsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadCallLogsRecordData({
  int? date,
  int? time,
  String? type,
  String? callNote,
  String? leadMId,
  String? username,
  String? mobile,
  int? minute,
  int? sec,
  String? id,
  DateTime? timestamp,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'date': date,
      'time': time,
      'type': type,
      'call_note': callNote,
      'leadMId': leadMId,
      'username': username,
      'mobile': mobile,
      'minute': minute,
      'sec': sec,
      'id': id,
      'timestamp': timestamp,
    }.withoutNulls,
  );

  return firestoreData;
}

class LeadCallLogsRecordDocumentEquality
    implements Equality<LeadCallLogsRecord> {
  const LeadCallLogsRecordDocumentEquality();

  @override
  bool equals(LeadCallLogsRecord? e1, LeadCallLogsRecord? e2) {
    return e1?.date == e2?.date &&
        e1?.time == e2?.time &&
        e1?.type == e2?.type &&
        e1?.callNote == e2?.callNote &&
        e1?.leadMId == e2?.leadMId &&
        e1?.username == e2?.username &&
        e1?.mobile == e2?.mobile &&
        e1?.minute == e2?.minute &&
        e1?.sec == e2?.sec &&
        e1?.id == e2?.id &&
        e1?.timestamp == e2?.timestamp;
  }

  @override
  int hash(LeadCallLogsRecord? e) => const ListEquality().hash([
        e?.date,
        e?.time,
        e?.type,
        e?.callNote,
        e?.leadMId,
        e?.username,
        e?.mobile,
        e?.minute,
        e?.sec,
        e?.id,
        e?.timestamp
      ]);

  @override
  bool isValidKey(Object? o) => o is LeadCallLogsRecord;
}
