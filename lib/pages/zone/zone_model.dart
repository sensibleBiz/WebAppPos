import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/adm_side_nav_bar/adm_side_nav_bar_widget.dart';
import '/pages/components/admin_header/admin_header_widget.dart';
import 'dart:ui';
import '/index.dart';
import 'zone_widget.dart' show ZoneWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ZoneModel extends FlutterFlowModel<ZoneWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AdmSideNavBar component.
  late AdmSideNavBarModel admSideNavBarModel;
  // Model for adminHeader component.
  late AdminHeaderModel adminHeaderModel;

  @override
  void initState(BuildContext context) {
    admSideNavBarModel = createModel(context, () => AdmSideNavBarModel());
    adminHeaderModel = createModel(context, () => AdminHeaderModel());
  }

  @override
  void dispose() {
    admSideNavBarModel.dispose();
    adminHeaderModel.dispose();
  }
}
