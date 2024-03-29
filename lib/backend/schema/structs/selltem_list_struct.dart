// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SelltemListStruct extends FFFirebaseStruct {
  SelltemListStruct({
    String? name,
    double? price,
    double? quantity,
    double? tax,
    int? code,
    double? total,
    String? id,
    String? catId,
    bool? isDeletedItem,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _price = price,
        _quantity = quantity,
        _tax = tax,
        _code = code,
        _total = total,
        _id = id,
        _catId = catId,
        _isDeletedItem = isDeletedItem,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;
  void incrementQuantity(double amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  set tax(double? val) => _tax = val;
  void incrementTax(double amount) => _tax = tax + amount;
  bool hasTax() => _tax != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;
  void incrementCode(int amount) => _code = code + amount;
  bool hasCode() => _code != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;
  void incrementTotal(double amount) => _total = total + amount;
  bool hasTotal() => _total != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;
  bool hasId() => _id != null;

  // "catId" field.
  String? _catId;
  String get catId => _catId ?? '';
  set catId(String? val) => _catId = val;
  bool hasCatId() => _catId != null;

  // "isDeletedItem" field.
  bool? _isDeletedItem;
  bool get isDeletedItem => _isDeletedItem ?? false;
  set isDeletedItem(bool? val) => _isDeletedItem = val;
  bool hasIsDeletedItem() => _isDeletedItem != null;

  static SelltemListStruct fromMap(Map<String, dynamic> data) =>
      SelltemListStruct(
        name: data['name'] as String?,
        price: castToType<double>(data['price']),
        quantity: castToType<double>(data['quantity']),
        tax: castToType<double>(data['tax']),
        code: castToType<int>(data['code']),
        total: castToType<double>(data['total']),
        id: data['id'] as String?,
        catId: data['catId'] as String?,
        isDeletedItem: data['isDeletedItem'] as bool?,
      );

  static SelltemListStruct? maybeFromMap(dynamic data) => data is Map
      ? SelltemListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'price': _price,
        'quantity': _quantity,
        'tax': _tax,
        'code': _code,
        'total': _total,
        'id': _id,
        'catId': _catId,
        'isDeletedItem': _isDeletedItem,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'tax': serializeParam(
          _tax,
          ParamType.double,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'total': serializeParam(
          _total,
          ParamType.double,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'catId': serializeParam(
          _catId,
          ParamType.String,
        ),
        'isDeletedItem': serializeParam(
          _isDeletedItem,
          ParamType.bool,
        ),
      }.withoutNulls;

  static SelltemListStruct fromSerializableMap(Map<String, dynamic> data) =>
      SelltemListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
          false,
        ),
        tax: deserializeParam(
          data['tax'],
          ParamType.double,
          false,
        ),
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.double,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        catId: deserializeParam(
          data['catId'],
          ParamType.String,
          false,
        ),
        isDeletedItem: deserializeParam(
          data['isDeletedItem'],
          ParamType.bool,
          false,
        ),
      );

  @override
  String toString() => 'SelltemListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SelltemListStruct &&
        name == other.name &&
        price == other.price &&
        quantity == other.quantity &&
        tax == other.tax &&
        code == other.code &&
        total == other.total &&
        id == other.id &&
        catId == other.catId &&
        isDeletedItem == other.isDeletedItem;
  }

  @override
  int get hashCode => const ListEquality().hash(
      [name, price, quantity, tax, code, total, id, catId, isDeletedItem]);
}

SelltemListStruct createSelltemListStruct({
  String? name,
  double? price,
  double? quantity,
  double? tax,
  int? code,
  double? total,
  String? id,
  String? catId,
  bool? isDeletedItem,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SelltemListStruct(
      name: name,
      price: price,
      quantity: quantity,
      tax: tax,
      code: code,
      total: total,
      id: id,
      catId: catId,
      isDeletedItem: isDeletedItem,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SelltemListStruct? updateSelltemListStruct(
  SelltemListStruct? selltemList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    selltemList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSelltemListStructData(
  Map<String, dynamic> firestoreData,
  SelltemListStruct? selltemList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (selltemList == null) {
    return;
  }
  if (selltemList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && selltemList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final selltemListData =
      getSelltemListFirestoreData(selltemList, forFieldValue);
  final nestedData =
      selltemListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = selltemList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSelltemListFirestoreData(
  SelltemListStruct? selltemList, [
  bool forFieldValue = false,
]) {
  if (selltemList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(selltemList.toMap());

  // Add any Firestore field values
  selltemList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSelltemListListFirestoreData(
  List<SelltemListStruct>? selltemLists,
) =>
    selltemLists?.map((e) => getSelltemListFirestoreData(e, true)).toList() ??
    [];
