import '/backend/backend.dart';
import '/deye_c_r_m/deye_nav_menu/deye_nav_menu_widget.dart';
import '/deye_c_r_m/deye_notification_popup/deye_notification_popup_widget.dart';
import '/deye_c_r_m/deye_over_due_popup/deye_over_due_popup_widget.dart';
import '/deye_c_r_m/deye_profile_popup/deye_profile_popup_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'deye_header_widget.dart' show DeyeHeaderWidget;
import 'package:aligned_dialog/aligned_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeHeaderModel extends FlutterFlowModel<DeyeHeaderWidget> {
  ///  Local state fields for this component.

  List<String> stageList = ['assigned', 'pending'];
  void addToStageList(String item) => stageList.add(item);
  void removeFromStageList(String item) => stageList.remove(item);
  void removeAtIndexFromStageList(int index) => stageList.removeAt(index);
  void insertAtIndexInStageList(int index, String item) =>
      stageList.insert(index, item);
  void updateStageListAtIndex(int index, Function(String) updateFn) =>
      stageList[index] = updateFn(stageList[index]);

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
