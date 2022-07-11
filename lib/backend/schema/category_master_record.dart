import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'category_master_record.g.dart';

abstract class CategoryMasterRecord
    implements Built<CategoryMasterRecord, CategoryMasterRecordBuilder> {
  static Serializer<CategoryMasterRecord> get serializer =>
      _$categoryMasterRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  bool get active;

  @nullable
  String get imageUrl;

  @nullable
  String get regionalName;

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

  static void _initializeBuilder(CategoryMasterRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..active = false
    ..imageUrl = ''
    ..regionalName = ''
    ..code = 0
    ..createdDate = 0
    ..updatedDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('CATEGORY_MASTER');

  static Stream<CategoryMasterRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<CategoryMasterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  CategoryMasterRecord._();
  factory CategoryMasterRecord(
          [void Function(CategoryMasterRecordBuilder) updates]) =
      _$CategoryMasterRecord;

  static CategoryMasterRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createCategoryMasterRecordData({
  String id,
  String name,
  bool active,
  String imageUrl,
  String regionalName,
  int code,
  int createdDate,
  DocumentReference createdBy,
  int updatedDate,
  DocumentReference updatedBy,
}) =>
    serializers.toFirestore(
        CategoryMasterRecord.serializer,
        CategoryMasterRecord((c) => c
          ..id = id
          ..name = name
          ..active = active
          ..imageUrl = imageUrl
          ..regionalName = regionalName
          ..code = code
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..updatedDate = updatedDate
          ..updatedBy = updatedBy));
