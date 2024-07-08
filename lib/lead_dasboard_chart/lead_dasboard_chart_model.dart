import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/c_header_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'lead_dasboard_chart_widget.dart' show LeadDasboardChartWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadDasboardChartModel extends FlutterFlowModel<LeadDasboardChartWidget> {
  ///  Local state fields for this page.

  String filter = 'today';

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in LeadDasboardChart widget.
  List<UserProfileRecord>? userList;
  // Stores action output result for [Firestore Query - Query a collection] action in LeadDasboardChart widget.
  List<LeadsManagementRecord>? leadList;
  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // State field(s) for DropDownUser widget.
  String? dropDownUserValue;
  FormFieldController<String>? dropDownUserValueController;

  @override
  void initState(BuildContext context) {
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cHeaderModel.dispose();
  }
}
