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
    String? gstPer,
    double? gstAmt,
    double? mrpPrice,
    double? cgst,
    double? sgst,
    int? cgstPer,
    int? sgstPer,
    double? igst,
    int? igstPer,
    String? posSerial,
    String? deviceId,
    String? posModel,
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
        _cgst = cgst,
        _sgst = sgst,
        _cgstPer = cgstPer,
        _sgstPer = sgstPer,
        _igst = igst,
        _igstPer = igstPer,
        _posSerial = posSerial,
        _deviceId = deviceId,
        _posModel = posModel,
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

  // "cgst" field.
  double? _cgst;
  double get cgst => _cgst ?? 0.0;
  set cgst(double? val) => _cgst = val;

  void incrementCgst(double amount) => cgst = cgst + amount;

  bool hasCgst() => _cgst != null;

  // "sgst" field.
  double? _sgst;
  double get sgst => _sgst ?? 0.0;
  set sgst(double? val) => _sgst = val;

  void incrementSgst(double amount) => sgst = sgst + amount;

  bool hasSgst() => _sgst != null;

  // "cgstPer" field.
  int? _cgstPer;
  int get cgstPer => _cgstPer ?? 0;
  set cgstPer(int? val) => _cgstPer = val;

  void incrementCgstPer(int amount) => cgstPer = cgstPer + amount;

  bool hasCgstPer() => _cgstPer != null;

  // "sgstPer" field.
  int? _sgstPer;
  int get sgstPer => _sgstPer ?? 0;
  set sgstPer(int? val) => _sgstPer = val;

  void incrementSgstPer(int amount) => sgstPer = sgstPer + amount;

  bool hasSgstPer() => _sgstPer != null;

  // "igst" field.
  double? _igst;
  double get igst => _igst ?? 0.0;
  set igst(double? val) => _igst = val;

  void incrementIgst(double amount) => igst = igst + amount;

  bool hasIgst() => _igst != null;

  // "igstPer" field.
  int? _igstPer;
  int get igstPer => _igstPer ?? 0;
  set igstPer(int? val) => _igstPer = val;

  void incrementIgstPer(int amount) => igstPer = igstPer + amount;

  bool hasIgstPer() => _igstPer != null;

  // "posSerial" field.
  String? _posSerial;
  String get posSerial => _posSerial ?? '';
  set posSerial(String? val) => _posSerial = val;

  bool hasPosSerial() => _posSerial != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  set deviceId(String? val) => _deviceId = val;

  bool hasDeviceId() => _deviceId != null;

  // "posModel" field.
  String? _posModel;
  String get posModel => _posModel ?? '';
  set posModel(String? val) => _posModel = val;

  bool hasPosModel() => _posModel != null;

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
        gstPer: data['gstPer'] as String?,
        gstAmt: castToType<double>(data['gstAmt']),
        mrpPrice: castToType<double>(data['mrpPrice']),
        cgst: castToType<double>(data['cgst']),
        sgst: castToType<double>(data['sgst']),
        cgstPer: castToType<int>(data['cgstPer']),
        sgstPer: castToType<int>(data['sgstPer']),
        igst: castToType<double>(data['igst']),
        igstPer: castToType<int>(data['igstPer']),
        posSerial: data['posSerial'] as String?,
        deviceId: data['deviceId'] as String?,
        posModel: data['posModel'] as String?,
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
        'gstPer': _gstPer,
        'gstAmt': _gstAmt,
        'mrpPrice': _mrpPrice,
        'cgst': _cgst,
        'sgst': _sgst,
        'cgstPer': _cgstPer,
        'sgstPer': _sgstPer,
        'igst': _igst,
        'igstPer': _igstPer,
        'posSerial': _posSerial,
        'deviceId': _deviceId,
        'posModel': _posModel,
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
        'cgst': serializeParam(
          _cgst,
          ParamType.double,
        ),
        'sgst': serializeParam(
          _sgst,
          ParamType.double,
        ),
        'cgstPer': serializeParam(
          _cgstPer,
          ParamType.int,
        ),
        'sgstPer': serializeParam(
          _sgstPer,
          ParamType.int,
        ),
        'igst': serializeParam(
          _igst,
          ParamType.double,
        ),
        'igstPer': serializeParam(
          _igstPer,
          ParamType.int,
        ),
        'posSerial': serializeParam(
          _posSerial,
          ParamType.String,
        ),
        'deviceId': serializeParam(
          _deviceId,
          ParamType.String,
        ),
        'posModel': serializeParam(
          _posModel,
          ParamType.String,
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
        cgst: deserializeParam(
          data['cgst'],
          ParamType.double,
          false,
        ),
        sgst: deserializeParam(
          data['sgst'],
          ParamType.double,
          false,
        ),
        cgstPer: deserializeParam(
          data['cgstPer'],
          ParamType.int,
          false,
        ),
        sgstPer: deserializeParam(
          data['sgstPer'],
          ParamType.int,
          false,
        ),
        igst: deserializeParam(
          data['igst'],
          ParamType.double,
          false,
        ),
        igstPer: deserializeParam(
          data['igstPer'],
          ParamType.int,
          false,
        ),
        posSerial: deserializeParam(
          data['posSerial'],
          ParamType.String,
          false,
        ),
        deviceId: deserializeParam(
          data['deviceId'],
          ParamType.String,
          false,
        ),
        posModel: deserializeParam(
          data['posModel'],
          ParamType.String,
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
        rejectedQuantity == other.rejectedQuantity &&
        gstPer == other.gstPer &&
        gstAmt == other.gstAmt &&
        mrpPrice == other.mrpPrice &&
        cgst == other.cgst &&
        sgst == other.sgst &&
        cgstPer == other.cgstPer &&
        sgstPer == other.sgstPer &&
        igst == other.igst &&
        igstPer == other.igstPer &&
        posSerial == other.posSerial &&
        deviceId == other.deviceId &&
        posModel == other.posModel;
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
        mrpPrice,
        cgst,
        sgst,
        cgstPer,
        sgstPer,
        igst,
        igstPer,
        posSerial,
        deviceId,
        posModel
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
  String? gstPer,
  double? gstAmt,
  double? mrpPrice,
  double? cgst,
  double? sgst,
  int? cgstPer,
  int? sgstPer,
  double? igst,
  int? igstPer,
  String? posSerial,
  String? deviceId,
  String? posModel,
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
      gstPer: gstPer,
      gstAmt: gstAmt,
      mrpPrice: mrpPrice,
      cgst: cgst,
      sgst: sgst,
      cgstPer: cgstPer,
      sgstPer: sgstPer,
      igst: igst,
      igstPer: igstPer,
      posSerial: posSerial,
      deviceId: deviceId,
      posModel: posModel,
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
