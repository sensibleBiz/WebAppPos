import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_service_point_master_widget.dart' show AddServicePointMasterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddServicePointMasterModel
    extends FlutterFlowModel<AddServicePointMasterWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextServicePointMasterName widget.
  FocusNode? textServicePointMasterNameFocusNode;
  TextEditingController? textServicePointMasterNameController;
  String? Function(BuildContext, String?)?
      textServicePointMasterNameControllerValidator;
  String? _textServicePointMasterNameControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[a-zA-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextServicePointMasterCode widget.
  FocusNode? textServicePointMasterCodeFocusNode;
  TextEditingController? textServicePointMasterCodeController;
  String? Function(BuildContext, String?)?
      textServicePointMasterCodeControllerValidator;
  String? _textServicePointMasterCodeControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // Stores action output result for [Backend Call - Create Document] action in Container widget.
  ServicePointRecord? doc;

  @override
  void initState(BuildContext context) {
    textServicePointMasterNameControllerValidator =
        _textServicePointMasterNameControllerValidator;
    textServicePointMasterCodeControllerValidator =
        _textServicePointMasterCodeControllerValidator;
  }

  @override
  void dispose() {
    textServicePointMasterNameFocusNode?.dispose();
    textServicePointMasterNameController?.dispose();

    textServicePointMasterCodeFocusNode?.dispose();
    textServicePointMasterCodeController?.dispose();
  }
}
