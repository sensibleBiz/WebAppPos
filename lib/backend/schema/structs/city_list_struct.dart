// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CityListStruct extends FFFirebaseStruct {
  CityListStruct({
    String? cityName,
    int? code,
    String? id,
    String? state,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cityName = cityName,
        _code = code,
        _id = id,
        _state = state,
        super(firestoreUtilData);

  // "cityName" field.
  String? _cityName;
  String get cityName => _cityName ?? '';
  set cityName(String? val) => _cityName = val;

  bool hasCityName() => _cityName != null;

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

  // "state" field.
  String? _state;
  String get state => _state ?? '';
  set state(String? val) => _state = val;

  bool hasState() => _state != null;

  static CityListStruct fromMap(Map<String, dynamic> data) => CityListStruct(
        cityName: data['cityName'] as String?,
        code: castToType<int>(data['code']),
        id: data['id'] as String?,
        state: data['state'] as String?,
      );

  static CityListStruct? maybeFromMap(dynamic data) =>
      data is Map ? CityListStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'cityName': _cityName,
        'code': _code,
        'id': _id,
        'state': _state,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cityName': serializeParam(
          _cityName,
          ParamType.String,
        ),
        'code': serializeParam(
          _code,
          ParamType.int,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
        'state': serializeParam(
          _state,
          ParamType.String,
        ),
      }.withoutNulls;

  static CityListStruct fromSerializableMap(Map<String, dynamic> data) =>
      CityListStruct(
        cityName: deserializeParam(
          data['cityName'],
          ParamType.String,
          false,
        ),
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
        state: deserializeParam(
          data['state'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CityListStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CityListStruct &&
        cityName == other.cityName &&
        code == other.code &&
        id == other.id &&
        state == other.state;
  }

  @override
  int get hashCode => const ListEquality().hash([cityName, code, id, state]);
}

CityListStruct createCityListStruct({
  String? cityName,
  int? code,
  String? id,
  String? state,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CityListStruct(
      cityName: cityName,
      code: code,
      id: id,
      state: state,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CityListStruct? updateCityListStruct(
  CityListStruct? cityList, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cityList
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCityListStructData(
  Map<String, dynamic> firestoreData,
  CityListStruct? cityList,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cityList == null) {
    return;
  }
  if (cityList.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cityList.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cityListData = getCityListFirestoreData(cityList, forFieldValue);
  final nestedData = cityListData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cityList.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCityListFirestoreData(
  CityListStruct? cityList, [
  bool forFieldValue = false,
]) {
  if (cityList == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cityList.toMap());

  // Add any Firestore field values
  cityList.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCityListListFirestoreData(
  List<CityListStruct>? cityLists,
) =>
    cityLists?.map((e) => getCityListFirestoreData(e, true)).toList() ?? [];
