// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LocationDetailsStruct extends FFFirebaseStruct {
  LocationDetailsStruct({
    String? name,
    String? street,
    String? locality,
    String? subLocality,
    String? postalCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _street = street,
        _locality = locality,
        _subLocality = subLocality,
        _postalCode = postalCode,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "street" field.
  String? _street;
  String get street => _street ?? '';
  set street(String? val) => _street = val;

  bool hasStreet() => _street != null;

  // "locality" field.
  String? _locality;
  String get locality => _locality ?? '';
  set locality(String? val) => _locality = val;

  bool hasLocality() => _locality != null;

  // "subLocality" field.
  String? _subLocality;
  String get subLocality => _subLocality ?? '';
  set subLocality(String? val) => _subLocality = val;

  bool hasSubLocality() => _subLocality != null;

  // "postalCode" field.
  String? _postalCode;
  String get postalCode => _postalCode ?? '';
  set postalCode(String? val) => _postalCode = val;

  bool hasPostalCode() => _postalCode != null;

  static LocationDetailsStruct fromMap(Map<String, dynamic> data) =>
      LocationDetailsStruct(
        name: data['name'] as String?,
        street: data['street'] as String?,
        locality: data['locality'] as String?,
        subLocality: data['subLocality'] as String?,
        postalCode: data['postalCode'] as String?,
      );

  static LocationDetailsStruct? maybeFromMap(dynamic data) => data is Map
      ? LocationDetailsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'street': _street,
        'locality': _locality,
        'subLocality': _subLocality,
        'postalCode': _postalCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'street': serializeParam(
          _street,
          ParamType.String,
        ),
        'locality': serializeParam(
          _locality,
          ParamType.String,
        ),
        'subLocality': serializeParam(
          _subLocality,
          ParamType.String,
        ),
        'postalCode': serializeParam(
          _postalCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static LocationDetailsStruct fromSerializableMap(Map<String, dynamic> data) =>
      LocationDetailsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        street: deserializeParam(
          data['street'],
          ParamType.String,
          false,
        ),
        locality: deserializeParam(
          data['locality'],
          ParamType.String,
          false,
        ),
        subLocality: deserializeParam(
          data['subLocality'],
          ParamType.String,
          false,
        ),
        postalCode: deserializeParam(
          data['postalCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LocationDetailsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LocationDetailsStruct &&
        name == other.name &&
        street == other.street &&
        locality == other.locality &&
        subLocality == other.subLocality &&
        postalCode == other.postalCode;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, street, locality, subLocality, postalCode]);
}

LocationDetailsStruct createLocationDetailsStruct({
  String? name,
  String? street,
  String? locality,
  String? subLocality,
  String? postalCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LocationDetailsStruct(
      name: name,
      street: street,
      locality: locality,
      subLocality: subLocality,
      postalCode: postalCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LocationDetailsStruct? updateLocationDetailsStruct(
  LocationDetailsStruct? locationDetails, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    locationDetails
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLocationDetailsStructData(
  Map<String, dynamic> firestoreData,
  LocationDetailsStruct? locationDetails,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (locationDetails == null) {
    return;
  }
  if (locationDetails.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && locationDetails.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final locationDetailsData =
      getLocationDetailsFirestoreData(locationDetails, forFieldValue);
  final nestedData =
      locationDetailsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = locationDetails.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLocationDetailsFirestoreData(
  LocationDetailsStruct? locationDetails, [
  bool forFieldValue = false,
]) {
  if (locationDetails == null) {
    return {};
  }
  final firestoreData = mapToFirestore(locationDetails.toMap());

  // Add any Firestore field values
  locationDetails.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLocationDetailsListFirestoreData(
  List<LocationDetailsStruct>? locationDetailss,
) =>
    locationDetailss
        ?.map((e) => getLocationDetailsFirestoreData(e, true))
        .toList() ??
    [];
