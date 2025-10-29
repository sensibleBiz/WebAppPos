import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomerFeedbackRecord extends FirestoreRecord {
  CustomerFeedbackRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "ticket" field.
  String? _ticket;
  String get ticket => _ticket ?? '';
  bool hasTicket() => _ticket != null;

  // "leadRefId" field.
  String? _leadRefId;
  String get leadRefId => _leadRefId ?? '';
  bool hasLeadRefId() => _leadRefId != null;

  // "custFeedback" field.
  List<CustFeedbackStruct>? _custFeedback;
  List<CustFeedbackStruct> get custFeedback => _custFeedback ?? const [];
  bool hasCustFeedback() => _custFeedback != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _ticket = snapshotData['ticket'] as String?;
    _leadRefId = snapshotData['leadRefId'] as String?;
    _custFeedback = getStructList(
      snapshotData['custFeedback'],
      CustFeedbackStruct.fromMap,
    );
    _comment = snapshotData['comment'] as String?;
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _name = snapshotData['name'] as String?;
    _mobile = snapshotData['mobile'] as String?;
    _email = snapshotData['email'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('CUSTOMER_FEEDBACK')
          : FirebaseFirestore.instance.collectionGroup('CUSTOMER_FEEDBACK');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('CUSTOMER_FEEDBACK').doc(id);

  static Stream<CustomerFeedbackRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CustomerFeedbackRecord.fromSnapshot(s));

  static Future<CustomerFeedbackRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => CustomerFeedbackRecord.fromSnapshot(s));

  static CustomerFeedbackRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CustomerFeedbackRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CustomerFeedbackRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CustomerFeedbackRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CustomerFeedbackRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CustomerFeedbackRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCustomerFeedbackRecordData({
  String? id,
  String? ticket,
  String? leadRefId,
  String? comment,
  int? createdDate,
  String? name,
  String? mobile,
  String? email,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'ticket': ticket,
      'leadRefId': leadRefId,
      'comment': comment,
      'createdDate': createdDate,
      'name': name,
      'mobile': mobile,
      'email': email,
    }.withoutNulls,
  );

  return firestoreData;
}

class CustomerFeedbackRecordDocumentEquality
    implements Equality<CustomerFeedbackRecord> {
  const CustomerFeedbackRecordDocumentEquality();

  @override
  bool equals(CustomerFeedbackRecord? e1, CustomerFeedbackRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.ticket == e2?.ticket &&
        e1?.leadRefId == e2?.leadRefId &&
        listEquality.equals(e1?.custFeedback, e2?.custFeedback) &&
        e1?.comment == e2?.comment &&
        e1?.createdDate == e2?.createdDate &&
        e1?.name == e2?.name &&
        e1?.mobile == e2?.mobile &&
        e1?.email == e2?.email;
  }

  @override
  int hash(CustomerFeedbackRecord? e) => const ListEquality().hash([
        e?.id,
        e?.ticket,
        e?.leadRefId,
        e?.custFeedback,
        e?.comment,
        e?.createdDate,
        e?.name,
        e?.mobile,
        e?.email
      ]);

  @override
  bool isValidKey(Object? o) => o is CustomerFeedbackRecord;
}
