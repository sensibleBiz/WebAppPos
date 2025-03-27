import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/c_combo_details/c_combo_details_widget.dart';
import '/pages/components/c_edit_combo/c_edit_combo_widget.dart';
import '/pages/components/c_header/c_header_widget.dart';
import '/pages/components/cstm_side_nav_bar/cstm_side_nav_bar_widget.dart';
import 'dart:ui';
import 'c_combo_widget.dart' show CComboWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CComboModel extends FlutterFlowModel<CComboWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for CstmSideNavBar component.
  late CstmSideNavBarModel cstmSideNavBarModel;
  // Model for cHeader component.
  late CHeaderModel cHeaderModel;

  @override
  void initState(BuildContext context) {
    cstmSideNavBarModel = createModel(context, () => CstmSideNavBarModel());
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    cstmSideNavBarModel.dispose();
    cHeaderModel.dispose();
  }
}
