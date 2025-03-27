// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustomFieldsStruct extends FFFirebaseStruct {
  CustomFieldsStruct({
    String? capacity,
    String? productType,
    String? purchasedFrom,
    int? serial,
    String? remark,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _capacity = capacity,
        _productType = productType,
        _purchasedFrom = purchasedFrom,
        _serial = serial,
        _remark = remark,
        super(firestoreUtilData);

  // "capacity" field.
  String? _capacity;
  String get capacity => _capacity ?? '';
  set capacity(String? val) => _capacity = val;

  bool hasCapacity() => _capacity != null;

  // "productType" field.
  String? _productType;
  String get productType => _productType ?? '';
  set productType(String? val) => _productType = val;

  bool hasProductType() => _productType != null;

  // "purchasedFrom" field.
  String? _purchasedFrom;
  String get purchasedFrom => _purchasedFrom ?? '';
  set purchasedFrom(String? val) => _purchasedFrom = val;

  bool hasPurchasedFrom() => _purchasedFrom != null;

  // "serial" field.
  int? _serial;
  int get serial => _serial ?? 0;
  set serial(int? val) => _serial = val;

  void incrementSerial(int amount) => serial = serial + amount;

  bool hasSerial() => _serial != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  set remark(String? val) => _remark = val;

  bool hasRemark() => _remark != null;

  static CustomFieldsStruct fromMap(Map<String, dynamic> data) =>
      CustomFieldsStruct(
        capacity: data['capacity'] as String?,
        productType: data['productType'] as String?,
        purchasedFrom: data['purchasedFrom'] as String?,
        serial: castToType<int>(data['serial']),
        remark: data['remark'] as String?,
      );

  static CustomFieldsStruct? maybeFromMap(dynamic data) => data is Map
      ? CustomFieldsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'capacity': _capacity,
        'productType': _productType,
        'purchasedFrom': _purchasedFrom,
        'serial': _serial,
        'remark': _remark,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'capacity': serializeParam(
          _capacity,
          ParamType.String,
        ),
        'productType': serializeParam(
          _productType,
          ParamType.String,
        ),
        'purchasedFrom': serializeParam(
          _purchasedFrom,
          ParamType.String,
        ),
        'serial': serializeParam(
          _serial,
          ParamType.int,
        ),
        'remark': serializeParam(
          _remark,
          ParamType.String,
        ),
      }.withoutNulls;

  static CustomFieldsStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustomFieldsStruct(
        capacity: deserializeParam(
          data['capacity'],
          ParamType.String,
          false,
        ),
        productType: deserializeParam(
          data['productType'],
          ParamType.String,
          false,
        ),
        purchasedFrom: deserializeParam(
          data['purchasedFrom'],
          ParamType.String,
          false,
        ),
        serial: deserializeParam(
          data['serial'],
          ParamType.int,
          false,
        ),
        remark: deserializeParam(
          data['remark'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CustomFieldsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustomFieldsStruct &&
        capacity == other.capacity &&
        productType == other.productType &&
        purchasedFrom == other.purchasedFrom &&
        serial == other.serial &&
        remark == other.remark;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([capacity, productType, purchasedFrom, serial, remark]);
}

CustomFieldsStruct createCustomFieldsStruct({
  String? capacity,
  String? productType,
  String? purchasedFrom,
  int? serial,
  String? remark,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustomFieldsStruct(
      capacity: capacity,
      productType: productType,
      purchasedFrom: purchasedFrom,
      serial: serial,
      remark: remark,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustomFieldsStruct? updateCustomFieldsStruct(
  CustomFieldsStruct? customFields, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    customFields
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustomFieldsStructData(
  Map<String, dynamic> firestoreData,
  CustomFieldsStruct? customFields,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (customFields == null) {
    return;
  }
  if (customFields.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && customFields.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final customFieldsData =
      getCustomFieldsFirestoreData(customFields, forFieldValue);
  final nestedData =
      customFieldsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = customFields.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustomFieldsFirestoreData(
  CustomFieldsStruct? customFields, [
  bool forFieldValue = false,
]) {
  if (customFields == null) {
    return {};
  }
  final firestoreData = mapToFirestore(customFields.toMap());

  // Add any Firestore field values
  customFields.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustomFieldsListFirestoreData(
  List<CustomFieldsStruct>? customFieldss,
) =>
    customFieldss?.map((e) => getCustomFieldsFirestoreData(e, true)).toList() ??
    [];
