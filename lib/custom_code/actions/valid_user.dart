// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<bool> validUser(String email) async {
  // Add your function code here!
  return FirebaseFirestore.instance
      .collection('USER_PROFILE')
      .where('email', isEqualTo: email)
      .get()
      .then((snapshot) {
    if (snapshot.docs.isNotEmpty) {
      print('Document data: ${snapshot.docs}');
      List<dynamic> lst = [];

      lst.add(snapshot.docs.first.data());
      FFAppState().loggedInUser.add({
        "ref": snapshot.docs.first.reference,
        "password": snapshot.docs.first.data()['password'],
        "role": snapshot.docs.first.data()['role'],
        "outlets": snapshot.docs.first.data()["outlets"]
      });
      print("loggedInUser");
      print(FFAppState().loggedInUser);
      return true;
    } else {
      FFAppState().loggedInUser.clear();
      print('Document does not exist on the database');
      return false;
    }
  });
}
