import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popup_loading_widget.dart';
import '/components/popup_success_copy_widget.dart';
import '/components/popup_warning_widget.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:math';
import 'dart:ui';
import 'deye_new_complaint_edit_widget.dart' show DeyeNewComplaintEditWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeNewComplaintEditModel
    extends FlutterFlowModel<DeyeNewComplaintEditWidget> {
  ///  Local state fields for this page.

  OutletLeadsRecord? complaintDoc;

  bool showMore = false;

  ///  State fields for stateful widgets in this page.

  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDownState widget.
  String? dropDownStateValue;
  FormFieldController<String>? dropDownStateValueController;
  // State field(s) for DropDownCity widget.
  String? dropDownCityValue;
  FormFieldController<String>? dropDownCityValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode4;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for requirement widget.
  FocusNode? requirementFocusNode;
  TextEditingController? requirementTextController;
  String? Function(BuildContext, String?)? requirementTextControllerValidator;
  // State field(s) for DropDownProductName widget.
  String? dropDownProductNameValue;
  FormFieldController<String>? dropDownProductNameValueController;
  // State field(s) for DropDownProductionCapacity widget.
  String? dropDownProductionCapacityValue;
  FormFieldController<String>? dropDownProductionCapacityValueController;
  // State field(s) for Purchasefrom widget.
  FocusNode? purchasefromFocusNode;
  TextEditingController? purchasefromTextController;
  String? Function(BuildContext, String?)? purchasefromTextControllerValidator;
  // State field(s) for SerialNumber widget.
  FocusNode? serialNumberFocusNode;
  TextEditingController? serialNumberTextController;
  String? Function(BuildContext, String?)? serialNumberTextControllerValidator;
  // State field(s) for DropDownStage widget.
  String? dropDownStageValue;
  FormFieldController<String>? dropDownStageValueController;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? result;
  // Model for DeyeMenu component.
  late DeyeMenuModel deyeMenuModel;

  @override
  void initState(BuildContext context) {
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
    deyeMenuModel = createModel(context, () => DeyeMenuModel());
  }

  @override
  void dispose() {
    deyeHeaderModel.dispose();
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();

    textFieldFocusNode3?.dispose();
    textController3?.dispose();

    textFieldFocusNode4?.dispose();
    textController4?.dispose();

    requirementFocusNode?.dispose();
    requirementTextController?.dispose();

    purchasefromFocusNode?.dispose();
    purchasefromTextController?.dispose();

    serialNumberFocusNode?.dispose();
    serialNumberTextController?.dispose();

    deyeMenuModel.dispose();
  }
}
