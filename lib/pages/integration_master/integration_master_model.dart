import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/add_integration_key/add_integration_key_widget.dart';
import '/pages/components/admin_header/admin_header_widget.dart';
import 'dart:ui';
import 'integration_master_widget.dart' show IntegrationMasterWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class IntegrationMasterModel extends FlutterFlowModel<IntegrationMasterWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for adminHeader component.
  late AdminHeaderModel adminHeaderModel;

  @override
  void initState(BuildContext context) {
    adminHeaderModel = createModel(context, () => AdminHeaderModel());
  }

  @override
  void dispose() {
    adminHeaderModel.dispose();
  }
}
