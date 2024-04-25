import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_header_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import 'dealer_dasboard_widget.dart' show DealerDasboardWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DealerDasboardModel extends FlutterFlowModel<DealerDasboardWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in DealerDasboard widget.
  List<DealersRecord>? dealerList;
  // Stores action output result for [Firestore Query - Query a collection] action in DealerDasboard widget.
  List<LeadsManagementRecord>? leadList;
  // Model for adminHeader component.
  late AdminHeaderModel adminHeaderModel;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // Stores action output result for [Firestore Query - Query a collection] action in DropDown widget.
  List<LeadsManagementRecord>? resAssignedTo;
  // Stores action output result for [Custom Action - leadDocToLeadJson] action in DropDown widget.
  List<dynamic>? allLeadSearchRes;

  @override
  void initState(BuildContext context) {
    adminHeaderModel = createModel(context, () => AdminHeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    adminHeaderModel.dispose();
  }
}
