import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/deye_reassign_history_widget.dart';
import '/components/popup_success_copy_widget.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import 'dart:ui';
import 'deye_complaint_detail_view_widget.dart'
    show DeyeComplaintDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeComplaintDetailViewModel
    extends FlutterFlowModel<DeyeComplaintDetailViewWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;
  // State field(s) for DropDownStage widget.
  String? dropDownStageValue;
  FormFieldController<String>? dropDownStageValueController;
  // State field(s) for DropDownRemark widget.
  String? dropDownRemarkValue;
  FormFieldController<String>? dropDownRemarkValueController;
  // State field(s) for TextFieldComments widget.
  FocusNode? textFieldCommentsFocusNode;
  TextEditingController? textFieldCommentsTextController;
  String? Function(BuildContext, String?)?
      textFieldCommentsTextControllerValidator;

  @override
  void initState(BuildContext context) {
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
  }

  @override
  void dispose() {
    deyeHeaderModel.dispose();
    textFieldCommentsFocusNode?.dispose();
    textFieldCommentsTextController?.dispose();
  }
}
