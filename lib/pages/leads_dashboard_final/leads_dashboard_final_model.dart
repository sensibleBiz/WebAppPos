import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/assign_lead_dealer/assign_lead_dealer_widget.dart';
import '/pages/components/c_header/c_header_widget.dart';
import '/pages/components/call_details/call_details_widget.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import '/pages/components/dis_qualify_lead/dis_qualify_lead_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/message_box/message_box_widget.dart';
import '/pages/components/schedule/schedule_widget.dart';
import '/pages/components/test_dropdown/test_dropdown_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'leads_dashboard_final_widget.dart' show LeadsDashboardFinalWidget;
import 'package:styled_divider/styled_divider.dart';
import 'package:auto_size_text/auto_size_text.dart';
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

  // Stores action output result for [Custom Action - leadDocRefCopy] action in LeadsDashboardFinal widget.
  List<dynamic>? leadDetailsCopy1;
  // Stores action output result for [Custom Action - leadDocRefCopy] action in LeadsDashboardFinal widget.
  List<dynamic>? leadDetailsCopy2;
  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // Stores action output result for [Custom Action - leadDocRefCopy] action in Container widget.
  List<dynamic>? res333;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  // Stores action output result for [Custom Action - leadDocRefCopy] action in Container widget.
  List<dynamic>? res2;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController3;

  // Stores action output result for [Custom Action - leadDocRefCopy] action in Container widget.
  List<dynamic>? res5;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController4;

  // Stores action output result for [Custom Action - leadDocRefCopy] action in Container widget.
  List<dynamic>? resLost;
  // State field(s) for DropDownAssignedTo widget.
  String? dropDownAssignedToValue;
  FormFieldController<String>? dropDownAssignedToValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDownAssignedTo widget.
  List<LeadsManagementRecord>? resAssignedTo;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownAssignedTo widget.
  List<dynamic>? allLeadSearchRess1;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownAssignedTo widget.
  List<dynamic>? allLeadSearchRess2;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownAssignedTo widget.
  List<dynamic>? allLeadSearchRess3;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownAssignedTo widget.
  List<dynamic>? allLeadSearchRes4;
  // State field(s) for DropDownSource widget.
  String? dropDownSourceValue;
  FormFieldController<String>? dropDownSourceValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDownSource widget.
  List<LeadsManagementRecord>? resSourc2;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownSource widget.
  List<dynamic>? allLeadSearchRess5;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownSource widget.
  List<dynamic>? allLeadSearchRess6;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownSource widget.
  List<dynamic>? allLeadSearchRess7;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownSource widget.
  List<dynamic>? allLeadSearchRess8;
  // State field(s) for DropDownStatusS widget.
  String? dropDownStatusSValue;
  FormFieldController<String>? dropDownStatusSValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDownStatusS widget.
  List<LeadsManagementRecord>? resSource3;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownStatusS widget.
  List<dynamic>? allLeadSearch11;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownStatusS widget.
  List<dynamic>? allLeadSearch12;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownStatusS widget.
  List<dynamic>? allLeadSearchRess13;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDownStatusS widget.
  List<dynamic>? allLeadSearchRess14;
  // State field(s) for TextFieldCity widget.
  FocusNode? textFieldCityFocusNode;
  TextEditingController? textFieldCityTextController;
  String? Function(BuildContext, String?)? textFieldCityTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextFieldCity widget.
  List<LeadsManagementRecord>? resCity;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in TextFieldCity widget.
  List<dynamic>? allLeadSearchRes2;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<LeadsManagementRecord>? resCity13;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in Icon widget.
  List<dynamic>? allLeadSearchRes13;
  // State field(s) for TextFieldMobile widget.
  FocusNode? textFieldMobileFocusNode;
  TextEditingController? textFieldMobileTextController;
  String? Function(BuildContext, String?)?
      textFieldMobileTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in TextFieldMobile widget.
  List<LeadsManagementRecord>? res1;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in TextFieldMobile widget.
  List<dynamic>? allLeadSearchRes1;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<LeadsManagementRecord>? res12;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in Icon widget.
  List<dynamic>? allLeadSearchRes12;

  @override
  void initState(BuildContext context) {
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    cHeaderModel.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
    expandableExpandableController3.dispose();
    expandableExpandableController4.dispose();
    textFieldCityFocusNode?.dispose();
    textFieldCityTextController?.dispose();

    textFieldMobileFocusNode?.dispose();
    textFieldMobileTextController?.dispose();
  }
}
