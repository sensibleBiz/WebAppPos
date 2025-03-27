import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/add_tag/add_tag_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dis_qualify_lead_widget.dart' show DisQualifyLeadWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DisQualifyLeadModel extends FlutterFlowModel<DisQualifyLeadWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldtag widget.
  final textFieldtagKey = GlobalKey();
  FocusNode? textFieldtagFocusNode;
  TextEditingController? textFieldtagTextController;
  String? textFieldtagSelectedOption;
  String? Function(BuildContext, String?)? textFieldtagTextControllerValidator;
  List<LeadTagRecord> simpleSearchResults = [];
  // Stores action output result for [Custom Action - generateTagCode] action in Button widget.
  int? tag;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LeadsManagementRecord? res1;
  // Stores action output result for [Custom Action - leadTagLIst] action in Button widget.
  List<LeadTagListStruct>? taglist;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldtagFocusNode?.dispose();
  }
}
