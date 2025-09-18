import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/add_user_acount/add_user_acount_widget.dart';
import '/pages/components/c_header/c_header_widget.dart';
import '/pages/components/deye_edit_user/deye_edit_user_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'all_user_account_widget.dart' show AllUserAccountWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class AllUserAccountModel extends FlutterFlowModel<AllUserAccountWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // Stores action output result for [Custom Action - generateUserAccountCode] action in Button widget.
  int? len;

  @override
  void initState(BuildContext context) {
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    cHeaderModel.dispose();
  }
}
