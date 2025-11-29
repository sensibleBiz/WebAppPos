// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppPermissionsDatatypeStruct extends FFFirebaseStruct {
  AppPermissionsDatatypeStruct({
    bool? camera,
    bool? location,
    bool? locationAlways,
    bool? locationWhenInUse,
    bool? microphone,
    bool? notification,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _camera = camera,
        _location = location,
        _locationAlways = locationAlways,
        _locationWhenInUse = locationWhenInUse,
        _microphone = microphone,
        _notification = notification,
        super(firestoreUtilData);

  // "camera" field.
  bool? _camera;
  bool get camera => _camera ?? false;
  set camera(bool? val) => _camera = val;

  bool hasCamera() => _camera != null;

  // "location" field.
  bool? _location;
  bool get location => _location ?? false;
  set location(bool? val) => _location = val;

  bool hasLocation() => _location != null;

  // "locationAlways" field.
  bool? _locationAlways;
  bool get locationAlways => _locationAlways ?? false;
  set locationAlways(bool? val) => _locationAlways = val;

  bool hasLocationAlways() => _locationAlways != null;

  // "locationWhenInUse" field.
  bool? _locationWhenInUse;
  bool get locationWhenInUse => _locationWhenInUse ?? false;
  set locationWhenInUse(bool? val) => _locationWhenInUse = val;

  bool hasLocationWhenInUse() => _locationWhenInUse != null;

  // "microphone" field.
  bool? _microphone;
  bool get microphone => _microphone ?? false;
  set microphone(bool? val) => _microphone = val;

  bool hasMicrophone() => _microphone != null;

  // "notification" field.
  bool? _notification;
  bool get notification => _notification ?? false;
  set notification(bool? val) => _notification = val;

  bool hasNotification() => _notification != null;

  static AppPermissionsDatatypeStruct fromMap(Map<String, dynamic> data) =>
      AppPermissionsDatatypeStruct(
        camera: data['camera'] as bool?,
        location: data['location'] as bool?,
        locationAlways: data['locationAlways'] as bool?,
        locationWhenInUse: data['locationWhenInUse'] as bool?,
        microphone: data['microphone'] as bool?,
        notification: data['notification'] as bool?,
      );

  static AppPermissionsDatatypeStruct? maybeFromMap(dynamic data) => data is Map
      ? AppPermissionsDatatypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'camera': _camera,
        'location': _location,
        'locationAlways': _locationAlways,
        'locationWhenInUse': _locationWhenInUse,
        'microphone': _microphone,
        'notification': _notification,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'camera': serializeParam(
          _camera,
          ParamType.bool,
        ),
        'location': serializeParam(
          _location,
          ParamType.bool,
        ),
        'locationAlways': serializeParam(
          _locationAlways,
          ParamType.bool,
        ),
        'locationWhenInUse': serializeParam(
          _locationWhenInUse,
          ParamType.bool,
        ),
        'microphone': serializeParam(
          _microphone,
          ParamType.bool,
        ),
        'notification': serializeParam(
          _notification,
          ParamType.bool,
        ),
      }.withoutNulls;

  static AppPermissionsDatatypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      AppPermissionsDatatypeStruct(
        camera: deserializeParam(
          data['camera'],
          ParamType.bool,
          false,
        ),
        location: deserializeParam(
          data['location'],
          ParamType.bool,
          false,
        ),
        locationAlways: deserializeParam(
          data['locationAlways'],
          ParamType.bool,
          false,
        ),
        locationWhenInUse: deserializeParam(
          data['locationWhenInUse'],
          ParamType.bool,
          false,
        ),
        microphone: deserializeParam(
          data['microphone'],
          ParamType.bool,
          false,
        ),
        notification: deserializeParam(
          data['notification'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'AppPermissionsDatatypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AppPermissionsDatatypeStruct &&
        camera == other.camera &&
        location == other.location &&
        locationAlways == other.locationAlways &&
        locationWhenInUse == other.locationWhenInUse &&
        microphone == other.microphone &&
        notification == other.notification;
  }

  @override
  int get hashCode => const ListEquality().hash([
        camera,
        location,
        locationAlways,
        locationWhenInUse,
        microphone,
        notification
      ]);
}

AppPermissionsDatatypeStruct createAppPermissionsDatatypeStruct({
  bool? camera,
  bool? location,
  bool? locationAlways,
  bool? locationWhenInUse,
  bool? microphone,
  bool? notification,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AppPermissionsDatatypeStruct(
      camera: camera,
      location: location,
      locationAlways: locationAlways,
      locationWhenInUse: locationWhenInUse,
      microphone: microphone,
      notification: notification,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AppPermissionsDatatypeStruct? updateAppPermissionsDatatypeStruct(
  AppPermissionsDatatypeStruct? appPermissionsDatatype, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    appPermissionsDatatype
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAppPermissionsDatatypeStructData(
  Map<String, dynamic> firestoreData,
  AppPermissionsDatatypeStruct? appPermissionsDatatype,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (appPermissionsDatatype == null) {
    return;
  }
  if (appPermissionsDatatype.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      appPermissionsDatatype.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final appPermissionsDatatypeData = getAppPermissionsDatatypeFirestoreData(
      appPermissionsDatatype, forFieldValue);
  final nestedData =
      appPermissionsDatatypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      appPermissionsDatatype.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAppPermissionsDatatypeFirestoreData(
  AppPermissionsDatatypeStruct? appPermissionsDatatype, [
  bool forFieldValue = false,
]) {
  if (appPermissionsDatatype == null) {
    return {};
  }
  final firestoreData = mapToFirestore(appPermissionsDatatype.toMap());

  // Add any Firestore field values
  appPermissionsDatatype.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAppPermissionsDatatypeListFirestoreData(
  List<AppPermissionsDatatypeStruct>? appPermissionsDatatypes,
) =>
    appPermissionsDatatypes
        ?.map((e) => getAppPermissionsDatatypeFirestoreData(e, true))
        .toList() ??
    [];
