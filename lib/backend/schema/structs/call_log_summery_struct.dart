// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CallLogSummeryStruct extends FFFirebaseStruct {
  CallLogSummeryStruct({
    String? depname,
    int? total,
    int? incoming,
    int? outgoing,
    int? rejected,
    int? missed,
    List<CallLogNameStruct>? names,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _depname = depname,
        _total = total,
        _incoming = incoming,
        _outgoing = outgoing,
        _rejected = rejected,
        _missed = missed,
        _names = names,
        super(firestoreUtilData);

  // "depname" field.
  String? _depname;
  String get depname => _depname ?? '';
  set depname(String? val) => _depname = val;

  bool hasDepname() => _depname != null;

  // "total" field.
  int? _total;
  int get total => _total ?? 0;
  set total(int? val) => _total = val;

  void incrementTotal(int amount) => total = total + amount;

  bool hasTotal() => _total != null;

  // "incoming" field.
  int? _incoming;
  int get incoming => _incoming ?? 0;
  set incoming(int? val) => _incoming = val;

  void incrementIncoming(int amount) => incoming = incoming + amount;

  bool hasIncoming() => _incoming != null;

  // "outgoing" field.
  int? _outgoing;
  int get outgoing => _outgoing ?? 0;
  set outgoing(int? val) => _outgoing = val;

  void incrementOutgoing(int amount) => outgoing = outgoing + amount;

  bool hasOutgoing() => _outgoing != null;

  // "rejected" field.
  int? _rejected;
  int get rejected => _rejected ?? 0;
  set rejected(int? val) => _rejected = val;

  void incrementRejected(int amount) => rejected = rejected + amount;

  bool hasRejected() => _rejected != null;

  // "missed" field.
  int? _missed;
  int get missed => _missed ?? 0;
  set missed(int? val) => _missed = val;

  void incrementMissed(int amount) => missed = missed + amount;

  bool hasMissed() => _missed != null;

  // "names" field.
  List<CallLogNameStruct>? _names;
  List<CallLogNameStruct> get names => _names ?? const [];
  set names(List<CallLogNameStruct>? val) => _names = val;

  void updateNames(Function(List<CallLogNameStruct>) updateFn) {
    updateFn(_names ??= []);
  }

  bool hasNames() => _names != null;

  static CallLogSummeryStruct fromMap(Map<String, dynamic> data) =>
      CallLogSummeryStruct(
        depname: data['depname'] as String?,
        total: castToType<int>(data['total']),
        incoming: castToType<int>(data['incoming']),
        outgoing: castToType<int>(data['outgoing']),
        rejected: castToType<int>(data['rejected']),
        missed: castToType<int>(data['missed']),
        names: getStructList(
          data['names'],
          CallLogNameStruct.fromMap,
        ),
      );

  static CallLogSummeryStruct? maybeFromMap(dynamic data) => data is Map
      ? CallLogSummeryStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'depname': _depname,
        'total': _total,
        'incoming': _incoming,
        'outgoing': _outgoing,
        'rejected': _rejected,
        'missed': _missed,
        'names': _names?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'depname': serializeParam(
          _depname,
          ParamType.String,
        ),
        'total': serializeParam(
          _total,
          ParamType.int,
        ),
        'incoming': serializeParam(
          _incoming,
          ParamType.int,
        ),
        'outgoing': serializeParam(
          _outgoing,
          ParamType.int,
        ),
        'rejected': serializeParam(
          _rejected,
          ParamType.int,
        ),
        'missed': serializeParam(
          _missed,
          ParamType.int,
        ),
        'names': serializeParam(
          _names,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static CallLogSummeryStruct fromSerializableMap(Map<String, dynamic> data) =>
      CallLogSummeryStruct(
        depname: deserializeParam(
          data['depname'],
          ParamType.String,
          false,
        ),
        total: deserializeParam(
          data['total'],
          ParamType.int,
          false,
        ),
        incoming: deserializeParam(
          data['incoming'],
          ParamType.int,
          false,
        ),
        outgoing: deserializeParam(
          data['outgoing'],
          ParamType.int,
          false,
        ),
        rejected: deserializeParam(
          data['rejected'],
          ParamType.int,
          false,
        ),
        missed: deserializeParam(
          data['missed'],
          ParamType.int,
          false,
        ),
        names: deserializeStructParam<CallLogNameStruct>(
          data['names'],
          ParamType.DataStruct,
          true,
          structBuilder: CallLogNameStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'CallLogSummeryStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is CallLogSummeryStruct &&
        depname == other.depname &&
        total == other.total &&
        incoming == other.incoming &&
        outgoing == other.outgoing &&
        rejected == other.rejected &&
        missed == other.missed &&
        listEquality.equals(names, other.names);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([depname, total, incoming, outgoing, rejected, missed, names]);
}

CallLogSummeryStruct createCallLogSummeryStruct({
  String? depname,
  int? total,
  int? incoming,
  int? outgoing,
  int? rejected,
  int? missed,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CallLogSummeryStruct(
      depname: depname,
      total: total,
      incoming: incoming,
      outgoing: outgoing,
      rejected: rejected,
      missed: missed,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CallLogSummeryStruct? updateCallLogSummeryStruct(
  CallLogSummeryStruct? callLogSummery, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    callLogSummery
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCallLogSummeryStructData(
  Map<String, dynamic> firestoreData,
  CallLogSummeryStruct? callLogSummery,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (callLogSummery == null) {
    return;
  }
  if (callLogSummery.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && callLogSummery.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final callLogSummeryData =
      getCallLogSummeryFirestoreData(callLogSummery, forFieldValue);
  final nestedData =
      callLogSummeryData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = callLogSummery.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCallLogSummeryFirestoreData(
  CallLogSummeryStruct? callLogSummery, [
  bool forFieldValue = false,
]) {
  if (callLogSummery == null) {
    return {};
  }
  final firestoreData = mapToFirestore(callLogSummery.toMap());

  // Add any Firestore field values
  callLogSummery.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCallLogSummeryListFirestoreData(
  List<CallLogSummeryStruct>? callLogSummerys,
) =>
    callLogSummerys
        ?.map((e) => getCallLogSummeryFirestoreData(e, true))
        .toList() ??
    [];
