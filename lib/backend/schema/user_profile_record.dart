import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'user_profile_record.g.dart';

abstract class UserProfileRecord
    implements Built<UserProfileRecord, UserProfileRecordBuilder> {
  static Serializer<UserProfileRecord> get serializer =>
      _$userProfileRecordSerializer;

  @nullable
  String get id;

  @nullable
  bool get active;

  @nullable
  String get role;

  @nullable
  LatLng get address;

  @nullable
  String get city;

  @nullable
  String get state;

  @nullable
  int get pincode;

  @nullable
  String get email;

  @nullable
  DocumentReference get businessType;

  @nullable
  bool get accessToMulticounter;

  @nullable
  int get createdDate;

  @nullable
  String get outletId;

  @nullable
  BuiltList<String> get outlets;

  @nullable
  int get quickPin;

  @nullable
  int get renewalDate;

  @nullable
  String get userAccess;

  @nullable
  String get userSettings;

  @nullable
  @BuiltValueField(wireName: 'photo_url')
  String get photoUrl;

  @nullable
  String get uid;

  @nullable
  @BuiltValueField(wireName: 'created_time')
  DateTime get createdTime;

  @nullable
  @BuiltValueField(wireName: 'phone_number')
  String get phoneNumber;

  @nullable
  @BuiltValueField(wireName: 'display_name')
  String get displayName;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(UserProfileRecordBuilder builder) => builder
    ..id = ''
    ..active = false
    ..role = ''
    ..city = ''
    ..state = ''
    ..pincode = 0
    ..email = ''
    ..accessToMulticounter = false
    ..createdDate = 0
    ..outletId = ''
    ..outlets = ListBuilder()
    ..quickPin = 0
    ..renewalDate = 0
    ..userAccess = ''
    ..userSettings = ''
    ..photoUrl = ''
    ..uid = ''
    ..phoneNumber = ''
    ..displayName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('USER_PROFILE');

  static Stream<UserProfileRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<UserProfileRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  UserProfileRecord._();
  factory UserProfileRecord([void Function(UserProfileRecordBuilder) updates]) =
      _$UserProfileRecord;

  static UserProfileRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createUserProfileRecordData({
  String id,
  bool active,
  String role,
  LatLng address,
  String city,
  String state,
  int pincode,
  String email,
  DocumentReference businessType,
  bool accessToMulticounter,
  int createdDate,
  String outletId,
  int quickPin,
  int renewalDate,
  String userAccess,
  String userSettings,
  String photoUrl,
  String uid,
  DateTime createdTime,
  String phoneNumber,
  String displayName,
}) =>
    serializers.toFirestore(
        UserProfileRecord.serializer,
        UserProfileRecord((u) => u
          ..id = id
          ..active = active
          ..role = role
          ..address = address
          ..city = city
          ..state = state
          ..pincode = pincode
          ..email = email
          ..businessType = businessType
          ..accessToMulticounter = accessToMulticounter
          ..createdDate = createdDate
          ..outletId = outletId
          ..outlets = null
          ..quickPin = quickPin
          ..renewalDate = renewalDate
          ..userAccess = userAccess
          ..userSettings = userSettings
          ..photoUrl = photoUrl
          ..uid = uid
          ..createdTime = createdTime
          ..phoneNumber = phoneNumber
          ..displayName = displayName));
