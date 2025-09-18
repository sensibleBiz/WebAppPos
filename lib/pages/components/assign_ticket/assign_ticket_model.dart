import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'assign_ticket_widget.dart' show AssignTicketWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AssignTicketModel extends FlutterFlowModel<AssignTicketWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in AssignTicket widget.
  LeadsManagementRecord? leadMangementDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in AssignTicket widget.
  OutletLeadsRecord? outletLeadDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  LeadsManagementRecord? dealerRes;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
