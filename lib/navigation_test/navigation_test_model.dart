import '/deye_c_r_m/deye_menu_copy/deye_menu_copy_widget.dart';
import '/deye_c_r_m/deye_nav_menu/deye_nav_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/logout_confirm/logout_confirm_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/index.dart';
import 'navigation_test_widget.dart' show NavigationTestWidget;
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class NavigationTestModel extends FlutterFlowModel<NavigationTestWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for DeyeMenuCopy component.
  late DeyeMenuCopyModel deyeMenuCopyModel;
  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController1;

  // State field(s) for Expandable widget.
  late ExpandableController expandableExpandableController2;

  @override
  void initState(BuildContext context) {
    deyeMenuCopyModel = createModel(context, () => DeyeMenuCopyModel());
  }

  @override
  void dispose() {
    deyeMenuCopyModel.dispose();
    expandableExpandableController1.dispose();
    expandableExpandableController2.dispose();
  }
}
