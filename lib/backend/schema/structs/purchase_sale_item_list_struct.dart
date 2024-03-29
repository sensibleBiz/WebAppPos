// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PurchaseSaleItemListStruct extends FFFirebaseStruct {
  PurchaseSaleItemListStruct({
    String? name,
    double? quantity,
    double? price,
    double? total,
    String? id,
    String? catId,
    double? discount,
    double? delliveryChrg,
    int? acceptedQuantity,
    int? rejectedQuantity,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _quantity = quantity,
        _price = price,
        _total = total,
        _id = id,
        _catId = catId,
        _discount = discount,
        _delliveryChrg = delliveryChrg,
        _acceptedQuantity = acceptedQuantity,
        _rejectedQuantity = rejectedQuantity,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "quantity" field.
  double? _quantity;
  double get quantity => _quantity ?? 0.0;
  set quantity(double? val) => _quantity = val;
  void incrementQuantity(double amount) => _quantity = quantity + amount;
  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;
  void incrementPrice(double amount) => _price = price + amount;
  bool hasPrice() => _price != null;

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

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  set discount(double? val) => _discount = val;
  void incrementDiscount(double amount) => _discount = discount + amount;
  bool hasDiscount() => _discount != null;

  // "delliveryChrg" field.
  double? _delliveryChrg;
  double get delliveryChrg => _delliveryChrg ?? 0.0;
  set delliveryChrg(double? val) => _delliveryChrg = val;
  void incrementDelliveryChrg(double amount) =>
      _delliveryChrg = delliveryChrg + amount;
  bool hasDelliveryChrg() => _delliveryChrg != null;

  // "acceptedQuantity" field.
  int? _acceptedQuantity;
  int get acceptedQuantity => _acceptedQuantity ?? 0;
  set acceptedQuantity(int? val) => _acceptedQuantity = val;
  void incrementAcceptedQuantity(int amount) =>
      _acceptedQuantity = acceptedQuantity + amount;
  bool hasAcceptedQuantity() => _acceptedQuantity != null;

  // "rejectedQuantity" field.
  int? _rejectedQuantity;
  int get rejectedQuantity => _rejectedQuantity ?? 0;
  set rejectedQuantity(int? val) => _rejectedQuantity = val;
  void incrementRejectedQuantity(int amount) =>
      _rejectedQuantity = rejectedQuantity + amount;
  bool hasRejectedQuantity() => _rejectedQuantity != null;

  static PurchaseSaleItemListStruct fromMap(Map<String, dynamic> data) =>
      PurchaseSaleItemListStruct(
        name: data['name'] as String?,
        quantity: castToType<double>(data['quantity']),
        price: castToType<double>(data['price']),
        total: castToType<double>(data['total']),
        id: data['id'] as String?,
        catId: data['catId'] as String?,
        discount: castToType<double>(data['discount']),
        delliveryChrg: castToType<double>(data['delliveryChrg']),
        acceptedQuantity: castToType<int>(data['acceptedQuantity']),
        rejectedQuantity: castToType<int>(data['rejectedQuantity']),
      );

  static PurchaseSaleItemListStruct? maybeFromMap(dynamic data) => data is Map
      ? PurchaseSaleItemListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'quantity': _quantity,
        'price': _price,
        'total': _total,
        'id': _id,
        'catId': _catId,
        'discount': _discount,
        'delliveryChrg': _delliveryChrg,
        'acceptedQuantity': _acceptedQuantity,
        'rejectedQuantity': _rejectedQuantity,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'quantity': serializeParam(
          _quantity,
          ParamType.double,
        ),
        'price': serializeParam(
          _price,
          ParamType.double,
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
        'discount': serializeParam(
          _discount,
          ParamType.double,
        ),
        'delliveryChrg': serializeParam(
          _delliveryChrg,
          ParamType.double,
        ),
        'acceptedQuantity': serializeParam(
          _acceptedQuantity,
          ParamType.int,
        ),
        'rejectedQuantity': serializeParam(
          _rejectedQuantity,
          ParamType.int,
        ),
      }.withoutNulls;

  static PurchaseSaleItemListStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      PurchaseSaleItemListStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        quantity: deserializeParam(
          data['quantity'],
          ParamType.double,
          false,
        ),
        price: deserializeParam(
          data['price'],
          ParamType.double,
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
        discount: deserializeParam(
          data['discount'],
          ParamType.double,
          false,
        ),
        delliveryChrg: deserializeParam(
          data['delliveryChrg'],
          ParamType.double,
          false,
        ),
        acceptedQuantity: deserializeParam(
          data['acceptedQuantity'],
          ParamType.int,
          false,
        ),
        rejectedQuantity: deserializeParam(
          data['rejectedQuantity'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PurchaseSaleItemListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PurchaseSaleItemListStruct &&
        name == other.name &&
        quantity == other.quantity &&
        price == other.price &&
        total == other.total &&
        id == other.id &&
        catId == other.catId &&
        discount == other.discount &&
        delliveryChrg == other.delliveryChrg &&
        acceptedQuantity == other.acceptedQuantity &&
        rejectedQuantity == other.rejectedQuantity;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        quantity,
        price,
        total,
        id,
        catId,
        discount,
        delliveryChrg,
        acceptedQuantity,
        rejectedQuantity
      ]);
}

PurchaseSaleItemListStruct createPurchaseSaleItemListStruct({
  String? name,
  double? quantity,
  double? price,
  double? total,
  String? id,
  String? catId,
  double? discount,
  double? delliveryChrg,
  int? acceptedQuantity,
  int? rejectedQuantity,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PurchaseSaleItemListStruct(
      name: name,
      quantity: quantity,
      price: price,
      total: total,
      id: id,
      catId: catId,
      discount: discount,
      delliveryChrg: delliveryChrg,
      acceptedQuantity: acceptedQuantity,
      rejectedQuantity: rejectedQuantity,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PurchaseSaleItemListStruct? updatePurchaseSaleItemListStruct(
  PurchaseSaleItemListStruct? purchaseSaleItemList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    purchaseSaleItemList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPurchaseSaleItemListStructData(
  Map<String, dynamic> firestoreData,
  PurchaseSaleItemListStruct? purchaseSaleItemList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (purchaseSaleItemList == null) {
    return;
  }
  if (purchaseSaleItemList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && purchaseSaleItemList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final purchaseSaleItemListData =
      getPurchaseSaleItemListFirestoreData(purchaseSaleItemList, forFieldValue);
  final nestedData =
      purchaseSaleItemListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      purchaseSaleItemList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPurchaseSaleItemListFirestoreData(
  PurchaseSaleItemListStruct? purchaseSaleItemList, [
  bool forFieldValue = false,
]) {
  if (purchaseSaleItemList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(purchaseSaleItemList.toMap());

  // Add any Firestore field values
  purchaseSaleItemList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPurchaseSaleItemListListFirestoreData(
  List<PurchaseSaleItemListStruct>? purchaseSaleItemLists,
) =>
    purchaseSaleItemLists
        ?.map((e) => getPurchaseSaleItemListFirestoreData(e, true))
        .toList() ??
    [];
