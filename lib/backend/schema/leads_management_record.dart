import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeadsManagementRecord extends FirestoreRecord {
  LeadsManagementRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  // "stage" field.
  String? _stage;
  String get stage => _stage ?? '';
  bool hasStage() => _stage != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "assignedTo" field.
  String? _assignedTo;
  String get assignedTo => _assignedTo ?? '';
  bool hasAssignedTo() => _assignedTo != null;

  // "isCustomer" field.
  bool? _isCustomer;
  bool get isCustomer => _isCustomer ?? false;
  bool hasIsCustomer() => _isCustomer != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "followUpName" field.
  String? _followUpName;
  String get followUpName => _followUpName ?? '';
  bool hasFollowUpName() => _followUpName != null;

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

  // "date" field.
  String? _date;
  String get date => _date ?? '';
  bool hasDate() => _date != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

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

  // "time" field.
  String? _time;
  String get time => _time ?? '';
  bool hasTime() => _time != null;

  // "username" field.
  String? _username;
  String get username => _username ?? '';
  bool hasUsername() => _username != null;

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  bool hasState() => _state != null;

  // "remarks" field.
  String? _remarks;
  String get remarks => _remarks ?? '';
  bool hasRemarks() => _remarks != null;

  // "leadRefId" field.
  String? _leadRefId;
  String get leadRefId => _leadRefId ?? '';
  bool hasLeadRefId() => _leadRefId != null;

  // "updatedBy" field.
  String? _updatedBy;
  String get updatedBy => _updatedBy ?? '';
  bool hasUpdatedBy() => _updatedBy != null;

  // "updatedDate" field.
  int? _updatedDate;
  int get updatedDate => _updatedDate ?? 0;
  bool hasUpdatedDate() => _updatedDate != null;

  // "priority" field.
  String? _priority;
  String get priority => _priority ?? '';
  bool hasPriority() => _priority != null;

  // "leadDate" field.
  String? _leadDate;
  String get leadDate => _leadDate ?? '';
  bool hasLeadDate() => _leadDate != null;

  // "leadCreatedDate" field.
  int? _leadCreatedDate;
  int get leadCreatedDate => _leadCreatedDate ?? 0;
  bool hasLeadCreatedDate() => _leadCreatedDate != null;

  // "leadTag" field.
  List<LeadTagListStruct>? _leadTag;
  List<LeadTagListStruct> get leadTag => _leadTag ?? const [];
  bool hasLeadTag() => _leadTag != null;

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

  // "monthId" field.
  String? _monthId;
  String get monthId => _monthId ?? '';
  bool hasMonthId() => _monthId != null;

  // "yearId" field.
  String? _yearId;
  String get yearId => _yearId ?? '';
  bool hasYearId() => _yearId != null;

  // "assignedBy" field.
  String? _assignedBy;
  String get assignedBy => _assignedBy ?? '';
  bool hasAssignedBy() => _assignedBy != null;

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

  // "closeDate" field.
  String? _closeDate;
  String get closeDate => _closeDate ?? '';
  bool hasCloseDate() => _closeDate != null;

  // "closeDateMili" field.
  int? _closeDateMili;
  int get closeDateMili => _closeDateMili ?? 0;
  bool hasCloseDateMili() => _closeDateMili != null;

  // "assignedToHistory" field.
  List<AssignedToHistoryStruct>? _assignedToHistory;
  List<AssignedToHistoryStruct> get assignedToHistory =>
      _assignedToHistory ?? const [];
  bool hasAssignedToHistory() => _assignedToHistory != null;

  // "contact" field.
  String? _contact;
  String get contact => _contact ?? '';
  bool hasContact() => _contact != null;

  // "leadCampaign" field.
  String? _leadCampaign;
  String get leadCampaign => _leadCampaign ?? '';
  bool hasLeadCampaign() => _leadCampaign != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = snapshotData['status'] as String?;
    _stage = snapshotData['stage'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _assignedTo = snapshotData['assignedTo'] as String?;
    _isCustomer = snapshotData['isCustomer'] as bool?;
    _id = snapshotData['id'] as String?;
    _followUpName = snapshotData['followUpName'] as String?;
    _area = snapshotData['area'] as String?;
    _city = snapshotData['city'] as String?;
    _comments = snapshotData['comments'] as String?;
    _date = snapshotData['date'] as String?;
    _email = snapshotData['email'] as String?;
    _logId = castToType<int>(snapshotData['logId']);
    _mobile = snapshotData['mobile'] as String?;
    _mobileAlt = snapshotData['mobileAlt'] as String?;
    _phone = snapshotData['phone'] as String?;
    _requirement = snapshotData['requirement'] as String?;
    _source = snapshotData['source'] as String?;
    _time = snapshotData['time'] as String?;
    _username = snapshotData['username'] as String?;
    _state = snapshotData['state'] as String?;
    _remarks = snapshotData['remarks'] as String?;
    _leadRefId = snapshotData['leadRefId'] as String?;
    _updatedBy = snapshotData['updatedBy'] as String?;
    _updatedDate = castToType<int>(snapshotData['updatedDate']);
    _priority = snapshotData['priority'] as String?;
    _leadDate = snapshotData['leadDate'] as String?;
    _leadCreatedDate = castToType<int>(snapshotData['leadCreatedDate']);
    _leadTag = getStructList(
      snapshotData['leadTag'],
      LeadTagListStruct.fromMap,
    );
    _businessName = snapshotData['businessName'] as String?;
    _businessType = snapshotData['businessType'] as String?;
    _businessTypeRef = snapshotData['businessTypeRef'] as DocumentReference?;
    _monthId = snapshotData['monthId'] as String?;
    _yearId = snapshotData['yearId'] as String?;
    _assignedBy = snapshotData['assignedBy'] as String?;
    _isDealerLead = snapshotData['isDealerLead'] as bool?;
    _isDuplicate = snapshotData['isDuplicate'] as bool?;
    _zone = snapshotData['zone'] as String?;
    _ticket = snapshotData['ticket'] as String?;
    _customFields = snapshotData['customFields'] is CustomFieldsStruct
        ? snapshotData['customFields']
        : CustomFieldsStruct.maybeFromMap(snapshotData['customFields']);
    _closeDate = snapshotData['closeDate'] as String?;
    _closeDateMili = castToType<int>(snapshotData['closeDateMili']);
    _assignedToHistory = getStructList(
      snapshotData['assignedToHistory'],
      AssignedToHistoryStruct.fromMap,
    );
    _contact = snapshotData['contact'] as String?;
    _leadCampaign = snapshotData['leadCampaign'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('LEADS_MANAGEMENT')
          : FirebaseFirestore.instance.collectionGroup('LEADS_MANAGEMENT');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('LEADS_MANAGEMENT').doc(id);

  static Stream<LeadsManagementRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => LeadsManagementRecord.fromSnapshot(s));

  static Future<LeadsManagementRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => LeadsManagementRecord.fromSnapshot(s));

  static LeadsManagementRecord fromSnapshot(DocumentSnapshot snapshot) =>
      LeadsManagementRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static LeadsManagementRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      LeadsManagementRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'LeadsManagementRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is LeadsManagementRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createLeadsManagementRecordData({
  String? status,
  String? stage,
  int? createdDate,
  String? assignedTo,
  bool? isCustomer,
  String? id,
  String? followUpName,
  String? area,
  String? city,
  String? comments,
  String? date,
  String? email,
  int? logId,
  String? mobile,
  String? mobileAlt,
  String? phone,
  String? requirement,
  String? source,
  String? time,
  String? username,
  String? state,
  String? remarks,
  String? leadRefId,
  String? updatedBy,
  int? updatedDate,
  String? priority,
  String? leadDate,
  int? leadCreatedDate,
  String? businessName,
  String? businessType,
  DocumentReference? businessTypeRef,
  String? monthId,
  String? yearId,
  String? assignedBy,
  bool? isDealerLead,
  bool? isDuplicate,
  String? zone,
  String? ticket,
  CustomFieldsStruct? customFields,
  String? closeDate,
  int? closeDateMili,
  String? contact,
  String? leadCampaign,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'stage': stage,
      'createdDate': createdDate,
      'assignedTo': assignedTo,
      'isCustomer': isCustomer,
      'id': id,
      'followUpName': followUpName,
      'area': area,
      'city': city,
      'comments': comments,
      'date': date,
      'email': email,
      'logId': logId,
      'mobile': mobile,
      'mobileAlt': mobileAlt,
      'phone': phone,
      'requirement': requirement,
      'source': source,
      'time': time,
      'username': username,
      'state': state,
      'remarks': remarks,
      'leadRefId': leadRefId,
      'updatedBy': updatedBy,
      'updatedDate': updatedDate,
      'priority': priority,
      'leadDate': leadDate,
      'leadCreatedDate': leadCreatedDate,
      'businessName': businessName,
      'businessType': businessType,
      'businessTypeRef': businessTypeRef,
      'monthId': monthId,
      'yearId': yearId,
      'assignedBy': assignedBy,
      'isDealerLead': isDealerLead,
      'isDuplicate': isDuplicate,
      'zone': zone,
      'ticket': ticket,
      'customFields': CustomFieldsStruct().toMap(),
      'closeDate': closeDate,
      'closeDateMili': closeDateMili,
      'contact': contact,
      'leadCampaign': leadCampaign,
    }.withoutNulls,
  );

  // Handle nested data for "customFields" field.
  addCustomFieldsStructData(firestoreData, customFields, 'customFields');

  return firestoreData;
}

class LeadsManagementRecordDocumentEquality
    implements Equality<LeadsManagementRecord> {
  const LeadsManagementRecordDocumentEquality();

  @override
  bool equals(LeadsManagementRecord? e1, LeadsManagementRecord? e2) {
    const listEquality = ListEquality();
    return e1?.status == e2?.status &&
        e1?.stage == e2?.stage &&
        e1?.createdDate == e2?.createdDate &&
        e1?.assignedTo == e2?.assignedTo &&
        e1?.isCustomer == e2?.isCustomer &&
        e1?.id == e2?.id &&
        e1?.followUpName == e2?.followUpName &&
        e1?.area == e2?.area &&
        e1?.city == e2?.city &&
        e1?.comments == e2?.comments &&
        e1?.date == e2?.date &&
        e1?.email == e2?.email &&
        e1?.logId == e2?.logId &&
        e1?.mobile == e2?.mobile &&
        e1?.mobileAlt == e2?.mobileAlt &&
        e1?.phone == e2?.phone &&
        e1?.requirement == e2?.requirement &&
        e1?.source == e2?.source &&
        e1?.time == e2?.time &&
        e1?.username == e2?.username &&
        e1?.state == e2?.state &&
        e1?.remarks == e2?.remarks &&
        e1?.leadRefId == e2?.leadRefId &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.updatedDate == e2?.updatedDate &&
        e1?.priority == e2?.priority &&
        e1?.leadDate == e2?.leadDate &&
        e1?.leadCreatedDate == e2?.leadCreatedDate &&
        listEquality.equals(e1?.leadTag, e2?.leadTag) &&
        e1?.businessName == e2?.businessName &&
        e1?.businessType == e2?.businessType &&
        e1?.businessTypeRef == e2?.businessTypeRef &&
        e1?.monthId == e2?.monthId &&
        e1?.yearId == e2?.yearId &&
        e1?.assignedBy == e2?.assignedBy &&
        e1?.isDealerLead == e2?.isDealerLead &&
        e1?.isDuplicate == e2?.isDuplicate &&
        e1?.zone == e2?.zone &&
        e1?.ticket == e2?.ticket &&
        e1?.customFields == e2?.customFields &&
        e1?.closeDate == e2?.closeDate &&
        e1?.closeDateMili == e2?.closeDateMili &&
        listEquality.equals(e1?.assignedToHistory, e2?.assignedToHistory) &&
        e1?.contact == e2?.contact &&
        e1?.leadCampaign == e2?.leadCampaign;
  }

  @override
  int hash(LeadsManagementRecord? e) => const ListEquality().hash([
        e?.status,
        e?.stage,
        e?.createdDate,
        e?.assignedTo,
        e?.isCustomer,
        e?.id,
        e?.followUpName,
        e?.area,
        e?.city,
        e?.comments,
        e?.date,
        e?.email,
        e?.logId,
        e?.mobile,
        e?.mobileAlt,
        e?.phone,
        e?.requirement,
        e?.source,
        e?.time,
        e?.username,
        e?.state,
        e?.remarks,
        e?.leadRefId,
        e?.updatedBy,
        e?.updatedDate,
        e?.priority,
        e?.leadDate,
        e?.leadCreatedDate,
        e?.leadTag,
        e?.businessName,
        e?.businessType,
        e?.businessTypeRef,
        e?.monthId,
        e?.yearId,
        e?.assignedBy,
        e?.isDealerLead,
        e?.isDuplicate,
        e?.zone,
        e?.ticket,
        e?.customFields,
        e?.closeDate,
        e?.closeDateMili,
        e?.assignedToHistory,
        e?.contact,
        e?.leadCampaign
      ]);

  @override
  bool isValidKey(Object? o) => o is LeadsManagementRecord;
}
