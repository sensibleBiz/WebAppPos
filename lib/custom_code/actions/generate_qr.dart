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

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_auth/firebase_auth.dart';

Future generateQr() async {
  // Add your function code here!
  print("inside generate");
  final push = WebPush();
  final token = await push.getToken();
  print(token);

  FirebaseMessaging.onMessage.listen((event) async {
    //_load(); // change any UI loading state
    final auth = FirebaseAuth.instance;
    final token = event.data['token'];
    print("web token");
    print(token);
    final login = await auth.signInWithCustomToken(token); // MAGIC!
    if (login.user != null) {
      print(login);
      // return token;
    }

    //_load(); // change any UI loading state
  });
  FFAppState().qrToken = token.toString();
}

class WebPush {
  Future<String?> getToken() async {
    String? token = '';
    print("web Push");
    final messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      token = await FirebaseMessaging.instance.getToken();
      print(token);
    }
    return token;
  }
}
