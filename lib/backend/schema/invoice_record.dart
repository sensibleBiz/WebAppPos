import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'invoice_record.g.dart';

abstract class InvoiceRecord
    implements Built<InvoiceRecord, InvoiceRecordBuilder> {
  static Serializer<InvoiceRecord> get serializer => _$invoiceRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get invoice;

  @nullable
  int get invoiceDate;

  @nullable
  String get party;

  @nullable
  String get paymentMode;

  @nullable
  String get products;

  @nullable
  String get dayId;

  @nullable
  double get discountAmt;

  @nullable
  double get discountPer;

  @nullable
  double get delliveryChrg;

  @nullable
  double get taxAmt;

  @nullable
  double get billAmt;

  @nullable
  double get finalBillAmt;

  @nullable
  int get updateDate;

  @nullable
  int get roundOff;

  @nullable
  int get createdDate;

  @nullable
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  DocumentReference get parentReference => reference.parent.parent;

  static void _initializeBuilder(InvoiceRecordBuilder builder) => builder
    ..id = ''
    ..invoice = ''
    ..invoiceDate = 0
    ..party = ''
    ..paymentMode = ''
    ..products = ''
    ..dayId = ''
    ..discountAmt = 0.0
    ..discountPer = 0.0
    ..delliveryChrg = 0.0
    ..taxAmt = 0.0
    ..billAmt = 0.0
    ..finalBillAmt = 0.0
    ..updateDate = 0
    ..roundOff = 0
    ..createdDate = 0;

  static Query<Map<String, dynamic>> collection([DocumentReference parent]) =>
      parent != null
          ? parent.collection('INVOICE')
          : FirebaseFirestore.instance.collectionGroup('INVOICE');

  static DocumentReference createDoc(DocumentReference parent) =>
      parent.collection('INVOICE').doc();

  static Stream<InvoiceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<InvoiceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  InvoiceRecord._();
  factory InvoiceRecord([void Function(InvoiceRecordBuilder) updates]) =
      _$InvoiceRecord;

  static InvoiceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createInvoiceRecordData({
  String id,
  String invoice,
  int invoiceDate,
  String party,
  String paymentMode,
  String products,
  String dayId,
  double discountAmt,
  double discountPer,
  double delliveryChrg,
  double taxAmt,
  double billAmt,
  double finalBillAmt,
  int updateDate,
  int roundOff,
  int createdDate,
  DocumentReference createdBy,
}) =>
    serializers.toFirestore(
        InvoiceRecord.serializer,
        InvoiceRecord((i) => i
          ..id = id
          ..invoice = invoice
          ..invoiceDate = invoiceDate
          ..party = party
          ..paymentMode = paymentMode
          ..products = products
          ..dayId = dayId
          ..discountAmt = discountAmt
          ..discountPer = discountPer
          ..delliveryChrg = delliveryChrg
          ..taxAmt = taxAmt
          ..billAmt = billAmt
          ..finalBillAmt = finalBillAmt
          ..updateDate = updateDate
          ..roundOff = roundOff
          ..createdDate = createdDate
          ..createdBy = createdBy));
