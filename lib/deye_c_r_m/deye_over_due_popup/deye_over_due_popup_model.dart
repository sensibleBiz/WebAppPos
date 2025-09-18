import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'deye_over_due_popup_widget.dart' show DeyeOverDuePopupWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DeyeOverDuePopupModel extends FlutterFlowModel<DeyeOverDuePopupWidget> {
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
