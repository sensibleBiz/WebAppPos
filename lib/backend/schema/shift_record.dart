import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ShiftRecord extends FirestoreRecord {
  ShiftRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  bool hasId() => _id != null;

  // "billCount" field.
  int? _billCount;
  int get billCount => _billCount ?? 0;
  bool hasBillCount() => _billCount != null;

  // "dayId" field.
  String? _dayId;
  String get dayId => _dayId ?? '';
  bool hasDayId() => _dayId != null;

  // "lastBillNo" field.
  String? _lastBillNo;
  String get lastBillNo => _lastBillNo ?? '';
  bool hasLastBillNo() => _lastBillNo != null;

  // "lastBillTime" field.
  int? _lastBillTime;
  int get lastBillTime => _lastBillTime ?? 0;
  bool hasLastBillTime() => _lastBillTime != null;

  // "tax" field.
  double? _tax;
  double get tax => _tax ?? 0.0;
  bool hasTax() => _tax != null;

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  bool hasCode() => _code != null;

  // "shiftId" field.
  String? _shiftId;
  String get shiftId => _shiftId ?? '';
  bool hasShiftId() => _shiftId != null;

  // "deliveryCharges" field.
  double? _deliveryCharges;
  double get deliveryCharges => _deliveryCharges ?? 0.0;
  bool hasDeliveryCharges() => _deliveryCharges != null;

  // "advanceAmtTotal" field.
  double? _advanceAmtTotal;
  double get advanceAmtTotal => _advanceAmtTotal ?? 0.0;
  bool hasAdvanceAmtTotal() => _advanceAmtTotal != null;

  // "cashSale" field.
  double? _cashSale;
  double get cashSale => _cashSale ?? 0.0;
  bool hasCashSale() => _cashSale != null;

  // "creditSale" field.
  double? _creditSale;
  double get creditSale => _creditSale ?? 0.0;
  bool hasCreditSale() => _creditSale != null;

  // "customerReciveAmtTotal" field.
  double? _customerReciveAmtTotal;
  double get customerReciveAmtTotal => _customerReciveAmtTotal ?? 0.0;
  bool hasCustomerReciveAmtTotal() => _customerReciveAmtTotal != null;

  // "digitalSale" field.
  double? _digitalSale;
  double get digitalSale => _digitalSale ?? 0.0;
  bool hasDigitalSale() => _digitalSale != null;

  // "discount" field.
  double? _discount;
  double get discount => _discount ?? 0.0;
  bool hasDiscount() => _discount != null;

  // "expensesAmtTotal" field.
  double? _expensesAmtTotal;
  double get expensesAmtTotal => _expensesAmtTotal ?? 0.0;
  bool hasExpensesAmtTotal() => _expensesAmtTotal != null;

  // "extraChargess" field.
  double? _extraChargess;
  double get extraChargess => _extraChargess ?? 0.0;
  bool hasExtraChargess() => _extraChargess != null;

  // "openingAmt" field.
  double? _openingAmt;
  double get openingAmt => _openingAmt ?? 0.0;
  bool hasOpeningAmt() => _openingAmt != null;

  // "receiveAmtTotal" field.
  double? _receiveAmtTotal;
  double get receiveAmtTotal => _receiveAmtTotal ?? 0.0;
  bool hasReceiveAmtTotal() => _receiveAmtTotal != null;

  // "refoundAmount" field.
  double? _refoundAmount;
  double get refoundAmount => _refoundAmount ?? 0.0;
  bool hasRefoundAmount() => _refoundAmount != null;

  // "totalSale" field.
  double? _totalSale;
  double get totalSale => _totalSale ?? 0.0;
  bool hasTotalSale() => _totalSale != null;

  // "googlePay" field.
  double? _googlePay;
  double get googlePay => _googlePay ?? 0.0;
  bool hasGooglePay() => _googlePay != null;

  // "phonePay" field.
  double? _phonePay;
  double get phonePay => _phonePay ?? 0.0;
  bool hasPhonePay() => _phonePay != null;

  // "paytm" field.
  double? _paytm;
  double get paytm => _paytm ?? 0.0;
  bool hasPaytm() => _paytm != null;

  // "startDate" field.
  int? _startDate;
  int get startDate => _startDate ?? 0;
  bool hasStartDate() => _startDate != null;

  // "card" field.
  double? _card;
  double get card => _card ?? 0.0;
  bool hasCard() => _card != null;

  // "cheque" field.
  double? _cheque;
  double get cheque => _cheque ?? 0.0;
  bool hasCheque() => _cheque != null;

  // "other" field.
  double? _other;
  double get other => _other ?? 0.0;
  bool hasOther() => _other != null;

  // "upi" field.
  double? _upi;
  double get upi => _upi ?? 0.0;
  bool hasUpi() => _upi != null;

  // "roundOff" field.
  double? _roundOff;
  double get roundOff => _roundOff ?? 0.0;
  bool hasRoundOff() => _roundOff != null;

  // "credReci" field.
  double? _credReci;
  double get credReci => _credReci ?? 0.0;
  bool hasCredReci() => _credReci != null;

  // "worktime" field.
  double? _worktime;
  double get worktime => _worktime ?? 0.0;
  bool hasWorktime() => _worktime != null;

  // "cashInHand" field.
  double? _cashInHand;
  double get cashInHand => _cashInHand ?? 0.0;
  bool hasCashInHand() => _cashInHand != null;

  // "paymentJson" field.
  String? _paymentJson;
  String get paymentJson => _paymentJson ?? '';
  bool hasPaymentJson() => _paymentJson != null;

  // "json" field.
  String? _json;
  String get json => _json ?? '';
  bool hasJson() => _json != null;

  // "deviceId" field.
  String? _deviceId;
  String get deviceId => _deviceId ?? '';
  bool hasDeviceId() => _deviceId != null;

  // "userId" field.
  String? _userId;
  String get userId => _userId ?? '';
  bool hasUserId() => _userId != null;

  // "subTotalBill" field.
  double? _subTotalBill;
  double get subTotalBill => _subTotalBill ?? 0.0;
  bool hasSubTotalBill() => _subTotalBill != null;

  // "shiftNo" field.
  int? _shiftNo;
  int get shiftNo => _shiftNo ?? 0;
  bool hasShiftNo() => _shiftNo != null;

  // "inActive" field.
  bool? _inActive;
  bool get inActive => _inActive ?? false;
  bool hasInActive() => _inActive != null;

  // "productSaleList" field.
  List<SelltemListStruct>? _productSaleList;
  List<SelltemListStruct> get productSaleList => _productSaleList ?? const [];
  bool hasProductSaleList() => _productSaleList != null;

  // "startTime" field.
  int? _startTime;
  int get startTime => _startTime ?? 0;
  bool hasStartTime() => _startTime != null;

  // "endTime" field.
  int? _endTime;
  int get endTime => _endTime ?? 0;
  bool hasEndTime() => _endTime != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _id = snapshotData['id'] as String?;
    _billCount = castToType<int>(snapshotData['billCount']);
    _dayId = snapshotData['dayId'] as String?;
    _lastBillNo = snapshotData['lastBillNo'] as String?;
    _lastBillTime = castToType<int>(snapshotData['lastBillTime']);
    _tax = castToType<double>(snapshotData['tax']);
    _code = castToType<int>(snapshotData['code']);
    _shiftId = snapshotData['shiftId'] as String?;
    _deliveryCharges = castToType<double>(snapshotData['deliveryCharges']);
    _advanceAmtTotal = castToType<double>(snapshotData['advanceAmtTotal']);
    _cashSale = castToType<double>(snapshotData['cashSale']);
    _creditSale = castToType<double>(snapshotData['creditSale']);
    _customerReciveAmtTotal =
        castToType<double>(snapshotData['customerReciveAmtTotal']);
    _digitalSale = castToType<double>(snapshotData['digitalSale']);
    _discount = castToType<double>(snapshotData['discount']);
    _expensesAmtTotal = castToType<double>(snapshotData['expensesAmtTotal']);
    _extraChargess = castToType<double>(snapshotData['extraChargess']);
    _openingAmt = castToType<double>(snapshotData['openingAmt']);
    _receiveAmtTotal = castToType<double>(snapshotData['receiveAmtTotal']);
    _refoundAmount = castToType<double>(snapshotData['refoundAmount']);
    _totalSale = castToType<double>(snapshotData['totalSale']);
    _googlePay = castToType<double>(snapshotData['googlePay']);
    _phonePay = castToType<double>(snapshotData['phonePay']);
    _paytm = castToType<double>(snapshotData['paytm']);
    _startDate = castToType<int>(snapshotData['startDate']);
    _card = castToType<double>(snapshotData['card']);
    _cheque = castToType<double>(snapshotData['cheque']);
    _other = castToType<double>(snapshotData['other']);
    _upi = castToType<double>(snapshotData['upi']);
    _roundOff = castToType<double>(snapshotData['roundOff']);
    _credReci = castToType<double>(snapshotData['credReci']);
    _worktime = castToType<double>(snapshotData['worktime']);
    _cashInHand = castToType<double>(snapshotData['cashInHand']);
    _paymentJson = snapshotData['paymentJson'] as String?;
    _json = snapshotData['json'] as String?;
    _deviceId = snapshotData['deviceId'] as String?;
    _userId = snapshotData['userId'] as String?;
    _subTotalBill = castToType<double>(snapshotData['subTotalBill']);
    _shiftNo = castToType<int>(snapshotData['shiftNo']);
    _inActive = snapshotData['inActive'] as bool?;
    _productSaleList = getStructList(
      snapshotData['productSaleList'],
      SelltemListStruct.fromMap,
    );
    _startTime = castToType<int>(snapshotData['startTime']);
    _endTime = castToType<int>(snapshotData['endTime']);
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('SHIFT')
          : FirebaseFirestore.instance.collectionGroup('SHIFT');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('SHIFT').doc(id);

  static Stream<ShiftRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ShiftRecord.fromSnapshot(s));

  static Future<ShiftRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ShiftRecord.fromSnapshot(s));

  static ShiftRecord fromSnapshot(DocumentSnapshot snapshot) => ShiftRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ShiftRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ShiftRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ShiftRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ShiftRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createShiftRecordData({
  String? id,
  int? billCount,
  String? dayId,
  String? lastBillNo,
  int? lastBillTime,
  double? tax,
  int? code,
  String? shiftId,
  double? deliveryCharges,
  double? advanceAmtTotal,
  double? cashSale,
  double? creditSale,
  double? customerReciveAmtTotal,
  double? digitalSale,
  double? discount,
  double? expensesAmtTotal,
  double? extraChargess,
  double? openingAmt,
  double? receiveAmtTotal,
  double? refoundAmount,
  double? totalSale,
  double? googlePay,
  double? phonePay,
  double? paytm,
  int? startDate,
  double? card,
  double? cheque,
  double? other,
  double? upi,
  double? roundOff,
  double? credReci,
  double? worktime,
  double? cashInHand,
  String? paymentJson,
  String? json,
  String? deviceId,
  String? userId,
  double? subTotalBill,
  int? shiftNo,
  bool? inActive,
  int? startTime,
  int? endTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'id': id,
      'billCount': billCount,
      'dayId': dayId,
      'lastBillNo': lastBillNo,
      'lastBillTime': lastBillTime,
      'tax': tax,
      'code': code,
      'shiftId': shiftId,
      'deliveryCharges': deliveryCharges,
      'advanceAmtTotal': advanceAmtTotal,
      'cashSale': cashSale,
      'creditSale': creditSale,
      'customerReciveAmtTotal': customerReciveAmtTotal,
      'digitalSale': digitalSale,
      'discount': discount,
      'expensesAmtTotal': expensesAmtTotal,
      'extraChargess': extraChargess,
      'openingAmt': openingAmt,
      'receiveAmtTotal': receiveAmtTotal,
      'refoundAmount': refoundAmount,
      'totalSale': totalSale,
      'googlePay': googlePay,
      'phonePay': phonePay,
      'paytm': paytm,
      'startDate': startDate,
      'card': card,
      'cheque': cheque,
      'other': other,
      'upi': upi,
      'roundOff': roundOff,
      'credReci': credReci,
      'worktime': worktime,
      'cashInHand': cashInHand,
      'paymentJson': paymentJson,
      'json': json,
      'deviceId': deviceId,
      'userId': userId,
      'subTotalBill': subTotalBill,
      'shiftNo': shiftNo,
      'inActive': inActive,
      'startTime': startTime,
      'endTime': endTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class ShiftRecordDocumentEquality implements Equality<ShiftRecord> {
  const ShiftRecordDocumentEquality();

  @override
  bool equals(ShiftRecord? e1, ShiftRecord? e2) {
    const listEquality = ListEquality();
    return e1?.id == e2?.id &&
        e1?.billCount == e2?.billCount &&
        e1?.dayId == e2?.dayId &&
        e1?.lastBillNo == e2?.lastBillNo &&
        e1?.lastBillTime == e2?.lastBillTime &&
        e1?.tax == e2?.tax &&
        e1?.code == e2?.code &&
        e1?.shiftId == e2?.shiftId &&
        e1?.deliveryCharges == e2?.deliveryCharges &&
        e1?.advanceAmtTotal == e2?.advanceAmtTotal &&
        e1?.cashSale == e2?.cashSale &&
        e1?.creditSale == e2?.creditSale &&
        e1?.customerReciveAmtTotal == e2?.customerReciveAmtTotal &&
        e1?.digitalSale == e2?.digitalSale &&
        e1?.discount == e2?.discount &&
        e1?.expensesAmtTotal == e2?.expensesAmtTotal &&
        e1?.extraChargess == e2?.extraChargess &&
        e1?.openingAmt == e2?.openingAmt &&
        e1?.receiveAmtTotal == e2?.receiveAmtTotal &&
        e1?.refoundAmount == e2?.refoundAmount &&
        e1?.totalSale == e2?.totalSale &&
        e1?.googlePay == e2?.googlePay &&
        e1?.phonePay == e2?.phonePay &&
        e1?.paytm == e2?.paytm &&
        e1?.startDate == e2?.startDate &&
        e1?.card == e2?.card &&
        e1?.cheque == e2?.cheque &&
        e1?.other == e2?.other &&
        e1?.upi == e2?.upi &&
        e1?.roundOff == e2?.roundOff &&
        e1?.credReci == e2?.credReci &&
        e1?.worktime == e2?.worktime &&
        e1?.cashInHand == e2?.cashInHand &&
        e1?.paymentJson == e2?.paymentJson &&
        e1?.json == e2?.json &&
        e1?.deviceId == e2?.deviceId &&
        e1?.userId == e2?.userId &&
        e1?.subTotalBill == e2?.subTotalBill &&
        e1?.shiftNo == e2?.shiftNo &&
        e1?.inActive == e2?.inActive &&
        listEquality.equals(e1?.productSaleList, e2?.productSaleList) &&
        e1?.startTime == e2?.startTime &&
        e1?.endTime == e2?.endTime;
  }

  @override
  int hash(ShiftRecord? e) => const ListEquality().hash([
        e?.id,
        e?.billCount,
        e?.dayId,
        e?.lastBillNo,
        e?.lastBillTime,
        e?.tax,
        e?.code,
        e?.shiftId,
        e?.deliveryCharges,
        e?.advanceAmtTotal,
        e?.cashSale,
        e?.creditSale,
        e?.customerReciveAmtTotal,
        e?.digitalSale,
        e?.discount,
        e?.expensesAmtTotal,
        e?.extraChargess,
        e?.openingAmt,
        e?.receiveAmtTotal,
        e?.refoundAmount,
        e?.totalSale,
        e?.googlePay,
        e?.phonePay,
        e?.paytm,
        e?.startDate,
        e?.card,
        e?.cheque,
        e?.other,
        e?.upi,
        e?.roundOff,
        e?.credReci,
        e?.worktime,
        e?.cashInHand,
        e?.paymentJson,
        e?.json,
        e?.deviceId,
        e?.userId,
        e?.subTotalBill,
        e?.shiftNo,
        e?.inActive,
        e?.productSaleList,
        e?.startTime,
        e?.endTime
      ]);

  @override
  bool isValidKey(Object? o) => o is ShiftRecord;
}
