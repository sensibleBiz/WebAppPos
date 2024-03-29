import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/admin_header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'add_new_lead_widget.dart' show AddNewLeadWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AddNewLeadModel extends FlutterFlowModel<AddNewLeadWidget> {
  ///  Local state fields for this page.

  bool wait = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  final formKey = GlobalKey<FormState>();
  // Model for adminHeader component.
  late AdminHeaderModel adminHeaderModel;
  // State field(s) for username widget.
  FocusNode? usernameFocusNode;
  TextEditingController? usernameController;
  String? Function(BuildContext, String?)? usernameControllerValidator;
  String? _usernameControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for mobile widget.
  FocusNode? mobileFocusNode;
  TextEditingController? mobileController;
  String? Function(BuildContext, String?)? mobileControllerValidator;
  String? _mobileControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    if (val.length < 10) {
      return 'Please enter a valid 10 digit mobile number.';
    }
    if (val.length > 10) {
      return 'Maximum 10 characters allowed, currently ${val.length}.';
    }

    return null;
  }

  // State field(s) for mobileAlt widget.
  FocusNode? mobileAltFocusNode;
  TextEditingController? mobileAltController;
  String? Function(BuildContext, String?)? mobileAltControllerValidator;
  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailController;
  String? Function(BuildContext, String?)? emailControllerValidator;
  // State field(s) for DropDownstate widget.
  String? dropDownstateValue;
  FormFieldController<String>? dropDownstateValueController;
  // State field(s) for DropDownCities widget.
  String? dropDownCitiesValue;
  FormFieldController<String>? dropDownCitiesValueController;
  // State field(s) for area widget.
  FocusNode? areaFocusNode;
  TextEditingController? areaController;
  String? Function(BuildContext, String?)? areaControllerValidator;
  // State field(s) for DropDownBType widget.
  String? dropDownBTypeValue;
  FormFieldController<String>? dropDownBTypeValueController;
  // State field(s) for BName widget.
  FocusNode? bNameFocusNode;
  TextEditingController? bNameController;
  String? Function(BuildContext, String?)? bNameControllerValidator;
  // State field(s) for phone widget.
  FocusNode? phoneFocusNode;
  TextEditingController? phoneController;
  String? Function(BuildContext, String?)? phoneControllerValidator;
  // State field(s) for DropDownSource widget.
  String? dropDownSourceValue;
  FormFieldController<String>? dropDownSourceValueController;
  // State field(s) for DropDownPriority widget.
  String? dropDownPriorityValue;
  FormFieldController<String>? dropDownPriorityValueController;
  // State field(s) for comments widget.
  FocusNode? commentsFocusNode;
  TextEditingController? commentsController;
  String? Function(BuildContext, String?)? commentsControllerValidator;
  // State field(s) for requirement widget.
  FocusNode? requirementFocusNode;
  TextEditingController? requirementController;
  String? Function(BuildContext, String?)? requirementControllerValidator;
  String? _requirementControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Custom Action - newLeadValidationAction] action in Button widget.
  bool? checkTrue;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<OutletLeadsRecord>? leadRecords;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LeadsRecord? leadRes1;

  @override
  void initState(BuildContext context) {
    adminHeaderModel = createModel(context, () => AdminHeaderModel());
    usernameControllerValidator = _usernameControllerValidator;
    mobileControllerValidator = _mobileControllerValidator;
    requirementControllerValidator = _requirementControllerValidator;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    adminHeaderModel.dispose();
    usernameFocusNode?.dispose();
    usernameController?.dispose();

    mobileFocusNode?.dispose();
    mobileController?.dispose();

    mobileAltFocusNode?.dispose();
    mobileAltController?.dispose();

    emailFocusNode?.dispose();
    emailController?.dispose();

    areaFocusNode?.dispose();
    areaController?.dispose();

    bNameFocusNode?.dispose();
    bNameController?.dispose();

    phoneFocusNode?.dispose();
    phoneController?.dispose();

    commentsFocusNode?.dispose();
    commentsController?.dispose();

    requirementFocusNode?.dispose();
    requirementController?.dispose();
  }
}
