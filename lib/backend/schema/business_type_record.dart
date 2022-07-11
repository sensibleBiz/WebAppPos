import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'business_type_record.g.dart';

abstract class BusinessTypeRecord
    implements Built<BusinessTypeRecord, BusinessTypeRecordBuilder> {
  static Serializer<BusinessTypeRecord> get serializer =>
      _$businessTypeRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  @BuiltValueField(wireName: 'image_url')
  String get imageUrl;

  @nullable
  bool get active;

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

  static void _initializeBuilder(BusinessTypeRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..imageUrl = ''
    ..active = false
    ..code = 0
    ..createdDate = 0
    ..updatedDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BUSINESS_TYPE');

  static Stream<BusinessTypeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BusinessTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BusinessTypeRecord._();
  factory BusinessTypeRecord(
          [void Function(BusinessTypeRecordBuilder) updates]) =
      _$BusinessTypeRecord;

  static BusinessTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBusinessTypeRecordData({
  String id,
  String name,
  String imageUrl,
  bool active,
  int code,
  int createdDate,
  DocumentReference createdBy,
  int updatedDate,
  DocumentReference updatedBy,
}) =>
    serializers.toFirestore(
        BusinessTypeRecord.serializer,
        BusinessTypeRecord((b) => b
          ..id = id
          ..name = name
          ..imageUrl = imageUrl
          ..active = active
          ..code = code
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..updatedDate = updatedDate
          ..updatedBy = updatedBy));
