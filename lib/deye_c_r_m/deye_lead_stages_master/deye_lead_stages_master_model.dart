import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/add_lead_stage/add_lead_stage_widget.dart';
import '/pages/components/lead_stage_update/lead_stage_update_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import 'deye_lead_stages_master_widget.dart' show DeyeLeadStagesMasterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeLeadStagesMasterModel
    extends FlutterFlowModel<DeyeLeadStagesMasterWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;
  // Stores action output result for [Custom Action - generateLeadStages] action in Button widget.
  int? len;
  // State field(s) for Checkbox widget.
  Map<LeadStagesRecord, bool> checkboxValueMap = {};
  List<LeadStagesRecord> get checkboxCheckedItems =>
      checkboxValueMap.entries.where((e) => e.value).map((e) => e.key).toList();

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
    deyeMenuModel.dispose();
  }
}
