import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/deye_c_r_m/lead_activity_update/lead_activity_update_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
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
import '/pages/components/dis_qualify_lead_copy/dis_qualify_lead_copy_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/message_box/message_box_widget.dart';
import '/pages/components/schedule/schedule_widget.dart';
import '/pages/components/update_stage_dropdown_new/update_stage_dropdown_new_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'leads_dashboard_new_widget.dart' show LeadsDashboardNewWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadsDashboardNewModel extends FlutterFlowModel<LeadsDashboardNewWidget> {
  ///  Local state fields for this page.

  bool showMore = false;

  bool showNewTab = false;

  bool isSearched = false;

  ///  State fields for stateful widgets in this page.

  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for DropDownAssignedTo widget.
  String? dropDownAssignedToValue;
  FormFieldController<String>? dropDownAssignedToValueController;
  // State field(s) for DropDownRemarks widget.
  String? dropDownRemarksValue;
  FormFieldController<String>? dropDownRemarksValueController;
  // State field(s) for DropDownSource widget.
  String? dropDownSourceValue;
  FormFieldController<String>? dropDownSourceValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UserProfileRecord? user;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Text widget.
  String? stage;

  @override
  void initState(BuildContext context) {
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    cHeaderModel.dispose();
    expandableExpandableController1.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
