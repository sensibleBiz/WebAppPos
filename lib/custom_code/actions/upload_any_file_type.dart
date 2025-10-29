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

import '../../backend/firebase_storage/storage.dart';
import '../../flutter_flow/flutter_flow_widgets.dart';
import '../../flutter_flow/upload_data.dart';

Future uploadAnyFileType(BuildContext context, String? fileType) async {
  // Add your function code here!
  // fileType = fileType ?? 'pdf';

  // final selectedFile = await selectFile(allowedExtensions: [fileType]);
  // if (selectedFile != null) {
  //   showUploadMessage(
  //     context,
  //     'Uploading file...',
  //     showLoading: true,
  //   );
  //   final downloadUrl =
  //       await uploadData(selectedFile.storagePath, selectedFile.bytes);
  //   ScaffoldMessenger.of(context).hideCurrentSnackBar();
  //   if (downloadUrl != null) {
  //     FFAppState().update(() {
  //       FFAppState().filePath = downloadUrl;
  //     });
  //     showUploadMessage(
  //       context,
  //       'Success!',
  //     );
  //   } else {
  //     showUploadMessage(context, 'Failed to upload file');
  //     return;
  //   }
  // }
}
