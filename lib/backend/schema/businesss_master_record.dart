import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'businesss_master_record.g.dart';

abstract class BusinesssMasterRecord
    implements Built<BusinesssMasterRecord, BusinesssMasterRecordBuilder> {
  static Serializer<BusinesssMasterRecord> get serializer =>
      _$businesssMasterRecordSerializer;

  @nullable
  String get id;

  @nullable
  DocumentReference get businessType;

  @nullable
  String get name;

  @nullable
  String get mobile;

  @nullable
  String get email;

  @nullable
  int get phone;

  @nullable
  LatLng get address;

  @nullable
  String get city;

  @nullable
  String get state;

  @nullable
  int get pincode;

  @nullable
  bool get active;

  @nullable
  int get createdDate;

  @nullable
  int get code;

  @nullable
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(BusinesssMasterRecordBuilder builder) =>
      builder
        ..id = ''
        ..name = ''
        ..mobile = ''
        ..email = ''
        ..phone = 0
        ..city = ''
        ..state = ''
        ..pincode = 0
        ..active = false
        ..createdDate = 0
        ..code = 0;

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('BUSINESSS_MASTER');

  static Stream<BusinesssMasterRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<BusinesssMasterRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then(
          (s) => serializers.deserializeWith(serializer, serializedData(s)));

  BusinesssMasterRecord._();
  factory BusinesssMasterRecord(
          [void Function(BusinesssMasterRecordBuilder) updates]) =
      _$BusinesssMasterRecord;

  static BusinesssMasterRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createBusinesssMasterRecordData({
  String id,
  DocumentReference businessType,
  String name,
  String mobile,
  String email,
  int phone,
  LatLng address,
  String city,
  String state,
  int pincode,
  bool active,
  int createdDate,
  int code,
  DocumentReference createdBy,
}) =>
    serializers.toFirestore(
        BusinesssMasterRecord.serializer,
        BusinesssMasterRecord((b) => b
          ..id = id
          ..businessType = businessType
          ..name = name
          ..mobile = mobile
          ..email = email
          ..phone = phone
          ..address = address
          ..city = city
          ..state = state
          ..pincode = pincode
          ..active = active
          ..createdDate = createdDate
          ..code = code
          ..createdBy = createdBy));
