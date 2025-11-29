import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/deye_leave_remark_widget.dart';
import '/components/deye_subscription_popup_widget.dart';
import '/components/popup_success_copy_widget.dart';
import '/components/popup_warning_widget.dart';
import '/deye_c_r_m/deye_header_h_r/deye_header_h_r_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/deye_c_r_m/deye_no_data/deye_no_data_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'deye_leave_admin_widget.dart' show DeyeLeaveAdminWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeLeaveAdminModel extends FlutterFlowModel<DeyeLeaveAdminWidget> {
  ///  Local state fields for this page.

  String? attendanceDayId;

  DateTime? selectedDate;

  List<String> selectedUserZoneList = [];
  void addToSelectedUserZoneList(String item) => selectedUserZoneList.add(item);
  void removeFromSelectedUserZoneList(String item) =>
      selectedUserZoneList.remove(item);
  void removeAtIndexFromSelectedUserZoneList(int index) =>
      selectedUserZoneList.removeAt(index);
  void insertAtIndexInSelectedUserZoneList(int index, String item) =>
      selectedUserZoneList.insert(index, item);
  void updateSelectedUserZoneListAtIndex(
          int index, Function(String) updateFn) =>
      selectedUserZoneList[index] = updateFn(selectedUserZoneList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in DeyeLeaveAdmin widget.
  ModuleSubscriptionRecord? moduleDoc;
  // Model for DeyeHeaderHR component.
  late DeyeHeaderHRModel deyeHeaderHRModel;
  DateTime? datePicked;
  // State field(s) for DropDownSuperAdmin widget.
  List<String>? dropDownSuperAdminValue;
  FormFieldController<List<String>>? dropDownSuperAdminValueController;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  bool? result1;
  // Model for DeyeMenu component.
  late DeyeMenuModel deyeMenuModel;

  @override
  void initState(BuildContext context) {
    deyeHeaderHRModel = createModel(context, () => DeyeHeaderHRModel());
    deyeMenuModel = createModel(context, () => DeyeMenuModel());
  }

  @override
  void dispose() {
    deyeHeaderHRModel.dispose();
    tabBarController?.dispose();
    deyeMenuModel.dispose();
  }
}
