// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StatesStruct extends FFFirebaseStruct {
  StatesStruct({
    int? code,
    String? id,
    String? name,
    String? zone,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _code = code,
        _id = id,
        _name = name,
        _zone = zone,
        super(firestoreUtilData);

  // "code" field.
  int? _code;
  int get code => _code ?? 0;
  set code(int? val) => _code = val;

  void incrementCode(int amount) => code = code + amount;

  bool hasCode() => _code != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "zone" field.
  String? _zone;
  String get zone => _zone ?? '';
  set zone(String? val) => _zone = val;

  bool hasZone() => _zone != null;

  static StatesStruct fromMap(Map<String, dynamic> data) => StatesStruct(
        code: castToType<int>(data['code']),
        id: data['id'] as String?,
        name: data['name'] as String?,
        zone: data['zone'] as String?,
      );

  static StatesStruct? maybeFromMap(dynamic data) =>
      data is Map ? StatesStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'code': _code,
        'id': _id,
        'name': _name,
        'zone': _zone,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'zone': serializeParam(
          _zone,
          ParamType.String,
        ),
      }.withoutNulls;

  static StatesStruct fromSerializableMap(Map<String, dynamic> data) =>
      StatesStruct(
        code: deserializeParam(
          data['code'],
          ParamType.int,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        zone: deserializeParam(
          data['zone'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'StatesStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StatesStruct &&
        code == other.code &&
        id == other.id &&
        name == other.name &&
        zone == other.zone;
  }

  @override
  int get hashCode => const ListEquality().hash([code, id, name, zone]);
}

StatesStruct createStatesStruct({
  int? code,
  String? id,
  String? name,
  String? zone,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StatesStruct(
      code: code,
      id: id,
      name: name,
      zone: zone,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StatesStruct? updateStatesStruct(
  StatesStruct? states, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    states
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStatesStructData(
  Map<String, dynamic> firestoreData,
  StatesStruct? states,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (states == null) {
    return;
  }
  if (states.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && states.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final statesData = getStatesFirestoreData(states, forFieldValue);
  final nestedData = statesData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = states.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStatesFirestoreData(
  StatesStruct? states, [
  bool forFieldValue = false,
]) {
  if (states == null) {
    return {};
  }
  final firestoreData = mapToFirestore(states.toMap());

  // Add any Firestore field values
  states.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStatesListFirestoreData(
  List<StatesStruct>? statess,
) =>
    statess?.map((e) => getStatesFirestoreData(e, true)).toList() ?? [];
