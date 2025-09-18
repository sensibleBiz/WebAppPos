import '/backend/backend.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/map_team/map_team_widget.dart';
import '/pages/components/map_team_update/map_team_update_widget.dart';
import 'dart:ui';
import 'deye_team_tree2_widget.dart' show DeyeTeamTree2Widget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DeyeTeamTree2Model extends FlutterFlowModel<DeyeTeamTree2Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;
  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for DeyeMenu component.
  late DeyeMenuModel deyeMenuModel;

  @override
  void initState(BuildContext context) {
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
    deyeMenuModel = createModel(context, () => DeyeMenuModel());
  }

  @override
  void dispose() {
    deyeHeaderModel.dispose();
    deyeMenuModel.dispose();
  }
}
