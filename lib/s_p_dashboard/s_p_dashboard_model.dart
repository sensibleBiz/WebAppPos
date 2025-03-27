import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 's_p_dashboard_widget.dart' show SPDashboardWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SPDashboardModel extends FlutterFlowModel<SPDashboardWidget> {
  ///  Local state fields for this page.

  int? count = 0;

  bool showMore = false;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in sPDashboard widget.
  List<SaleRecord>? newOrder;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  SaleRecord? doc5;
  // Stores action output result for [Custom Action - docToJsonSale] action in Container widget.
  dynamic? sale15;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
