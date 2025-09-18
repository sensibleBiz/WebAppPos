import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/assign_lead_dealer/assign_lead_dealer_widget.dart';
import '/pages/components/dis_qualify_lead_copy/dis_qualify_lead_copy_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'ringing_leads_widget.dart' show RingingLeadsWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class RingingLeadsModel extends FlutterFlowModel<RingingLeadsWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  UserProfileRecord? user;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
