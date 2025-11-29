import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'uploadfileget_link_widget.dart' show UploadfilegetLinkWidget;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UploadfilegetLinkModel extends FlutterFlowModel<UploadfilegetLinkWidget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading_uploadData48g = false;
  FFUploadedFile uploadedLocalFile_uploadData48g =
      FFUploadedFile(bytes: Uint8List.fromList([]), originalFilename: '');
  String uploadedFileUrl_uploadData48g = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
