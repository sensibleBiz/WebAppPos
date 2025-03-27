import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/add_lead_stage/add_lead_stage_widget.dart';
import '/pages/components/c_header/c_header_widget.dart';
import '/pages/components/cstm_side_nav_bar/cstm_side_nav_bar_widget.dart';
import '/pages/components/lead_stage_update/lead_stage_update_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'lead_stages_master_new_widget.dart' show LeadStagesMasterNewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class LeadStagesMasterNewModel
    extends FlutterFlowModel<LeadStagesMasterNewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CstmSideNavBar component.
  late CstmSideNavBarModel cstmSideNavBarModel;
  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // Stores action output result for [Custom Action - generateLeadStages] action in Button widget.
  int? len;
  // State field(s) for Checkbox widget.
  Map<LeadStagesRecord, bool> checkboxValueMap = {};
  List<LeadStagesRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

  @override
  void initState(BuildContext context) {
    cstmSideNavBarModel = createModel(context, () => CstmSideNavBarModel());
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    cstmSideNavBarModel.dispose();
    cHeaderModel.dispose();
  }
}
