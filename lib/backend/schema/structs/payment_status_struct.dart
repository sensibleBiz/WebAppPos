// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentStatusStruct extends FFFirebaseStruct {
  PaymentStatusStruct({
    bool? successBool,
    PaymentStatus? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _successBool = successBool,
        _status = status,
        super(firestoreUtilData);

  // "successBool" field.
  bool? _successBool;
  bool get successBool => _successBool ?? false;
  set successBool(bool? val) => _successBool = val;

  bool hasSuccessBool() => _successBool != null;

  // "status" field.
  PaymentStatus? _status;
  PaymentStatus? get status => _status;
  set status(PaymentStatus? val) => _status = val;

  bool hasStatus() => _status != null;

  static PaymentStatusStruct fromMap(Map<String, dynamic> data) =>
      PaymentStatusStruct(
        successBool: data['successBool'] as bool?,
        status: data['status'] is PaymentStatus
            ? data['status']
            : deserializeEnum<PaymentStatus>(data['status']),
      );

  static PaymentStatusStruct? maybeFromMap(dynamic data) => data is Map
      ? PaymentStatusStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'successBool': _successBool,
        'status': _status?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'successBool': serializeParam(
          _successBool,
          ParamType.bool,
        ),
        'status': serializeParam(
          _status,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static PaymentStatusStruct fromSerializableMap(Map<String, dynamic> data) =>
      PaymentStatusStruct(
        successBool: deserializeParam(
          data['successBool'],
          ParamType.bool,
          false,
        ),
        status: deserializeParam<PaymentStatus>(
          data['status'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'PaymentStatusStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PaymentStatusStruct &&
        successBool == other.successBool &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([successBool, status]);
}

PaymentStatusStruct createPaymentStatusStruct({
  bool? successBool,
  PaymentStatus? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PaymentStatusStruct(
      successBool: successBool,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PaymentStatusStruct? updatePaymentStatusStruct(
  PaymentStatusStruct? paymentStatus, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    paymentStatus
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPaymentStatusStructData(
  Map<String, dynamic> firestoreData,
  PaymentStatusStruct? paymentStatus,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (paymentStatus == null) {
    return;
  }
  if (paymentStatus.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && paymentStatus.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final paymentStatusData =
      getPaymentStatusFirestoreData(paymentStatus, forFieldValue);
  final nestedData =
      paymentStatusData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = paymentStatus.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPaymentStatusFirestoreData(
  PaymentStatusStruct? paymentStatus, [
  bool forFieldValue = false,
]) {
  if (paymentStatus == null) {
    return {};
  }
  final firestoreData = mapToFirestore(paymentStatus.toMap());

  // Add any Firestore field values
  paymentStatus.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPaymentStatusListFirestoreData(
  List<PaymentStatusStruct>? paymentStatuss,
) =>
    paymentStatuss
        ?.map((e) => getPaymentStatusFirestoreData(e, true))
        .toList() ??
    [];
