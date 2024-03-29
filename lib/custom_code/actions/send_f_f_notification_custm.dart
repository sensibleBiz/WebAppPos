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

import 'package:http/http.dart' as http;

Future sendFFNotificationCustm(
  String customToken,
  String qrToken,
) async {
  String token = qrToken;

  final push = PushNotifications();

  push.send(deviceToken: token, token: customToken);
}

class PushNotifications {
  Future<bool> send({
    String title = 'QrToLogin',
    String? deviceToken,
    String? token,
  }) async {
    const String url = 'https://fcm.googleapis.com/fcm/send';

    final Map<String, dynamic> data = {
      'notification': {
        'title': title,
      },
      'priority': 'high',
      'data': {
        'status': 'done',
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'token': token
      },
      'to': '$deviceToken',
      'message': {'token': '$deviceToken'}
    };
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          "AAAAXV7M8pI:APA91bEyJB4trjvc2TrcppVQTglJAqu5lk4e2cjEugtvq6wgDqm1QWLOxLnSBq3ykA6QWcsT1Joa4N7bm6yoBDO9sSQ8mF3v3hN26ZsJhII4F9YPaWgqW4StEdKFZcCx7T0Qdcr5xhRP",
    };

    final result = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      // encoding: Encoding.getByName('utf-8'),
      headers: headers,
    );

    return result.statusCode == 200;
  }

  Future<bool> sendToTopic(
    String id, {
    String topic = 'all',
    String title = 'QrToLogin',
    String token = '',
  }) async {
    const String url = 'https://fcm.googleapis.com/fcm/send';

    final Map<String, dynamic> data = {
      'notification': {
        'title': title,
      },
      'priority': 'high',
      'data': {
        'id': id,
        'status': 'done',
        'click_action': 'FLUTTER_NOTIFICATION_CLICK',
        'token': token,
      },
      'topic': topic,
    };

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization':
          "AAAAXV7M8pI:APA91bEyJB4trjvc2TrcppVQTglJAqu5lk4e2cjEugtvq6wgDqm1QWLOxLnSBq3ykA6QWcsT1Joa4N7bm6yoBDO9sSQ8mF3v3hN26ZsJhII4F9YPaWgqW4StEdKFZcCx7T0Qdcr5xhRP"
    };

    final result = await http.post(
      Uri.parse(url),
      body: jsonEncode(data),
      //encoding: Encoding.getByName('utf-8'),
      headers: headers,
    );
    print(result);
    return result.statusCode == 200;
  }
}
