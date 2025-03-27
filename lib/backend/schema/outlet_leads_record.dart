import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OutletLeadsRecord extends FirestoreRecord {
  OutletLeadsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "area" field.
  String? _area;
  String get area => _area ?? '';
  bool hasArea() => _area != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "comments" field.
  String? _comments;
  String get comments => _comments ?? '';
  bool hasComments() => _comments != null;

  // "createdDateTime" field.
  DateTime? _createdDateTime;
  DateTime? get createdDateTime => _createdDateTime;
  bool hasCreatedDateTime() => _createdDateTime != null;

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "id" field.
  int? _id;
  int get id => _id ?? 0;
  bool hasId() => _id != null;

  // "logId" field.
  int? _logId;
  int get logId => _logId ?? 0;
  bool hasLogId() => _logId != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "mobileAlt" field.
  String? _mobileAlt;
  String get mobileAlt => _mobileAlt ?? '';
  bool hasMobileAlt() => _mobileAlt != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  // "requirement" field.
  String? _requirement;
  String get requirement => _requirement ?? '';
  bool hasRequirement() => _requirement != null;

  // "source" field.
  String? _source;
  String get source => _source ?? '';
  bool hasSource() => _source != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "businessName" field.
  String? _businessName;
  String get businessName => _businessName ?? '';
  bool hasBusinessName() => _businessName != null;

  // "businessType" field.
  String? _businessType;
  String get businessType => _businessType ?? '';
  bool hasBusinessType() => _businessType != null;

  // "businessTypeRef" field.
  DocumentReference? _businessTypeRef;
  DocumentReference? get businessTypeRef => _businessTypeRef;
  bool hasBusinessTypeRef() => _businessTypeRef != null;

  // "priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  bool hasPriority() => _priority != null;

  // "monthId" field.
  String? _monthId;
  String get monthId => _monthId ?? '';
  bool hasMonthId() => _monthId != null;

  // "yearId" field.
  String? _yearId;
  String get yearId => _yearId ?? '';
  bool hasYearId() => _yearId != null;

  // "isDealerLead" field.
  bool? _isDealerLead;
  bool get isDealerLead => _isDealerLead ?? false;
  bool hasIsDealerLead() => _isDealerLead != null;

  // "isDuplicate" field.
  bool? _isDuplicate;
  bool get isDuplicate => _isDuplicate ?? false;
  bool hasIsDuplicate() => _isDuplicate != null;

  // "zone" field.
  String? _zone;
  String get zone => _zone ?? '';
  bool hasZone() => _zone != null;

  // "ticket" field.
  String? _ticket;
  String get ticket => _ticket ?? '';
  bool hasTicket() => _ticket != null;

  // "customFields" field.
  CustomFieldsStruct? _customFields;
  CustomFieldsStruct get customFields => _customFields ?? CustomFieldsStruct();
  bool hasCustomFields() => _customFields != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _area = snapshotData['area'] as String?;
    _city = snapshotData['city'] as String?;
    _comments = snapshotData['comments'] as String?;
    _createdDateTime = snapshotData['createdDateTime'] as DateTime?;
    _date = snapshotData['date'] as String?;
    _email = snapshotData['email'] as String?;
    _id = castToType<int>(snapshotData['id']);
    _logId = castToType<int>(snapshotData['logId']);
    _mobile = snapshotData['mobile'] as String?;
    _mobileAlt = snapshotData['mobileAlt'] as String?;
    _phone = snapshotData['phone'] as String?;
    _requirement = snapshotData['requirement'] as String?;
    _source = snapshotData['source'] as String?;
    _state = snapshotData['state'] as String?;
    _status = snapshotData['status'] as String?;
    _time = snapshotData['time'] as String?;
    _username = snapshotData['username'] as String?;
    _businessName = snapshotData['businessName'] as String?;
    _businessType = snapshotData['businessType'] as String?;
    _businessTypeRef = snapshotData['businessTypeRef'] as DocumentReference?;
    _priority = snapshotData['priority'] as String?;
    _monthId = snapshotData['monthId'] as String?;
    _yearId = snapshotData['yearId'] as String?;
    _isDealerLead = snapshotData['isDealerLead'] as bool?;
    _isDuplicate = snapshotData['isDuplicate'] as bool?;
    _zone = snapshotData['zone'] as String?;
    _ticket = snapshotData['ticket'] as String?;
    _customFields = snapshotData['customFields'] is CustomFieldsStruct
        ? snapshotData['customFields']
        : CustomFieldsStruct.maybeFromMap(snapshotData['customFields']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('OUTLET_LEADS')
          : FirebaseFirestore.instance.collectionGroup('OUTLET_LEADS');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('OUTLET_LEADS').doc(id);

  static Stream<OutletLeadsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OutletLeadsRecord.fromSnapshot(s));

  static Future<OutletLeadsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OutletLeadsRecord.fromSnapshot(s));

  static OutletLeadsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OutletLeadsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OutletLeadsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OutletLeadsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OutletLeadsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OutletLeadsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOutletLeadsRecordData({
  String? area,
  String? city,
  String? comments,
  DateTime? createdDateTime,
  String? date,
  String? email,
  int? id,
  int? logId,
  String? mobile,
  String? mobileAlt,
  String? phone,
  String? requirement,
  String? source,
  String? state,
  String? status,
  String? time,
  String? username,
  String? businessName,
  String? businessType,
  DocumentReference? businessTypeRef,
  String? priority,
  String? monthId,
  String? yearId,
  bool? isDealerLead,
  bool? isDuplicate,
  String? zone,
  String? ticket,
  CustomFieldsStruct? customFields,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'area': area,
      'city': city,
      'comments': comments,
      'createdDateTime': createdDateTime,
      'date': date,
      'email': email,
      'id': id,
      'logId': logId,
      'mobile': mobile,
      'mobileAlt': mobileAlt,
      'phone': phone,
      'requirement': requirement,
      'source': source,
      'state': state,
      'status': status,
      'time': time,
      'username': username,
      'businessName': businessName,
      'businessType': businessType,
      'businessTypeRef': businessTypeRef,
      'priority': priority,
      'monthId': monthId,
      'yearId': yearId,
      'isDealerLead': isDealerLead,
      'isDuplicate': isDuplicate,
      'zone': zone,
      'ticket': ticket,
      'customFields': CustomFieldsStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "customFields" field.
  addCustomFieldsStructData(firestoreData, customFields, 'customFields');

  return firestoreData;
}

class OutletLeadsRecordDocumentEquality implements Equality<OutletLeadsRecord> {
  const OutletLeadsRecordDocumentEquality();

  @override
  bool equals(OutletLeadsRecord? e1, OutletLeadsRecord? e2) {
    return e1?.area == e2?.area &&
        e1?.city == e2?.city &&
        e1?.comments == e2?.comments &&
        e1?.createdDateTime == e2?.createdDateTime &&
        e1?.date == e2?.date &&
        e1?.email == e2?.email &&
        e1?.id == e2?.id &&
        e1?.logId == e2?.logId &&
        e1?.mobile == e2?.mobile &&
        e1?.mobileAlt == e2?.mobileAlt &&
        e1?.phone == e2?.phone &&
        e1?.requirement == e2?.requirement &&
        e1?.source == e2?.source &&
        e1?.state == e2?.state &&
        e1?.status == e2?.status &&
        e1?.time == e2?.time &&
        e1?.username == e2?.username &&
        e1?.businessName == e2?.businessName &&
        e1?.businessType == e2?.businessType &&
        e1?.businessTypeRef == e2?.businessTypeRef &&
        e1?.priority == e2?.priority &&
        e1?.monthId == e2?.monthId &&
        e1?.yearId == e2?.yearId &&
        e1?.isDealerLead == e2?.isDealerLead &&
        e1?.isDuplicate == e2?.isDuplicate &&
        e1?.zone == e2?.zone &&
        e1?.ticket == e2?.ticket &&
        e1?.customFields == e2?.customFields;
  }

  @override
  int hash(OutletLeadsRecord? e) => const ListEquality().hash([
        e?.area,
        e?.city,
        e?.comments,
        e?.createdDateTime,
        e?.date,
        e?.email,
        e?.id,
        e?.logId,
        e?.mobile,
        e?.mobileAlt,
        e?.phone,
        e?.requirement,
        e?.source,
        e?.state,
        e?.status,
        e?.time,
        e?.username,
        e?.businessName,
        e?.businessType,
        e?.businessTypeRef,
        e?.priority,
        e?.monthId,
        e?.yearId,
        e?.isDealerLead,
        e?.isDuplicate,
        e?.zone,
        e?.ticket,
        e?.customFields
      ]);

  @override
  bool isValidKey(Object? o) => o is OutletLeadsRecord;
}
