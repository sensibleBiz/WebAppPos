import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'product_master_record.g.dart';

abstract class ProductMasterRecord
    implements Built<ProductMasterRecord, ProductMasterRecordBuilder> {
  static Serializer<ProductMasterRecord> get serializer =>
      _$productMasterRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  BuiltList<String> get imageUrl;

  @nullable
  int get hsnCode;

  @nullable
  String get barcode;

  @nullable
  DocumentReference get categoryRef;

  @nullable
  DocumentReference get subCategoryRef;

  @nullable
  int get code;

  @nullable
  String get regionalName;

  @nullable
  int get createdDate;

  @nullable
  DocumentReference get createdBy;

  @nullable
  int get updatedDate;

  @nullable
  DocumentReference get updatedBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(ProductMasterRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..imageUrl = ListBuilder()
    ..hsnCode = 0
    ..barcode = ''
    ..code = 0
    ..regionalName = ''
    ..createdDate = 0
    ..updatedDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('PRODUCT_MASTER');

  static Stream<ProductMasterRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ProductMasterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ProductMasterRecord._();
  factory ProductMasterRecord(
          [void Function(ProductMasterRecordBuilder) updates]) =
      _$ProductMasterRecord;

  static ProductMasterRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createProductMasterRecordData({
  String id,
  String name,
  int hsnCode,
  String barcode,
  DocumentReference categoryRef,
  DocumentReference subCategoryRef,
  int code,
  String regionalName,
  int createdDate,
  DocumentReference createdBy,
  int updatedDate,
  DocumentReference updatedBy,
}) =>
    serializers.toFirestore(
        ProductMasterRecord.serializer,
        ProductMasterRecord((p) => p
          ..id = id
          ..name = name
          ..imageUrl = null
          ..hsnCode = hsnCode
          ..barcode = barcode
          ..categoryRef = categoryRef
          ..subCategoryRef = subCategoryRef
          ..code = code
          ..regionalName = regionalName
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..updatedDate = updatedDate
          ..updatedBy = updatedBy));
