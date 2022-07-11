import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'unit_type_record.g.dart';

abstract class UnitTypeRecord
    implements Built<UnitTypeRecord, UnitTypeRecordBuilder> {
  static Serializer<UnitTypeRecord> get serializer =>
      _$unitTypeRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  int get code;

  @nullable
  String get unitType;

  @nullable
  int get factor;

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

  static void _initializeBuilder(UnitTypeRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..code = 0
    ..unitType = ''
    ..factor = 0
    ..createdDate = 0
    ..updatedDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('UNIT_TYPE');

  static Stream<UnitTypeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UnitTypeRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UnitTypeRecord._();
  factory UnitTypeRecord([void Function(UnitTypeRecordBuilder) updates]) =
      _$UnitTypeRecord;

  static UnitTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUnitTypeRecordData({
  String id,
  String name,
  int code,
  String unitType,
  int factor,
  int createdDate,
  DocumentReference createdBy,
  int updatedDate,
  DocumentReference updatedBy,
}) =>
    serializers.toFirestore(
        UnitTypeRecord.serializer,
        UnitTypeRecord((u) => u
          ..id = id
          ..name = name
          ..code = code
          ..unitType = unitType
          ..factor = factor
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..updatedDate = updatedDate
          ..updatedBy = updatedBy));
