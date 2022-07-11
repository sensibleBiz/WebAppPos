import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'tax_master_record.g.dart';

abstract class TaxMasterRecord
    implements Built<TaxMasterRecord, TaxMasterRecordBuilder> {
  static Serializer<TaxMasterRecord> get serializer =>
      _$taxMasterRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  double get percentage;

  @nullable
  int get code;

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

  static void _initializeBuilder(TaxMasterRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..percentage = 0.0
    ..code = 0
    ..createdDate = 0
    ..updatedDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('TAX_MASTER');

  static Stream<TaxMasterRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<TaxMasterRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  TaxMasterRecord._();
  factory TaxMasterRecord([void Function(TaxMasterRecordBuilder) updates]) =
      _$TaxMasterRecord;

  static TaxMasterRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createTaxMasterRecordData({
  String id,
  String name,
  double percentage,
  int code,
  int createdDate,
  DocumentReference createdBy,
  int updatedDate,
  DocumentReference updatedBy,
}) =>
    serializers.toFirestore(
        TaxMasterRecord.serializer,
        TaxMasterRecord((t) => t
          ..id = id
          ..name = name
          ..percentage = percentage
          ..code = code
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..updatedDate = updatedDate
          ..updatedBy = updatedBy));
