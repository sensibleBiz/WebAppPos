import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/add_new_demo/add_new_demo_widget.dart';
import '/pages/components/add_tag/add_tag_widget.dart';
import '/pages/components/admin_header/admin_header_widget.dart';
import '/pages/components/call_details/call_details_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/schedule/schedule_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'lead_log_widget.dart' show LeadLogWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadLogModel extends FlutterFlowModel<LeadLogWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for adminHeader component.
  late AdminHeaderModel adminHeaderModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextFielduname widget.
  FocusNode? textFieldunameFocusNode;
  TextEditingController? textFieldunameTextController;
  String? Function(BuildContext, String?)?
      textFieldunameTextControllerValidator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // State field(s) for DropDownState widget.
  String? dropDownStateValue;
  FormFieldController<String>? dropDownStateValueController;
  // State field(s) for DropDownCity widget.
  String? dropDownCityValue;
  FormFieldController<String>? dropDownCityValueController;
  // State field(s) for DropDownSource widget.
  String? dropDownSourceValue;
  FormFieldController<String>? dropDownSourceValueController;
  // State field(s) for DropDownPriority widget.
  String? dropDownPriorityValue;
  FormFieldController<String>? dropDownPriorityValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController3;
  String? Function(BuildContext, String?)? textController3Validator;
  // State field(s) for DropDownBType widget.
  String? dropDownBTypeValue;
  FormFieldController<String>? dropDownBTypeValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode3;
  TextEditingController? textController4;
  String? Function(BuildContext, String?)? textController4Validator;
  // State field(s) for TextFieldtag widget.
  final textFieldtagKey = GlobalKey();
  FocusNode? textFieldtagFocusNode;
  TextEditingController? textFieldtagTextController;
  String? textFieldtagSelectedOption;
  String? Function(BuildContext, String?)? textFieldtagTextControllerValidator;
  List<LeadTagRecord> simpleSearchResults = [];
  // Stores action output result for [Custom Action - generateTagCode] action in Button widget.
  int? tag;
  // Stores action output result for [Custom Action - removeDuplicateTagList] action in Container widget.
  dynamic? resTag1;
  // Stores action output result for [Custom Action - removeDuplicateTagList] action in Container widget.
  dynamic? resTag;
  // State field(s) for Checkboxduplicate widget.
  bool? checkboxduplicateValue;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Custom Action - leadTagLIst] action in Button widget.
  List<LeadTagListStruct>? taglist;

  @override
  void initState(BuildContext context) {
    adminHeaderModel = createModel(context, () => AdminHeaderModel());
  }

  @override
  void dispose() {
    adminHeaderModel.dispose();
    tabBarController?.dispose();
    textFieldunameFocusNode?.dispose();
    textFieldunameTextController?.dispose();

    textFieldFocusNode1?.dispose();
    textController2?.dispose();

    textFieldFocusNode2?.dispose();
    textController3?.dispose();

    textFieldFocusNode3?.dispose();
    textController4?.dispose();

    textFieldtagFocusNode?.dispose();
  }
}
