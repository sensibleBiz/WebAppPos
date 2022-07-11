import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'service_point_record.g.dart';

abstract class ServicePointRecord
    implements Built<ServicePointRecord, ServicePointRecordBuilder> {
  static Serializer<ServicePointRecord> get serializer =>
      _$servicePointRecordSerializer;

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

  static void _initializeBuilder(ServicePointRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..code = 0
    ..createdDate = 0
    ..updatedDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('SERVICE_POINT');

  static Stream<ServicePointRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<ServicePointRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  ServicePointRecord._();
  factory ServicePointRecord(
          [void Function(ServicePointRecordBuilder) updates]) =
      _$ServicePointRecord;

  static ServicePointRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createServicePointRecordData({
  String id,
  String name,
  int code,
  int createdDate,
  DocumentReference createdBy,
  int updatedDate,
  DocumentReference updatedBy,
}) =>
    serializers.toFirestore(
        ServicePointRecord.serializer,
        ServicePointRecord((s) => s
          ..id = id
          ..name = name
          ..code = code
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..updatedDate = updatedDate
          ..updatedBy = updatedBy));
