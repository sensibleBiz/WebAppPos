import 'dart:async';

import 'index.dart';
import 'serializers.dart';
import 'package:built_value/built_value.dart';

part 'device_record.g.dart';

abstract class DeviceRecord
    implements Built<DeviceRecord, DeviceRecordBuilder> {
  static Serializer<DeviceRecord> get serializer => _$deviceRecordSerializer;

  @nullable
  String get id;

  @nullable
  String get deviceId;

  @nullable
  bool get active;

  @nullable
  String get board;

  @nullable
  String get brand;

  @nullable
  bool get connectedToNetwork;

  @nullable
  int get createdDate;

  @nullable
  LatLng get address;

  @nullable
  String get manufacture;

  @nullable
  String get model;

  @nullable
  String get serial;

  @nullable
  String get posModel;

  @nullable
  String get posSerial;

  @nullable
  DocumentReference get userRef;

  @nullable
  DocumentReference get outletRef;

  @nullable
  String get versionCode;

  @nullable
  String get versionName;

  @nullable
  DocumentReference get createdBy;

  @nullable
  @BuiltValueField(wireName: kDocumentReferenceField)
  DocumentReference get reference;

  static void _initializeBuilder(DeviceRecordBuilder builder) => builder
    ..id = ''
    ..deviceId = ''
    ..active = false
    ..board = ''
    ..brand = ''
    ..connectedToNetwork = false
    ..createdDate = 0
    ..manufacture = ''
    ..model = ''
    ..serial = ''
    ..posModel = ''
    ..posSerial = ''
    ..versionCode = ''
    ..versionName = '';

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('DEVICE');

  static Stream<DeviceRecord> getDocument(DocumentReference ref) => ref
      .snapshots()
      .map((s) => serializers.deserializeWith(serializer, serializedData(s)));

  static Future<DeviceRecord> getDocumentOnce(DocumentReference ref) => ref
      .get()
      .then((s) => serializers.deserializeWith(serializer, serializedData(s)));

  DeviceRecord._();
  factory DeviceRecord([void Function(DeviceRecordBuilder) updates]) =
      _$DeviceRecord;

  static DeviceRecord getDocumentFromData(
          Map<String, dynamic> data, DocumentReference reference) =>
      serializers.deserializeWith(serializer,
          {...mapFromFirestore(data), kDocumentReferenceField: reference});
}

Map<String, dynamic> createDeviceRecordData({
  String id,
  String deviceId,
  bool active,
  String board,
  String brand,
  bool connectedToNetwork,
  int createdDate,
  LatLng address,
  String manufacture,
  String model,
  String serial,
  String posModel,
  String posSerial,
  DocumentReference userRef,
  DocumentReference outletRef,
  String versionCode,
  String versionName,
  DocumentReference createdBy,
}) =>
    serializers.toFirestore(
        DeviceRecord.serializer,
        DeviceRecord((d) => d
          ..id = id
          ..deviceId = deviceId
          ..active = active
          ..board = board
          ..brand = brand
          ..connectedToNetwork = connectedToNetwork
          ..createdDate = createdDate
          ..address = address
          ..manufacture = manufacture
          ..model = model
          ..serial = serial
          ..posModel = posModel
          ..posSerial = posSerial
          ..userRef = userRef
          ..outletRef = outletRef
          ..versionCode = versionCode
          ..versionName = versionName
          ..createdBy = createdBy));
