import '/backend/backend.dart';
import '/deye_c_r_m/deye_activity_update/deye_activity_update_widget.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/deye_c_r_m/deye_no_data/deye_no_data_widget.dart';
import '/deye_c_r_m/deye_update_stage_dropdown/deye_update_stage_dropdown_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/assign_ticket/assign_ticket_widget.dart';
import '/pages/components/call_details/call_details_widget.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import '/pages/components/dis_qualify_lead/dis_qualify_lead_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/flutter_flow/request_manager.dart';

import '/index.dart';
import 'deye_dashboard_copy_widget.dart' show DeyeDashboardCopyWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeDashboardCopyModel extends FlutterFlowModel<DeyeDashboardCopyWidget> {
  ///  Local state fields for this page.

  bool showMore = false;

  bool showNewTab = true;

  String selectedStage = 'Unread';

  bool isSearched = false;

  bool clearQuery = false;

  ///  State fields for stateful widgets in this page.

  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;
  // State field(s) for DropDownAssigned widget.
  String? dropDownAssignedValue;
  FormFieldController<String>? dropDownAssignedValueController;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Text widget.
  String? stage1;
  // Model for DeyeMenu component.
  late DeyeMenuModel deyeMenuModel;

  /// Query cache managers for this widget.

  final _leadStagesManager = StreamRequestManager<List<LeadStagesRecord>>();
  Stream<List<LeadStagesRecord>> leadStages({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<LeadStagesRecord>> Function() requestFn,
  }) =>
      _leadStagesManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLeadStagesCache() => _leadStagesManager.clear();
  void clearLeadStagesCacheKey(String? uniqueKey) =>
      _leadStagesManager.clearRequest(uniqueKey);

  final _leadMangManager = StreamRequestManager<List<LeadsManagementRecord>>();
  Stream<List<LeadsManagementRecord>> leadMang({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<LeadsManagementRecord>> Function() requestFn,
  }) =>
      _leadMangManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearLeadMangCache() => _leadMangManager.clear();
  void clearLeadMangCacheKey(String? uniqueKey) =>
      _leadMangManager.clearRequest(uniqueKey);

  final _newLeadManager = StreamRequestManager<List<OutletLeadsRecord>>();
  Stream<List<OutletLeadsRecord>> newLead({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<OutletLeadsRecord>> Function() requestFn,
  }) =>
      _newLeadManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearNewLeadCache() => _newLeadManager.clear();
  void clearNewLeadCacheKey(String? uniqueKey) =>
      _newLeadManager.clearRequest(uniqueKey);

  @override
  void initState(BuildContext context) {
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
    deyeMenuModel = createModel(context, () => DeyeMenuModel());
  }

  @override
  void dispose() {
    deyeHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    deyeMenuModel.dispose();

    /// Dispose query cache managers for this widget.

    clearLeadStagesCache();

    clearLeadMangCache();

    clearNewLeadCache();
  }
}
