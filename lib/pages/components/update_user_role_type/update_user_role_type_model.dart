import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'update_user_role_type_widget.dart' show UpdateUserRoleTypeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UpdateUserRoleTypeModel
    extends FlutterFlowModel<UpdateUserRoleTypeWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextUserRollTypeName widget.
  FocusNode? textUserRollTypeNameFocusNode;
  TextEditingController? textUserRollTypeNameTextController;
  String? Function(BuildContext, String?)?
      textUserRollTypeNameTextControllerValidator;
  String? _textUserRollTypeNameTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[A-Z]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  // State field(s) for TextUserRollCode widget.
  FocusNode? textUserRollCodeFocusNode;
  TextEditingController? textUserRollCodeTextController;
  String? Function(BuildContext, String?)?
      textUserRollCodeTextControllerValidator;
  String? _textUserRollCodeTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (!RegExp('[0-9]').hasMatch(val)) {
      return 'Invalid text';
    }
    return null;
  }

  @override
  void initState(BuildContext context) {
    textUserRollTypeNameTextControllerValidator =
        _textUserRollTypeNameTextControllerValidator;
    textUserRollCodeTextControllerValidator =
        _textUserRollCodeTextControllerValidator;
  }

  @override
  void dispose() {
    textUserRollTypeNameFocusNode?.dispose();
    textUserRollTypeNameTextController?.dispose();

    textUserRollCodeFocusNode?.dispose();
    textUserRollCodeTextController?.dispose();
  }
}
