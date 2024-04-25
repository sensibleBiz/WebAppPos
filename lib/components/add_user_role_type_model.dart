import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_user_role_type_widget.dart' show AddUserRoleTypeWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddUserRoleTypeModel extends FlutterFlowModel<AddUserRoleTypeWidget> {
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

  // State field(s) for TextUserRollTypeCode widget.
  FocusNode? textUserRollTypeCodeFocusNode;
  TextEditingController? textUserRollTypeCodeTextController;
  String? Function(BuildContext, String?)?
      textUserRollTypeCodeTextControllerValidator;
  String? _textUserRollTypeCodeTextControllerValidator(
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
  UserRoleTypeRecord? doc;

  @override
  void initState(BuildContext context) {
    textUserRollTypeNameTextControllerValidator =
        _textUserRollTypeNameTextControllerValidator;
    textUserRollTypeCodeTextControllerValidator =
        _textUserRollTypeCodeTextControllerValidator;
  }

  @override
  void dispose() {
    textUserRollTypeNameFocusNode?.dispose();
    textUserRollTypeNameTextController?.dispose();

    textUserRollTypeCodeFocusNode?.dispose();
    textUserRollTypeCodeTextController?.dispose();
  }
}
