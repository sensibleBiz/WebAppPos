import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'sub_category_record.g.dart';

abstract class SubCategoryRecord
    implements Built<SubCategoryRecord, SubCategoryRecordBuilder> {
  static Serializer<SubCategoryRecord> get serializer =>
      _$subCategoryRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  int get code;

  @nullable
  bool get active;

  @nullable
  String get image;

  @nullable
  DocumentReference get categoryMasterRef;

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

  static void _initializeBuilder(SubCategoryRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..code = 0
    ..active = false
    ..image = ''
    ..regionalName = ''
    ..createdDate = 0
    ..updatedDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SUB_CATEGORY');

  static Stream<SubCategoryRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<SubCategoryRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  SubCategoryRecord._();
  factory SubCategoryRecord([void Function(SubCategoryRecordBuilder) updates]) =
      _$SubCategoryRecord;

  static SubCategoryRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createSubCategoryRecordData({
  String id,
  String name,
  int code,
  bool active,
  String image,
  DocumentReference categoryMasterRef,
  String regionalName,
  int createdDate,
  DocumentReference createdBy,
  int updatedDate,
  DocumentReference updatedBy,
}) =>
    serializers.toFirestore(
        SubCategoryRecord.serializer,
        SubCategoryRecord((s) => s
          ..id = id
          ..name = name
          ..code = code
          ..active = active
          ..image = image
          ..categoryMasterRef = categoryMasterRef
          ..regionalName = regionalName
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..updatedDate = updatedDate
          ..updatedBy = updatedBy));
