import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/c_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'c_outlet_list_user4_widget.dart' show COutletListUser4Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class COutletListUser4Model extends FlutterFlowModel<COutletListUser4Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for cHeader component.
  late CHeaderModel cHeaderModel;

  @override
  void initState(BuildContext context) {
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    cHeaderModel.dispose();
  }
}
