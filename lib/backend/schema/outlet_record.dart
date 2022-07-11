import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'outlet_record.g.dart';

abstract class OutletRecord
    implements Built<OutletRecord, OutletRecordBuilder> {
  static Serializer<OutletRecord> get serializer => _$outletRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get name;

  @nullable
  DocumentReference get businessMatser;

  @nullable
  DocumentReference get businessType;

  @nullable
  String get branch;

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
  int get renewalDate;

  @nullable
  int get createdDate;

  @nullable
  String get fssaiLicenceNo;

  @nullable
  DocumentReference get userRef;

  @nullable
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(OutletRecordBuilder builder) => builder
    ..id = ''
    ..name = ''
    ..branch = ''
    ..city = ''
    ..state = ''
    ..pincode = 0
    ..active = false
    ..renewalDate = 0
    ..createdDate = 0
    ..fssaiLicenceNo = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('OUTLET');

  static Stream<OutletRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<OutletRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  OutletRecord._();
  factory OutletRecord([void Function(OutletRecordBuilder) updates]) =
      _$OutletRecord;

  static OutletRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createOutletRecordData({
  String id,
  String name,
  DocumentReference businessMatser,
  DocumentReference businessType,
  String branch,
  LatLng address,
  String city,
  String state,
  int pincode,
  bool active,
  int renewalDate,
  int createdDate,
  String fssaiLicenceNo,
  DocumentReference userRef,
  DocumentReference createdBy,
}) =>
    serializers.toFirestore(
        OutletRecord.serializer,
        OutletRecord((o) => o
          ..id = id
          ..name = name
          ..businessMatser = businessMatser
          ..businessType = businessType
          ..branch = branch
          ..address = address
          ..city = city
          ..state = state
          ..pincode = pincode
          ..active = active
          ..renewalDate = renewalDate
          ..createdDate = createdDate
          ..fssaiLicenceNo = fssaiLicenceNo
          ..userRef = userRef
          ..createdBy = createdBy));
