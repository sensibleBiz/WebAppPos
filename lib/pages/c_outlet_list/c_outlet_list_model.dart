import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/c_header/c_header_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'c_outlet_list_widget.dart' show COutletListWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class COutletListModel extends FlutterFlowModel<COutletListWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  int? teamTreeDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  TeamTreeRecord? teamTREE;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CategoryRecord>? categoryDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<ProductRecord>? productDocs;

  @override
  void initState(BuildContext context) {
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    cHeaderModel.dispose();
  }
}
