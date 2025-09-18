// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<CustFeedbackStruct>> updateFeedbackList(
  List<CustFeedbackStruct>? feedbakList,
  CustFeedbackStruct newFeedback,
) async {
  // Create a new list, copying existing or empty
  List<CustFeedbackStruct> rfeedbakList =
      feedbakList != null ? List<CustFeedbackStruct>.from(feedbakList) : [];

  // Check for existing feedback with same question
  int index = rfeedbakList.indexWhere(
    (element) => element.question == newFeedback.question,
  );

  if (index == -1) {
    rfeedbakList.add(newFeedback);
  } else {
    // Replace the item to keep it immutable
    rfeedbakList[index] = CustFeedbackStruct(
      question: newFeedback.question,
      answer: newFeedback.answer,
      rating: newFeedback.rating,
    );
  }

  print(rfeedbakList);
  return rfeedbakList;
}
