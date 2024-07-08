// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CallLogListStruct extends FFFirebaseStruct {
  CallLogListStruct({
    int? date,
    int? time,
    String? type,
    int? callDuration,
    String? callNote,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _date = date,
        _time = time,
        _type = type,
        _callDuration = callDuration,
        _callNote = callNote,
        super(firestoreUtilData);

  // "date" field.
  int? _date;
  int get date => _date ?? 0;
  set date(int? val) => _date = val;

  void incrementDate(int amount) => date = date + amount;

  bool hasDate() => _date != null;

  // "time" field.
  int? _time;
  int get time => _time ?? 0;
  set time(int? val) => _time = val;

  void incrementTime(int amount) => time = time + amount;

  bool hasTime() => _time != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  set type(String? val) => _type = val;

  bool hasType() => _type != null;

  // "call_duration" field.
  int? _callDuration;
  int get callDuration => _callDuration ?? 0;
  set callDuration(int? val) => _callDuration = val;

  void incrementCallDuration(int amount) =>
      callDuration = callDuration + amount;

  bool hasCallDuration() => _callDuration != null;

  // "call_note" field.
  String? _callNote;
  String get callNote => _callNote ?? '';
  set callNote(String? val) => _callNote = val;

  bool hasCallNote() => _callNote != null;

  static CallLogListStruct fromMap(Map<String, dynamic> data) =>
      CallLogListStruct(
        date: castToType<int>(data['date']),
        time: castToType<int>(data['time']),
        type: data['type'] as String?,
        callDuration: castToType<int>(data['call_duration']),
        callNote: data['call_note'] as String?,
      );

  static CallLogListStruct? maybeFromMap(dynamic data) => data is Map
      ? CallLogListStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'date': _date,
        'time': _time,
        'type': _type,
        'call_duration': _callDuration,
        'call_note': _callNote,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'date': serializeParam(
          _date,
          ParamType.int,
        ),
        'time': serializeParam(
          _time,
          ParamType.int,
        ),
        'type': serializeParam(
          _type,
          ParamType.String,
        ),
        'call_duration': serializeParam(
          _callDuration,
          ParamType.int,
        ),
        'call_note': serializeParam(
          _callNote,
          ParamType.String,
        ),
      }.withoutNulls;

  static CallLogListStruct fromSerializableMap(Map<String, dynamic> data) =>
      CallLogListStruct(
        date: deserializeParam(
          data['date'],
          ParamType.int,
          false,
        ),
        time: deserializeParam(
          data['time'],
          ParamType.int,
          false,
        ),
        type: deserializeParam(
          data['type'],
          ParamType.String,
          false,
        ),
        callDuration: deserializeParam(
          data['call_duration'],
          ParamType.int,
          false,
        ),
        callNote: deserializeParam(
          data['call_note'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CallLogListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CallLogListStruct &&
        date == other.date &&
        time == other.time &&
        type == other.type &&
        callDuration == other.callDuration &&
        callNote == other.callNote;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([date, time, type, callDuration, callNote]);
}

CallLogListStruct createCallLogListStruct({
  int? date,
  int? time,
  String? type,
  int? callDuration,
  String? callNote,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CallLogListStruct(
      date: date,
      time: time,
      type: type,
      callDuration: callDuration,
      callNote: callNote,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CallLogListStruct? updateCallLogListStruct(
  CallLogListStruct? callLogList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    callLogList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCallLogListStructData(
  Map<String, dynamic> firestoreData,
  CallLogListStruct? callLogList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (callLogList == null) {
    return;
  }
  if (callLogList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && callLogList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final callLogListData =
      getCallLogListFirestoreData(callLogList, forFieldValue);
  final nestedData =
      callLogListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = callLogList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCallLogListFirestoreData(
  CallLogListStruct? callLogList, [
  bool forFieldValue = false,
]) {
  if (callLogList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(callLogList.toMap());

  // Add any Firestore field values
  callLogList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCallLogListListFirestoreData(
  List<CallLogListStruct>? callLogLists,
) =>
    callLogLists?.map((e) => getCallLogListFirestoreData(e, true)).toList() ??
    [];
