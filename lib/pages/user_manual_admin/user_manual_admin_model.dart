import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/header_component/header_component_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'user_manual_admin_widget.dart' show UserManualAdminWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class UserManualAdminModel extends FlutterFlowModel<UserManualAdminWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  UserProfileRecord? getEmail;
  // State field(s) for headlineDropDown widget.
  String? headlineDropDownValue;
  FormFieldController<String>? headlineDropDownValueController;
  // State field(s) for TextFieldTopic widget.
  FocusNode? textFieldTopicFocusNode;
  TextEditingController? textFieldTopicTextController;
  String? Function(BuildContext, String?)?
      textFieldTopicTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for imgList widget.
  FocusNode? imgListFocusNode;
  TextEditingController? imgListTextController;
  String? Function(BuildContext, String?)? imgListTextControllerValidator;
  // State field(s) for TextFieldSteps widget.
  FocusNode? textFieldStepsFocusNode;
  TextEditingController? textFieldStepsTextController;
  String? Function(BuildContext, String?)?
      textFieldStepsTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController7;
  String? Function(BuildContext, String?)? textController7Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode5;
  TextEditingController? textController8;
  String? Function(BuildContext, String?)? textController8Validator;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  SubHeaderRecord? ref;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldTopicFocusNode?.dispose();
    textFieldTopicTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    imgListFocusNode?.dispose();
    imgListTextController?.dispose();

    textFieldStepsFocusNode?.dispose();
    textFieldStepsTextController?.dispose();

    textFieldFocusNode4?.dispose();
    textController7?.dispose();

    textFieldFocusNode5?.dispose();
    textController8?.dispose();
  }
}
