import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/assign_lead_widget.dart';
import '/components/c_header_widget.dart';
import '/components/call_details_widget.dart';
import '/components/dis_qualify_lead_widget.dart';
import '/components/list_view_msg_widget.dart';
import '/components/message_box_widget.dart';
import '/components/schedule_widget.dart';
import '/components/test_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'leads_dashboard_final_widget.dart' show LeadsDashboardFinalWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadsDashboardFinalModel
    extends FlutterFlowModel<LeadsDashboardFinalWidget> {
  ///  Local state fields for this page.

  bool showMore = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - leadDocRefCopy] action in LeadsDashboardFinal widget.
  List<dynamic>? leadDetailsCopy1;
  // Stores action output result for [Custom Action - leadDocRefCopy] action in LeadsDashboardFinal widget.
  List<dynamic>? leadDetailsCopy2;
  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController1;

  // Stores action output result for [Custom Action - leadDocRefCopy] action in Container widget.
  List<dynamic>? res333;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController2;

  // Stores action output result for [Custom Action - leadDocRefCopy] action in Container widget.
  List<dynamic>? res2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController3;

  // Stores action output result for [Custom Action - leadDocRefCopy] action in Container widget.
  List<dynamic>? res5;
  // State field(s) for Expandable widget.
  late ExpandableController expandableController4;

  // Stores action output result for [Custom Action - leadDocRefCopy] action in Container widget.
  List<dynamic>? resLost;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<LeadsManagementRecord>? resAssignedTo;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDown widget.
  List<dynamic>? allLeadSearchRes;
  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode;
  TextEditingController? textFieldMobileController;
  String? Function(BuildContext, String?)? textFieldMobileControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextFieldMobile widget.
  List<LeadsManagementRecord>? res1;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in TextFieldMobile widget.
  List<dynamic>? allLeadSearchRes1;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<LeadsManagementRecord>? res12;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in Icon widget.
  List<dynamic>? allLeadSearchRes12;
  // State field(s) for TextFieldCity widget.
  FocusNode? textFieldCityFocusNode;
  TextEditingController? textFieldCityController;
  String? Function(BuildContext, String?)? textFieldCityControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextFieldCity widget.
  List<LeadsManagementRecord>? resCity;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in TextFieldCity widget.
  List<dynamic>? allLeadSearchRes2;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<LeadsManagementRecord>? resCity13;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in Icon widget.
  List<dynamic>? allLeadSearchRes13;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<LeadsManagementRecord>? resSourceCopy;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDown widget.
  List<dynamic>? allLeadSearchRes3Copy;

  @override
  void initState(BuildContext context) {
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cHeaderModel.dispose();
    expandableController1.dispose();
    expandableController2.dispose();
    expandableController3.dispose();
    expandableController4.dispose();
    textFieldMobileFocusNode?.dispose();
    textFieldMobileController?.dispose();

    textFieldCityFocusNode?.dispose();
    textFieldCityController?.dispose();
  }
}
