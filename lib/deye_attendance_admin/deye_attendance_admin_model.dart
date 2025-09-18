import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/send_email_widget.dart';
import '/deye_c_r_m/deye_header_h_r/deye_header_h_r_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/deye_c_r_m/deye_no_data/deye_no_data_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'deye_attendance_admin_widget.dart' show DeyeAttendanceAdminWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeAttendanceAdminModel
    extends FlutterFlowModel<DeyeAttendanceAdminWidget> {
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

  // Model for DeyeHeaderHR component.
  late DeyeHeaderHRModel deyeHeaderHRModel;
  DateTime? datePicked;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<AttendanceRecord>? allAttendenceCurrent;
  // Stores action output result for [Custom Action - downloadAttendence] action in Text widget.
  String? base64Link232Current;
  // Stores action output result for [Backend Call - API (sendMail)] action in Text widget.
  ApiCallResponse? apiResult88gCurrent;
  // Stores action output result for [Firestore Query - Query a collection] action in Text widget.
  List<AttendanceRecord>? allAttendenceLast;
  // Stores action output result for [Custom Action - downloadAttendence] action in Text widget.
  String? base64Link232Last;
  // Stores action output result for [Backend Call - API (sendMail)] action in Text widget.
  ApiCallResponse? apiResult88gLast;
  // Stores action output result for [Firestore Query - Query a collection] action in Icon widget.
  List<AttendanceRecord>? allAttendence1;
  // Stores action output result for [Custom Action - downloadAttendence] action in Icon widget.
  String? base64Link2321;
  // Stores action output result for [Backend Call - API (sendMail)] action in Icon widget.
  ApiCallResponse? apiResult88g1;
  // State field(s) for DropDownSuperAdmin widget.
  List<String>? dropDownSuperAdminValue;
  FormFieldController<List<String>>? dropDownSuperAdminValueController;
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
    deyeMenuModel.dispose();
  }
}
