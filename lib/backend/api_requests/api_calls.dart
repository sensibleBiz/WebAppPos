import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetTokenFromCFCall {
  static Future<ApiCallResponse> call({
    String? uid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'getTokenFromCF',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/firebaseLoginAuto',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'uid': uid,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendWhatsappCall {
  static Future<ApiCallResponse> call({
    String? recipientNumber = '',
    String? text = '',
  }) async {
    final ffApiRequestBody = '''
{
  "recipient_number": "${recipientNumber}",
  "text": "${text}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendWhatsapp',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/msg91Whatsapp/send_msg_whatsapp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendImageCall {
  static Future<ApiCallResponse> call({
    String? userMobileNumber = '',
    String? imageUrl = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userMobileNumber": "${userMobileNumber}",
  "imageUrl": "${imageUrl}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendImage',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/msg91Whatsapp/send_image_whatsapp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendVideoCall {
  static Future<ApiCallResponse> call({
    String? userMobileNumber = '',
    String? link = '',
  }) async {
    final ffApiRequestBody = '''
{
  "userMobileNumber": "${userMobileNumber}",
  "link": "${link}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendVideo',
      apiUrl:
          'https://asia-south1-sensiblebizpro.cloudfunctions.net/msg91Whatsapp/send_video_whatsapp',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class SendMailCall {
  static Future<ApiCallResponse> call({
    String? outletName = '',
    String? file = '',
    String? fileName = '',
    String? toEmail = '',
    String? branchName = '',
    String? username = '',
    String? mobileNo = '',
    String? roll = '',
    String? reportType = '',
  }) async {
    final ffApiRequestBody = '''
{   
  "outletName": "${escapeStringForJson(outletName)}",
  "branchName": "${escapeStringForJson(branchName)}",
  "userName": "${escapeStringForJson(username)}",
  "userMobileNumber": "${escapeStringForJson(mobileNo)}",
  "userRoll": "${escapeStringForJson(roll)}",
  "reportType":"${escapeStringForJson(reportType)}",
  "file": "${escapeStringForJson(file)}",
  "fileName": "${escapeStringForJson(fileName)}",
  "toEmail": "${escapeStringForJson(toEmail)}",
  "ccEmail": "rohit.sensibleconnect@gmail.com"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'sendMail',
      apiUrl:
          'https://asia-south1-sconnect-pos.cloudfunctions.net/msg91Mail/send_mail',
      callType: ApiCallType.POST,
      headers: {
        'Access-Control-Allow-Origin':
            'https://ff-debug-service-frontend-pro-ygxkweukma-uc.a.run.app',
        'Access-Control-Allow-Headers': 'Content-Type',
        'Access-Control-Allow-Methods': 'POST',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}
