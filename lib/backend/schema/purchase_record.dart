import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PurchaseRecord extends FirestoreRecord {
  PurchaseRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "discountAmt" field.
  double? _discountAmt;
  double get discountAmt => _discountAmt ?? 0.0;
  bool hasDiscountAmt() => _discountAmt != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "discountPer" field.
  double? _discountPer;
  double get discountPer => _discountPer ?? 0.0;
  bool hasDiscountPer() => _discountPer != null;

  // "finalBillAmt" field.
  double? _finalBillAmt;
  double get finalBillAmt => _finalBillAmt ?? 0.0;
  bool hasFinalBillAmt() => _finalBillAmt != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "paymentMode" field.
  String? _paymentMode;
  String get paymentMode => _paymentMode ?? '';
  bool hasPaymentMode() => _paymentMode != null;

  // "roundOff" field.
  double? _roundOff;
  double get roundOff => _roundOff ?? 0.0;
  bool hasRoundOff() => _roundOff != null;

  // "party" field.
  String? _party;
  String get party => _party ?? '';
  bool hasParty() => _party != null;

  // "gstNo" field.
  String? _gstNo;
  String get gstNo => _gstNo ?? '';
  bool hasGstNo() => _gstNo != null;

  // "balanceDue" field.
  double? _balanceDue;
  double get balanceDue => _balanceDue ?? 0.0;
  bool hasBalanceDue() => _balanceDue != null;

  // "paidAmt" field.
  double? _paidAmt;
  double get paidAmt => _paidAmt ?? 0.0;
  bool hasPaidAmt() => _paidAmt != null;

  // "productList" field.
  List<PurchaseSaleItemListStruct>? _productList;
  List<PurchaseSaleItemListStruct> get productList => _productList ?? const [];
  bool hasProductList() => _productList != null;

  // "order" field.
  String? _order;
  String get order => _order ?? '';
  bool hasOrder() => _order != null;

  // "authorizedBy" field.
  String? _authorizedBy;
  String get authorizedBy => _authorizedBy ?? '';
  bool hasAuthorizedBy() => _authorizedBy != null;

  // "orderDate" field.
  int? _orderDate;
  int get orderDate => _orderDate ?? 0;
  bool hasOrderDate() => _orderDate != null;

  // "grosssTotal" field.
  double? _grosssTotal;
  double get grosssTotal => _grosssTotal ?? 0.0;
  bool hasGrosssTotal() => _grosssTotal != null;

  // "mobile" field.
  String? _mobile;
  String get mobile => _mobile ?? '';
  bool hasMobile() => _mobile != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "modifiedDate" field.
  int? _modifiedDate;
  int get modifiedDate => _modifiedDate ?? 0;
  bool hasModifiedDate() => _modifiedDate != null;

  // "comment" field.
  String? _comment;
  String get comment => _comment ?? '';
  bool hasComment() => _comment != null;

  // "invoiceDate" field.
  int? _invoiceDate;
  int get invoiceDate => _invoiceDate ?? 0;
  bool hasInvoiceDate() => _invoiceDate != null;

  // "createdBy" field.
  String? _createdBy;
  String get createdBy => _createdBy ?? '';
  bool hasCreatedBy() => _createdBy != null;

  // "orderTime" field.
  DateTime? _orderTime;
  DateTime? get orderTime => _orderTime;
  bool hasOrderTime() => _orderTime != null;

  // "serialNo" field.
  String? _serialNo;
  String get serialNo => _serialNo ?? '';
  bool hasSerialNo() => _serialNo != null;

  // "invoiceNo" field.
  String? _invoiceNo;
  String get invoiceNo => _invoiceNo ?? '';
  bool hasInvoiceNo() => _invoiceNo != null;

  // "modifiedBy" field.
  DocumentReference? _modifiedBy;
  DocumentReference? get modifiedBy => _modifiedBy;
  bool hasModifiedBy() => _modifiedBy != null;

  // "poDueDate" field.
  String? _poDueDate;
  String get poDueDate => _poDueDate ?? '';
  bool hasPoDueDate() => _poDueDate != null;

  // "additionalCharg" field.
  String? _additionalCharg;
  String get additionalCharg => _additionalCharg ?? '';
  bool hasAdditionalCharg() => _additionalCharg != null;

  // "additionalChargAmt" field.
  double? _additionalChargAmt;
  double get additionalChargAmt => _additionalChargAmt ?? 0.0;
  bool hasAdditionalChargAmt() => _additionalChargAmt != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _discountAmt = castToType<double>(snapshotData['discountAmt']);
    _dayId = snapshotData['dayId'] as String?;
    _discountPer = castToType<double>(snapshotData['discountPer']);
    _finalBillAmt = castToType<double>(snapshotData['finalBillAmt']);
    _id = snapshotData['id'] as String?;
    _paymentMode = snapshotData['paymentMode'] as String?;
    _roundOff = castToType<double>(snapshotData['roundOff']);
    _party = snapshotData['party'] as String?;
    _gstNo = snapshotData['gstNo'] as String?;
    _balanceDue = castToType<double>(snapshotData['balanceDue']);
    _paidAmt = castToType<double>(snapshotData['paidAmt']);
    _productList = getStructList(
      snapshotData['productList'],
      PurchaseSaleItemListStruct.fromMap,
    );
    _order = snapshotData['order'] as String?;
    _authorizedBy = snapshotData['authorizedBy'] as String?;
    _orderDate = castToType<int>(snapshotData['orderDate']);
    _grosssTotal = castToType<double>(snapshotData['grosssTotal']);
    _mobile = snapshotData['mobile'] as String?;
    _status = castToType<int>(snapshotData['status']);
    _modifiedDate = castToType<int>(snapshotData['modifiedDate']);
    _comment = snapshotData['comment'] as String?;
    _invoiceDate = castToType<int>(snapshotData['invoiceDate']);
    _createdBy = snapshotData['createdBy'] as String?;
    _orderTime = snapshotData['orderTime'] as DateTime?;
    _serialNo = snapshotData['serialNo'] as String?;
    _invoiceNo = snapshotData['invoiceNo'] as String?;
    _modifiedBy = snapshotData['modifiedBy'] as DocumentReference?;
    _poDueDate = snapshotData['poDueDate'] as String?;
    _additionalCharg = snapshotData['additionalCharg'] as String?;
    _additionalChargAmt =
        castToType<double>(snapshotData['additionalChargAmt']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('PURCHASE')
          : FirebaseFirestore.instance.collectionGroup('PURCHASE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('PURCHASE').doc(id);

  static Stream<PurchaseRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PurchaseRecord.fromSnapshot(s));

  static Future<PurchaseRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PurchaseRecord.fromSnapshot(s));

  static PurchaseRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PurchaseRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PurchaseRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PurchaseRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PurchaseRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PurchaseRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPurchaseRecordData({
  double? discountAmt,
  String? dayId,
  double? discountPer,
  double? finalBillAmt,
  String? id,
  String? paymentMode,
  double? roundOff,
  String? party,
  String? gstNo,
  double? balanceDue,
  double? paidAmt,
  String? order,
  String? authorizedBy,
  int? orderDate,
  double? grosssTotal,
  String? mobile,
  int? status,
  int? modifiedDate,
  String? comment,
  int? invoiceDate,
  String? createdBy,
  DateTime? orderTime,
  String? serialNo,
  String? invoiceNo,
  DocumentReference? modifiedBy,
  String? poDueDate,
  String? additionalCharg,
  double? additionalChargAmt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'discountAmt': discountAmt,
      'dayId': dayId,
      'discountPer': discountPer,
      'finalBillAmt': finalBillAmt,
      'id': id,
      'paymentMode': paymentMode,
      'roundOff': roundOff,
      'party': party,
      'gstNo': gstNo,
      'balanceDue': balanceDue,
      'paidAmt': paidAmt,
      'order': order,
      'authorizedBy': authorizedBy,
      'orderDate': orderDate,
      'grosssTotal': grosssTotal,
      'mobile': mobile,
      'status': status,
      'modifiedDate': modifiedDate,
      'comment': comment,
      'invoiceDate': invoiceDate,
      'createdBy': createdBy,
      'orderTime': orderTime,
      'serialNo': serialNo,
      'invoiceNo': invoiceNo,
      'modifiedBy': modifiedBy,
      'poDueDate': poDueDate,
      'additionalCharg': additionalCharg,
      'additionalChargAmt': additionalChargAmt,
    }.withoutNulls,
  );

  return firestoreData;
}

class PurchaseRecordDocumentEquality implements Equality<PurchaseRecord> {
  const PurchaseRecordDocumentEquality();

  @override
  bool equals(PurchaseRecord? e1, PurchaseRecord? e2) {
    const listEquality = ListEquality();
    return e1?.discountAmt == e2?.discountAmt &&
        e1?.dayId == e2?.dayId &&
        e1?.discountPer == e2?.discountPer &&
        e1?.finalBillAmt == e2?.finalBillAmt &&
        e1?.id == e2?.id &&
        e1?.paymentMode == e2?.paymentMode &&
        e1?.roundOff == e2?.roundOff &&
        e1?.party == e2?.party &&
        e1?.gstNo == e2?.gstNo &&
        e1?.balanceDue == e2?.balanceDue &&
        e1?.paidAmt == e2?.paidAmt &&
        listEquality.equals(e1?.productList, e2?.productList) &&
        e1?.order == e2?.order &&
        e1?.authorizedBy == e2?.authorizedBy &&
        e1?.orderDate == e2?.orderDate &&
        e1?.grosssTotal == e2?.grosssTotal &&
        e1?.mobile == e2?.mobile &&
        e1?.status == e2?.status &&
        e1?.modifiedDate == e2?.modifiedDate &&
        e1?.comment == e2?.comment &&
        e1?.invoiceDate == e2?.invoiceDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.orderTime == e2?.orderTime &&
        e1?.serialNo == e2?.serialNo &&
        e1?.invoiceNo == e2?.invoiceNo &&
        e1?.modifiedBy == e2?.modifiedBy &&
        e1?.poDueDate == e2?.poDueDate &&
        e1?.additionalCharg == e2?.additionalCharg &&
        e1?.additionalChargAmt == e2?.additionalChargAmt;
  }

  @override
  int hash(PurchaseRecord? e) => const ListEquality().hash([
        e?.discountAmt,
        e?.dayId,
        e?.discountPer,
        e?.finalBillAmt,
        e?.id,
        e?.paymentMode,
        e?.roundOff,
        e?.party,
        e?.gstNo,
        e?.balanceDue,
        e?.paidAmt,
        e?.productList,
        e?.order,
        e?.authorizedBy,
        e?.orderDate,
        e?.grosssTotal,
        e?.mobile,
        e?.status,
        e?.modifiedDate,
        e?.comment,
        e?.invoiceDate,
        e?.createdBy,
        e?.orderTime,
        e?.serialNo,
        e?.invoiceNo,
        e?.modifiedBy,
        e?.poDueDate,
        e?.additionalCharg,
        e?.additionalChargAmt
      ]);

  @override
  bool isValidKey(Object? o) => o is PurchaseRecord;
}
