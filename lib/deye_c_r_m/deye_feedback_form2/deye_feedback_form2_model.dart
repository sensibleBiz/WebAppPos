import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'deye_feedback_form2_widget.dart' show DeyeFeedbackForm2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeFeedbackForm2Model extends FlutterFlowModel<DeyeFeedbackForm2Widget> {
  ///  Local state fields for this page.

  List<CustFeedbackStruct> list = [];
  void addToList(CustFeedbackStruct item) => list.add(item);
  void removeFromList(CustFeedbackStruct item) => list.remove(item);
  void removeAtIndexFromList(int index) => list.removeAt(index);
  void insertAtIndexInList(int index, CustFeedbackStruct item) =>
      list.insert(index, item);
  void updateListAtIndex(int index, Function(CustFeedbackStruct) updateFn) =>
      list[index] = updateFn(list[index]);

  List<LeadsManagementRecord> leadDoc = [];
  void addToLeadDoc(LeadsManagementRecord item) => leadDoc.add(item);
  void removeFromLeadDoc(LeadsManagementRecord item) => leadDoc.remove(item);
  void removeAtIndexFromLeadDoc(int index) => leadDoc.removeAt(index);
  void insertAtIndexInLeadDoc(int index, LeadsManagementRecord item) =>
      leadDoc.insert(index, item);
  void updateLeadDocAtIndex(
          int index, Function(LeadsManagementRecord) updateFn) =>
      leadDoc[index] = updateFn(leadDoc[index]);

  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CustomerFeedbackRecord? custFeedbackDoc;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController1;
  // Stores action output result for [Custom Action - updateFeedbackList] action in RadioButton widget.
  List<CustFeedbackStruct>? result;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController2;
  // Stores action output result for [Custom Action - updateFeedbackList] action in RadioButton widget.
  List<CustFeedbackStruct>? result2;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController3;
  // Stores action output result for [Custom Action - updateFeedbackList] action in RadioButton widget.
  List<CustFeedbackStruct>? result3;
  // State field(s) for RadioButton widget.
  FormFieldController<String>? radioButtonValueController4;
  // Stores action output result for [Custom Action - updateFeedbackList] action in RadioButton widget.
  List<CustFeedbackStruct>? result4;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }

  /// Additional helper methods.
  String? get radioButtonValue1 => radioButtonValueController1?.value;
  String? get radioButtonValue2 => radioButtonValueController2?.value;
  String? get radioButtonValue3 => radioButtonValueController3?.value;
  String? get radioButtonValue4 => radioButtonValueController4?.value;
}
