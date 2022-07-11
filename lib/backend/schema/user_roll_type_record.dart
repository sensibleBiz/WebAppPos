import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_roll_type_record.g.dart';

abstract class UserRollTypeRecord
    implements Built<UserRollTypeRecord, UserRollTypeRecordBuilder> {
  static Serializer<UserRollTypeRecord> get serializer =>
      _$userRollTypeRecordSerializer;

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

  static void _initializeBuilder(UserRollTypeRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..code = 0
    ..createdDate = 0
    ..updatedDate = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('USER_ROLL_TYPE');

  static Stream<UserRollTypeRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UserRollTypeRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserRollTypeRecord._();
  factory UserRollTypeRecord(
          [void Function(UserRollTypeRecordBuilder) updates]) =
      _$UserRollTypeRecord;

  static UserRollTypeRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserRollTypeRecordData({
  String id,
  String name,
  int code,
  int createdDate,
  DocumentReference createdBy,
  int updatedDate,
  DocumentReference updatedBy,
}) =>
    serializers.toFirestore(
        UserRollTypeRecord.serializer,
        UserRollTypeRecord((u) => u
          ..id = id
          ..name = name
          ..code = code
          ..createdDate = createdDate
          ..createdBy = createdBy
          ..updatedDate = updatedDate
          ..updatedBy = updatedBy));
