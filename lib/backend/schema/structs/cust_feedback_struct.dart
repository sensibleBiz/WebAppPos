// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CustFeedbackStruct extends FFFirebaseStruct {
  CustFeedbackStruct({
    String? question,
    String? answer,
    int? rating,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _question = question,
        _answer = answer,
        _rating = rating,
        super(firestoreUtilData);

  // "question" field.
  String? _question;
  String get question => _question ?? '';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "answer" field.
  String? _answer;
  String get answer => _answer ?? '';
  set answer(String? val) => _answer = val;

  bool hasAnswer() => _answer != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  set rating(int? val) => _rating = val;

  void incrementRating(int amount) => rating = rating + amount;

  bool hasRating() => _rating != null;

  static CustFeedbackStruct fromMap(Map<String, dynamic> data) =>
      CustFeedbackStruct(
        question: data['question'] as String?,
        answer: data['answer'] as String?,
        rating: castToType<int>(data['rating']),
      );

  static CustFeedbackStruct? maybeFromMap(dynamic data) => data is Map
      ? CustFeedbackStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'question': _question,
        'answer': _answer,
        'rating': _rating,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'question': serializeParam(
          _question,
          ParamType.String,
        ),
        'answer': serializeParam(
          _answer,
          ParamType.String,
        ),
        'rating': serializeParam(
          _rating,
          ParamType.int,
        ),
      }.withoutNulls;

  static CustFeedbackStruct fromSerializableMap(Map<String, dynamic> data) =>
      CustFeedbackStruct(
        question: deserializeParam(
          data['question'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam(
          data['answer'],
          ParamType.String,
          false,
        ),
        rating: deserializeParam(
          data['rating'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CustFeedbackStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CustFeedbackStruct &&
        question == other.question &&
        answer == other.answer &&
        rating == other.rating;
  }

  @override
  int get hashCode => const ListEquality().hash([question, answer, rating]);
}

CustFeedbackStruct createCustFeedbackStruct({
  String? question,
  String? answer,
  int? rating,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CustFeedbackStruct(
      question: question,
      answer: answer,
      rating: rating,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CustFeedbackStruct? updateCustFeedbackStruct(
  CustFeedbackStruct? custFeedback, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    custFeedback
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCustFeedbackStructData(
  Map<String, dynamic> firestoreData,
  CustFeedbackStruct? custFeedback,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (custFeedback == null) {
    return;
  }
  if (custFeedback.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && custFeedback.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final custFeedbackData =
      getCustFeedbackFirestoreData(custFeedback, forFieldValue);
  final nestedData =
      custFeedbackData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = custFeedback.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCustFeedbackFirestoreData(
  CustFeedbackStruct? custFeedback, [
  bool forFieldValue = false,
]) {
  if (custFeedback == null) {
    return {};
  }
  final firestoreData = mapToFirestore(custFeedback.toMap());

  // Add any Firestore field values
  custFeedback.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCustFeedbackListFirestoreData(
  List<CustFeedbackStruct>? custFeedbacks,
) =>
    custFeedbacks?.map((e) => getCustFeedbackFirestoreData(e, true)).toList() ??
    [];
