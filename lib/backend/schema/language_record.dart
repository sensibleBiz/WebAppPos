import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'language_record.g.dart';

abstract class LanguageRecord
    implements Built<LanguageRecord, LanguageRecordBuilder> {
  static Serializer<LanguageRecord> get serializer =>
      _$languageRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get name;

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

  static void _initializeBuilder(LanguageRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..code = 0
    ..createdDate = 0
    ..updatedDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('LANGUAGE');

  static Stream<LanguageRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<LanguageRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  LanguageRecord._();
  factory LanguageRecord([void Function(LanguageRecordBuilder) updates]) =
      _$LanguageRecord;

  static LanguageRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createLanguageRecordData({
  String id,
  String name,
  int code,
  int createdDate,
  DocumentReference createdBy,
  int updatedDate,
  DocumentReference updatedBy,
}) =>
    serializers.toFirestore(
        LanguageRecord.serializer,
        LanguageRecord((l) => l
          ..id = id
          ..name = name
          ..code = code
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..updatedDate = updatedDate
          ..updatedBy = updatedBy));
