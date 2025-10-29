import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class InvoiceRecord extends FirestoreRecord {
  InvoiceRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "invoice" field.
  String? _invoice;
  String get invoice => _invoice ?? '';
  bool hasInvoice() => _invoice != null;

  // "invoiceDate" field.
  int? _invoiceDate;
  int get invoiceDate => _invoiceDate ?? 0;
  bool hasInvoiceDate() => _invoiceDate != null;

  // "party" field.
  String? _party;
  String get party => _party ?? '';
  bool hasParty() => _party != null;

  // "paymentMode" field.
  String? _paymentMode;
  String get paymentMode => _paymentMode ?? '';
  bool hasPaymentMode() => _paymentMode != null;

  // "products" field.
  String? _products;
  String get products => _products ?? '';
  bool hasProducts() => _products != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "discountAmt" field.
  double? _discountAmt;
  double get discountAmt => _discountAmt ?? 0.0;
  bool hasDiscountAmt() => _discountAmt != null;

  // "discountPer" field.
  double? _discountPer;
  double get discountPer => _discountPer ?? 0.0;
  bool hasDiscountPer() => _discountPer != null;

  // "delliveryChrg" field.
  double? _delliveryChrg;
  double get delliveryChrg => _delliveryChrg ?? 0.0;
  bool hasDelliveryChrg() => _delliveryChrg != null;

  // "taxAmt" field.
  double? _taxAmt;
  double get taxAmt => _taxAmt ?? 0.0;
  bool hasTaxAmt() => _taxAmt != null;

  // "billAmt" field.
  double? _billAmt;
  double get billAmt => _billAmt ?? 0.0;
  bool hasBillAmt() => _billAmt != null;

  // "finalBillAmt" field.
  double? _finalBillAmt;
  double get finalBillAmt => _finalBillAmt ?? 0.0;
  bool hasFinalBillAmt() => _finalBillAmt != null;

  // "updateDate" field.
  int? _updateDate;
  int get updateDate => _updateDate ?? 0;
  bool hasUpdateDate() => _updateDate != null;

  // "createdDate" field.
  int? _createdDate;
  int get createdDate => _createdDate ?? 0;
  bool hasCreatedDate() => _createdDate != null;

  // "createdBy" field.
  DocumentReference? _createdBy;
  DocumentReference? get createdBy => _createdBy;
  bool hasCreatedBy() => _createdBy != null;

  // "roundOff" field.
  double? _roundOff;
  double get roundOff => _roundOff ?? 0.0;
  bool hasRoundOff() => _roundOff != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "updatedBy" field.
  DocumentReference? _updatedBy;
  DocumentReference? get updatedBy => _updatedBy;
  bool hasUpdatedBy() => _updatedBy != null;

  // "shiftId" field.
  String? _shiftId;
  String get shiftId => _shiftId ?? '';
  bool hasShiftId() => _shiftId != null;

  // "productList" field.
  List<SelltemListStruct>? _productList;
  List<SelltemListStruct> get productList => _productList ?? const [];
  bool hasProductList() => _productList != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _invoice = snapshotData['invoice'] as String?;
    _invoiceDate = castToType<int>(snapshotData['invoiceDate']);
    _party = snapshotData['party'] as String?;
    _paymentMode = snapshotData['paymentMode'] as String?;
    _products = snapshotData['products'] as String?;
    _dayId = snapshotData['dayId'] as String?;
    _discountAmt = castToType<double>(snapshotData['discountAmt']);
    _discountPer = castToType<double>(snapshotData['discountPer']);
    _delliveryChrg = castToType<double>(snapshotData['delliveryChrg']);
    _taxAmt = castToType<double>(snapshotData['taxAmt']);
    _billAmt = castToType<double>(snapshotData['billAmt']);
    _finalBillAmt = castToType<double>(snapshotData['finalBillAmt']);
    _updateDate = castToType<int>(snapshotData['updateDate']);
    _createdDate = castToType<int>(snapshotData['createdDate']);
    _createdBy = snapshotData['createdBy'] as DocumentReference?;
    _roundOff = castToType<double>(snapshotData['roundOff']);
    _code = castToType<int>(snapshotData['code']);
    _updatedBy = snapshotData['updatedBy'] as DocumentReference?;
    _shiftId = snapshotData['shiftId'] as String?;
    _productList = getStructList(
      snapshotData['productList'],
      SelltemListStruct.fromMap,
    );
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('INVOICE')
          : FirebaseFirestore.instance.collectionGroup('INVOICE');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('INVOICE').doc(id);

  static Stream<InvoiceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => InvoiceRecord.fromSnapshot(s));

  static Future<InvoiceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => InvoiceRecord.fromSnapshot(s));

  static InvoiceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      InvoiceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static InvoiceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      InvoiceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'InvoiceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is InvoiceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createInvoiceRecordData({
  String? id,
  String? invoice,
  int? invoiceDate,
  String? party,
  String? paymentMode,
  String? products,
  String? dayId,
  double? discountAmt,
  double? discountPer,
  double? delliveryChrg,
  double? taxAmt,
  double? billAmt,
  double? finalBillAmt,
  int? updateDate,
  int? createdDate,
  DocumentReference? createdBy,
  double? roundOff,
  int? code,
  DocumentReference? updatedBy,
  String? shiftId,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'invoice': invoice,
      'invoiceDate': invoiceDate,
      'party': party,
      'paymentMode': paymentMode,
      'products': products,
      'dayId': dayId,
      'discountAmt': discountAmt,
      'discountPer': discountPer,
      'delliveryChrg': delliveryChrg,
      'taxAmt': taxAmt,
      'billAmt': billAmt,
      'finalBillAmt': finalBillAmt,
      'updateDate': updateDate,
      'createdDate': createdDate,
      'createdBy': createdBy,
      'roundOff': roundOff,
      'code': code,
      'updatedBy': updatedBy,
      'shiftId': shiftId,
    }.withoutNulls,
  );

  return firestoreData;
}

class InvoiceRecordDocumentEquality implements Equality<InvoiceRecord> {
  const InvoiceRecordDocumentEquality();

  @override
  bool equals(InvoiceRecord? e1, InvoiceRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.invoice == e2?.invoice &&
        e1?.invoiceDate == e2?.invoiceDate &&
        e1?.party == e2?.party &&
        e1?.paymentMode == e2?.paymentMode &&
        e1?.products == e2?.products &&
        e1?.dayId == e2?.dayId &&
        e1?.discountAmt == e2?.discountAmt &&
        e1?.discountPer == e2?.discountPer &&
        e1?.delliveryChrg == e2?.delliveryChrg &&
        e1?.taxAmt == e2?.taxAmt &&
        e1?.billAmt == e2?.billAmt &&
        e1?.finalBillAmt == e2?.finalBillAmt &&
        e1?.updateDate == e2?.updateDate &&
        e1?.createdDate == e2?.createdDate &&
        e1?.createdBy == e2?.createdBy &&
        e1?.roundOff == e2?.roundOff &&
        e1?.code == e2?.code &&
        e1?.updatedBy == e2?.updatedBy &&
        e1?.shiftId == e2?.shiftId &&
        listEquality.equals(e1?.productList, e2?.productList);
  }

  @override
  int hash(InvoiceRecord? e) => const ListEquality().hash([
        e?.id,
        e?.invoice,
        e?.invoiceDate,
        e?.party,
        e?.paymentMode,
        e?.products,
        e?.dayId,
        e?.discountAmt,
        e?.discountPer,
        e?.delliveryChrg,
        e?.taxAmt,
        e?.billAmt,
        e?.finalBillAmt,
        e?.updateDate,
        e?.createdDate,
        e?.createdBy,
        e?.roundOff,
        e?.code,
        e?.updatedBy,
        e?.shiftId,
        e?.productList
      ]);

  @override
  bool isValidKey(Object? o) => o is InvoiceRecord;
}
