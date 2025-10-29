// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class DemoListStruct extends FFFirebaseStruct {
  DemoListStruct({
    int? checkInTime,
    int? checkOutTime,
    LatLng? checkInLocation,
    LatLng? checkOutLocation,
    String? note,
    String? travelMode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _checkInTime = checkInTime,
        _checkOutTime = checkOutTime,
        _checkInLocation = checkInLocation,
        _checkOutLocation = checkOutLocation,
        _note = note,
        _travelMode = travelMode,
        super(firestoreUtilData);

  // "checkInTime" field.
  int? _checkInTime;
  int get checkInTime => _checkInTime ?? 0;
  set checkInTime(int? val) => _checkInTime = val;

  void incrementCheckInTime(int amount) => checkInTime = checkInTime + amount;

  bool hasCheckInTime() => _checkInTime != null;

  // "checkOutTime" field.
  int? _checkOutTime;
  int get checkOutTime => _checkOutTime ?? 0;
  set checkOutTime(int? val) => _checkOutTime = val;

  void incrementCheckOutTime(int amount) =>
      checkOutTime = checkOutTime + amount;

  bool hasCheckOutTime() => _checkOutTime != null;

  // "checkInLocation" field.
  LatLng? _checkInLocation;
  LatLng? get checkInLocation => _checkInLocation;
  set checkInLocation(LatLng? val) => _checkInLocation = val;

  bool hasCheckInLocation() => _checkInLocation != null;

  // "checkOutLocation" field.
  LatLng? _checkOutLocation;
  LatLng? get checkOutLocation => _checkOutLocation;
  set checkOutLocation(LatLng? val) => _checkOutLocation = val;

  bool hasCheckOutLocation() => _checkOutLocation != null;

  // "note" field.
  String? _note;
  String get note => _note ?? '';
  set note(String? val) => _note = val;

  bool hasNote() => _note != null;

  // "travelMode" field.
  String? _travelMode;
  String get travelMode => _travelMode ?? '';
  set travelMode(String? val) => _travelMode = val;

  bool hasTravelMode() => _travelMode != null;

  static DemoListStruct fromMap(Map<String, dynamic> data) => DemoListStruct(
        checkInTime: castToType<int>(data['checkInTime']),
        checkOutTime: castToType<int>(data['checkOutTime']),
        checkInLocation: data['checkInLocation'] as LatLng?,
        checkOutLocation: data['checkOutLocation'] as LatLng?,
        note: data['note'] as String?,
        travelMode: data['travelMode'] as String?,
      );

  static DemoListStruct? maybeFromMap(dynamic data) =>
      data is Map ? DemoListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'checkInTime': _checkInTime,
        'checkOutTime': _checkOutTime,
        'checkInLocation': _checkInLocation,
        'checkOutLocation': _checkOutLocation,
        'note': _note,
        'travelMode': _travelMode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'checkInTime': serializeParam(
          _checkInTime,
          ParamType.int,
        ),
        'checkOutTime': serializeParam(
          _checkOutTime,
          ParamType.int,
        ),
        'checkInLocation': serializeParam(
          _checkInLocation,
          ParamType.LatLng,
        ),
        'checkOutLocation': serializeParam(
          _checkOutLocation,
          ParamType.LatLng,
        ),
        'note': serializeParam(
          _note,
          ParamType.String,
        ),
        'travelMode': serializeParam(
          _travelMode,
          ParamType.String,
        ),
      }.withoutNulls;

  static DemoListStruct fromSerializableMap(Map<String, dynamic> data) =>
      DemoListStruct(
        checkInTime: deserializeParam(
          data['checkInTime'],
          ParamType.int,
          false,
        ),
        checkOutTime: deserializeParam(
          data['checkOutTime'],
          ParamType.int,
          false,
        ),
        checkInLocation: deserializeParam(
          data['checkInLocation'],
          ParamType.LatLng,
          false,
        ),
        checkOutLocation: deserializeParam(
          data['checkOutLocation'],
          ParamType.LatLng,
          false,
        ),
        note: deserializeParam(
          data['note'],
          ParamType.String,
          false,
        ),
        travelMode: deserializeParam(
          data['travelMode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DemoListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DemoListStruct &&
        checkInTime == other.checkInTime &&
        checkOutTime == other.checkOutTime &&
        checkInLocation == other.checkInLocation &&
        checkOutLocation == other.checkOutLocation &&
        note == other.note &&
        travelMode == other.travelMode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        checkInTime,
        checkOutTime,
        checkInLocation,
        checkOutLocation,
        note,
        travelMode
      ]);
}

DemoListStruct createDemoListStruct({
  int? checkInTime,
  int? checkOutTime,
  LatLng? checkInLocation,
  LatLng? checkOutLocation,
  String? note,
  String? travelMode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DemoListStruct(
      checkInTime: checkInTime,
      checkOutTime: checkOutTime,
      checkInLocation: checkInLocation,
      checkOutLocation: checkOutLocation,
      note: note,
      travelMode: travelMode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DemoListStruct? updateDemoListStruct(
  DemoListStruct? demoList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    demoList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDemoListStructData(
  Map<String, dynamic> firestoreData,
  DemoListStruct? demoList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (demoList == null) {
    return;
  }
  if (demoList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && demoList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final demoListData = getDemoListFirestoreData(demoList, forFieldValue);
  final nestedData = demoListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = demoList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDemoListFirestoreData(
  DemoListStruct? demoList, [
  bool forFieldValue = false,
]) {
  if (demoList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(demoList.toMap());

  // Add any Firestore field values
  demoList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDemoListListFirestoreData(
  List<DemoListStruct>? demoLists,
) =>
    demoLists?.map((e) => getDemoListFirestoreData(e, true)).toList() ?? [];
