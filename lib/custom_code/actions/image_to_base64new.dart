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

import 'dart:convert';

String? imageToBase64new(FFUploadedFile? file) {
  /// MODIFY CODE ONLY BELOW THIS LINE

  if (file == null || file.bytes == null) {
    return null;
  }

  String base64String = base64Encode(file.bytes!);

  return 'data:image/jpeg;base64,$base64String';

  /// MODIFY CODE ONLY ABOVE THIS LINE
}
