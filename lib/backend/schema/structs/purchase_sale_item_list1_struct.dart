// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PurchaseSaleItemList1Struct extends FFFirebaseStruct {
  PurchaseSaleItemList1Struct({
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
    String? gstPer,
    double? gstAmt,
    double? mrpPrice,
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
        _gstPer = gstPer,
        _gstAmt = gstAmt,
        _mrpPrice = mrpPrice,
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

  void incrementQuantity(double amount) => quantity = quantity + amount;

  bool hasQuantity() => _quantity != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  set price(double? val) => _price = val;

  void incrementPrice(double amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "total" field.
  double? _total;
  double get total => _total ?? 0.0;
  set total(double? val) => _total = val;

  void incrementTotal(double amount) => total = total + amount;

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

  void incrementDiscount(double amount) => discount = discount + amount;

  bool hasDiscount() => _discount != null;

  // "delliveryChrg" field.
  double? _delliveryChrg;
  double get delliveryChrg => _delliveryChrg ?? 0.0;
  set delliveryChrg(double? val) => _delliveryChrg = val;

  void incrementDelliveryChrg(double amount) =>
      delliveryChrg = delliveryChrg + amount;

  bool hasDelliveryChrg() => _delliveryChrg != null;

  // "acceptedQuantity" field.
  int? _acceptedQuantity;
  int get acceptedQuantity => _acceptedQuantity ?? 0;
  set acceptedQuantity(int? val) => _acceptedQuantity = val;

  void incrementAcceptedQuantity(int amount) =>
      acceptedQuantity = acceptedQuantity + amount;

  bool hasAcceptedQuantity() => _acceptedQuantity != null;

  // "rejectedQuantity" field.
  int? _rejectedQuantity;
  int get rejectedQuantity => _rejectedQuantity ?? 0;
  set rejectedQuantity(int? val) => _rejectedQuantity = val;

  void incrementRejectedQuantity(int amount) =>
      rejectedQuantity = rejectedQuantity + amount;

  bool hasRejectedQuantity() => _rejectedQuantity != null;

  // "gstPer" field.
  String? _gstPer;
  String get gstPer => _gstPer ?? '';
  set gstPer(String? val) => _gstPer = val;

  bool hasGstPer() => _gstPer != null;

  // "gstAmt" field.
  double? _gstAmt;
  double get gstAmt => _gstAmt ?? 0.0;
  set gstAmt(double? val) => _gstAmt = val;

  void incrementGstAmt(double amount) => gstAmt = gstAmt + amount;

  bool hasGstAmt() => _gstAmt != null;

  // "mrpPrice" field.
  double? _mrpPrice;
  double get mrpPrice => _mrpPrice ?? 0.0;
  set mrpPrice(double? val) => _mrpPrice = val;

  void incrementMrpPrice(double amount) => mrpPrice = mrpPrice + amount;

  bool hasMrpPrice() => _mrpPrice != null;

  static PurchaseSaleItemList1Struct fromMap(Map<String, dynamic> data) =>
      PurchaseSaleItemList1Struct(
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
        gstPer: data['gstPer'] as String?,
        gstAmt: castToType<double>(data['gstAmt']),
        mrpPrice: castToType<double>(data['mrpPrice']),
      );

  static PurchaseSaleItemList1Struct? maybeFromMap(dynamic data) => data is Map
      ? PurchaseSaleItemList1Struct.fromMap(data.cast<String, dynamic>())
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
        'gstPer': _gstPer,
        'gstAmt': _gstAmt,
        'mrpPrice': _mrpPrice,
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
        'gstPer': serializeParam(
          _gstPer,
          ParamType.String,
        ),
        'gstAmt': serializeParam(
          _gstAmt,
          ParamType.double,
        ),
        'mrpPrice': serializeParam(
          _mrpPrice,
          ParamType.double,
        ),
      }.withoutNulls;

  static PurchaseSaleItemList1Struct fromSerializableMap(
          Map<String, dynamic> data) =>
      PurchaseSaleItemList1Struct(
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
        gstPer: deserializeParam(
          data['gstPer'],
          ParamType.String,
          false,
        ),
        gstAmt: deserializeParam(
          data['gstAmt'],
          ParamType.double,
          false,
        ),
        mrpPrice: deserializeParam(
          data['mrpPrice'],
          ParamType.double,
          false,
        ),
      );

  @override
  String toString() => 'PurchaseSaleItemList1Struct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PurchaseSaleItemList1Struct &&
        name == other.name &&
        quantity == other.quantity &&
        price == other.price &&
        total == other.total &&
        id == other.id &&
        catId == other.catId &&
        discount == other.discount &&
        delliveryChrg == other.delliveryChrg &&
        acceptedQuantity == other.acceptedQuantity &&
        rejectedQuantity == other.rejectedQuantity &&
        gstPer == other.gstPer &&
        gstAmt == other.gstAmt &&
        mrpPrice == other.mrpPrice;
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
        rejectedQuantity,
        gstPer,
        gstAmt,
        mrpPrice
      ]);
}

PurchaseSaleItemList1Struct createPurchaseSaleItemList1Struct({
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
  String? gstPer,
  double? gstAmt,
  double? mrpPrice,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PurchaseSaleItemList1Struct(
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
      gstPer: gstPer,
      gstAmt: gstAmt,
      mrpPrice: mrpPrice,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PurchaseSaleItemList1Struct? updatePurchaseSaleItemList1Struct(
  PurchaseSaleItemList1Struct? purchaseSaleItemList1, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    purchaseSaleItemList1
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPurchaseSaleItemList1StructData(
  Map<String, dynamic> firestoreData,
  PurchaseSaleItemList1Struct? purchaseSaleItemList1,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (purchaseSaleItemList1 == null) {
    return;
  }
  if (purchaseSaleItemList1.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      purchaseSaleItemList1.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final purchaseSaleItemList1Data = getPurchaseSaleItemList1FirestoreData(
      purchaseSaleItemList1, forFieldValue);
  final nestedData =
      purchaseSaleItemList1Data.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      purchaseSaleItemList1.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPurchaseSaleItemList1FirestoreData(
  PurchaseSaleItemList1Struct? purchaseSaleItemList1, [
  bool forFieldValue = false,
]) {
  if (purchaseSaleItemList1 == null) {
    return {};
  }
  final firestoreData = mapToFirestore(purchaseSaleItemList1.toMap());

  // Add any Firestore field values
  purchaseSaleItemList1.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPurchaseSaleItemList1ListFirestoreData(
  List<PurchaseSaleItemList1Struct>? purchaseSaleItemList1s,
) =>
    purchaseSaleItemList1s
        ?.map((e) => getPurchaseSaleItemList1FirestoreData(e, true))
        .toList() ??
    [];
