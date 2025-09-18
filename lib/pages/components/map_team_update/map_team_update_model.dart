import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/components/stages_drop_down_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'map_team_update_widget.dart' show MapTeamUpdateWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MapTeamUpdateModel extends FlutterFlowModel<MapTeamUpdateWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDownZone widget.
  List<String>? dropDownZoneValue;
  FormFieldController<List<String>>? dropDownZoneValueController;
  // State field(s) for DropDownZoneHead widget.
  String? dropDownZoneHeadValue;
  FormFieldController<String>? dropDownZoneHeadValueController;
  // State field(s) for DropDownTeam widget.
  String? dropDownTeamValue;
  FormFieldController<String>? dropDownTeamValueController;
  // State field(s) for DropDownHead widget.
  String? dropDownHeadValue;
  FormFieldController<String>? dropDownHeadValueController;
  // State field(s) for DropDownRole widget.
  String? dropDownRoleValue;
  FormFieldController<String>? dropDownRoleValueController;
  // State field(s) for DropDownWorkmode widget.
  String? dropDownWorkmodeValue;
  FormFieldController<String>? dropDownWorkmodeValueController;
  // State field(s) for Switch widget.
  bool? switchValue;
  // Models for stagesDropDown dynamic component.
  late FlutterFlowDynamicModels<StagesDropDownModel> stagesDropDownModels;

  @override
  void initState(BuildContext context) {
    stagesDropDownModels =
        FlutterFlowDynamicModels(() => StagesDropDownModel());
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    stagesDropDownModels.dispose();
  }
}
