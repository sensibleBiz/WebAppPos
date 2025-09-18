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
import 'map_team_widget.dart' show MapTeamWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class MapTeamModel extends FlutterFlowModel<MapTeamWidget> {
  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDownUser widget.
  String? dropDownUserValue;
  FormFieldController<String>? dropDownUserValueController;
  // State field(s) for DropDownZoneList widget.
  List<String>? dropDownZoneListValue;
  FormFieldController<List<String>>? dropDownZoneListValueController;
  // State field(s) for DropDownHead widget.
  String? dropDownHeadValue;
  FormFieldController<String>? dropDownHeadValueController;
  // State field(s) for DropDownZoneHead widget.
  String? dropDownZoneHeadValue;
  FormFieldController<String>? dropDownZoneHeadValueController;
  // State field(s) for DropDownRole widget.
  String? dropDownRoleValue;
  FormFieldController<String>? dropDownRoleValueController;
  // Models for stagesDropDown dynamic component.
  late FlutterFlowDynamicModels<StagesDropDownModel> stagesDropDownModels;
  // Stores action output result for [Backend Call - Create Document] action in ContainerSubCategory2 widget.
  TeamTreeRecord? doc;

  @override
  void initState(BuildContext context) {
    stagesDropDownModels =
        FlutterFlowDynamicModels(() => StagesDropDownModel());
  }

  @override
  void dispose() {
    stagesDropDownModels.dispose();
  }
}
