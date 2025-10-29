// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoryDataTypeStruct extends FFFirebaseStruct {
  CategoryDataTypeStruct({
    String? id,
    bool? isDeleted,
    String? name,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _id = id,
        _isDeleted = isDeleted,
        _name = name,
        super(firestoreUtilData);

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

  static CategoryDataTypeStruct fromMap(Map<String, dynamic> data) =>
      CategoryDataTypeStruct(
        id: data['id'] as String?,
        isDeleted: data['isDeleted'] as bool?,
        name: data['name'] as String?,
      );

  static CategoryDataTypeStruct? maybeFromMap(dynamic data) => data is Map
      ? CategoryDataTypeStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'id': _id,
        'isDeleted': _isDeleted,
        'name': _name,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
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

  static CategoryDataTypeStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CategoryDataTypeStruct(
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
  String toString() => 'CategoryDataTypeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CategoryDataTypeStruct &&
        id == other.id &&
        isDeleted == other.isDeleted &&
        name == other.name;
  }

  @override
  int get hashCode => const ListEquality().hash([id, isDeleted, name]);
}

CategoryDataTypeStruct createCategoryDataTypeStruct({
  String? id,
  bool? isDeleted,
  String? name,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CategoryDataTypeStruct(
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

CategoryDataTypeStruct? updateCategoryDataTypeStruct(
  CategoryDataTypeStruct? categoryDataType, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    categoryDataType
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCategoryDataTypeStructData(
  Map<String, dynamic> firestoreData,
  CategoryDataTypeStruct? categoryDataType,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (categoryDataType == null) {
    return;
  }
  if (categoryDataType.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && categoryDataType.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final categoryDataTypeData =
      getCategoryDataTypeFirestoreData(categoryDataType, forFieldValue);
  final nestedData =
      categoryDataTypeData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = categoryDataType.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCategoryDataTypeFirestoreData(
  CategoryDataTypeStruct? categoryDataType, [
  bool forFieldValue = false,
]) {
  if (categoryDataType == null) {
    return {};
  }
  final firestoreData = mapToFirestore(categoryDataType.toMap());

  // Add any Firestore field values
  categoryDataType.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCategoryDataTypeListFirestoreData(
  List<CategoryDataTypeStruct>? categoryDataTypes,
) =>
    categoryDataTypes
        ?.map((e) => getCategoryDataTypeFirestoreData(e, true))
        .toList() ??
    [];
