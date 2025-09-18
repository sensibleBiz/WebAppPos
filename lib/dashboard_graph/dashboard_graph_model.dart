import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/adm_side_nav_bar/adm_side_nav_bar_widget.dart';
import 'dart:ui';
import '/flutter_flow/random_data_util.dart' as random_data;
import 'dashboard_graph_widget.dart' show DashboardGraphWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DashboardGraphModel extends FlutterFlowModel<DashboardGraphWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for AdmSideNavBar component.
  late AdmSideNavBarModel admSideNavBarModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;

  @override
  void initState(BuildContext context) {
    admSideNavBarModel = createModel(context, () => AdmSideNavBarModel());
  }

  @override
  void dispose() {
    admSideNavBarModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
