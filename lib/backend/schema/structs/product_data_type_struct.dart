// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProductDataTypeStruct extends FFFirebaseStruct {
  ProductDataTypeStruct({
    String? category,
    String? id,
    bool? isDeleted,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _category = category,
        _id = id,
        _isDeleted = isDeleted,
        _name = name,
        super(firestoreUtilData);

  // "category" field.
  String? _category;
  String get category => _category ?? '';
  set category(String? val) => _category = val;

  bool hasCategory() => _category != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "isDeleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  set isDeleted(bool? val) => _isDeleted = val;

  bool hasIsDeleted() => _isDeleted != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  static ProductDataTypeStruct fromMap(Map<String, dynamic> data) =>
      ProductDataTypeStruct(
        category: data['category'] as String?,
        id: data['id'] as String?,
        isDeleted: data['isDeleted'] as bool?,
        name: data['name'] as String?,
      );

  static ProductDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? ProductDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'category': _category,
        'id': _id,
        'isDeleted': _isDeleted,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'category': serializeParam(
          _category,
          ParamType.String,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'isDeleted': serializeParam(
          _isDeleted,
          ParamType.bool,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProductDataTypeStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProductDataTypeStruct(
        category: deserializeParam(
          data['category'],
          ParamType.String,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        isDeleted: deserializeParam(
          data['isDeleted'],
          ParamType.bool,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProductDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProductDataTypeStruct &&
        category == other.category &&
        id == other.id &&
        isDeleted == other.isDeleted &&
        name == other.name;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([category, id, isDeleted, name]);
}

ProductDataTypeStruct createProductDataTypeStruct({
  String? category,
  String? id,
  bool? isDeleted,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProductDataTypeStruct(
      category: category,
      id: id,
      isDeleted: isDeleted,
      name: name,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProductDataTypeStruct? updateProductDataTypeStruct(
  ProductDataTypeStruct? productDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    productDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProductDataTypeStructData(
  Map<String, dynamic> firestoreData,
  ProductDataTypeStruct? productDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (productDataType == null) {
    return;
  }
  if (productDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && productDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final productDataTypeData =
      getProductDataTypeFirestoreData(productDataType, forFieldValue);
  final nestedData =
      productDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = productDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProductDataTypeFirestoreData(
  ProductDataTypeStruct? productDataType, [
  bool forFieldValue = false,
]) {
  if (productDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(productDataType.toMap());

  // Add any Firestore field values
  productDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProductDataTypeListFirestoreData(
  List<ProductDataTypeStruct>? productDataTypes,
) =>
    productDataTypes
        ?.map((e) => getProductDataTypeFirestoreData(e, true))
        .toList() ??
    [];
