import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_new_demo_widget.dart' show AddNewDemoWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddNewDemoModel extends FlutterFlowModel<AddNewDemoWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldCustomerName widget.
  FocusNode? textFieldCustomerNameFocusNode;
  TextEditingController? textFieldCustomerNameController;
  String? Function(BuildContext, String?)?
      textFieldCustomerNameControllerValidator;
  // State field(s) for TextFieldNote widget.
  FocusNode? textFieldNoteFocusNode;
  TextEditingController? textFieldNoteController;
  String? Function(BuildContext, String?)? textFieldNoteControllerValidator;
  DateTime? datePicked;
  // State field(s) for TextFieldCheckInLoc widget.
  FocusNode? textFieldCheckInLocFocusNode;
  TextEditingController? textFieldCheckInLocController;
  String? Function(BuildContext, String?)?
      textFieldCheckInLocControllerValidator;
  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;
  // State field(s) for DropDownExce widget.
  String? dropDownExceValue;
  FormFieldController<String>? dropDownExceValueController;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LeadDemoRecord? doc1;
  // Stores action output result for [Custom Action - updateDemoList] action in Button widget.
  List<DemoListStruct>? docList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldCustomerNameFocusNode?.dispose();
    textFieldCustomerNameController?.dispose();

    textFieldNoteFocusNode?.dispose();
    textFieldNoteController?.dispose();

    textFieldCheckInLocFocusNode?.dispose();
    textFieldCheckInLocController?.dispose();
  }
}
