import '/backend/backend.dart';
import '/deye_c_r_m/dealer_activity_view/dealer_activity_view_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/c_header/c_header_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/message_box/message_box_widget.dart';
import '/pages/components/schedule_dealer_activity/schedule_dealer_activity_widget.dart';
import '/pages/components/update_delaer_status/update_delaer_status_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'dealer_dashboard_widget.dart' show DealerDashboardWidget;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class DealerDashboardModel extends FlutterFlowModel<DealerDashboardWidget> {
  ///  Local state fields for this page.

  bool showMore = true;

  ///  State fields for stateful widgets in this page.

  // Model for cHeader component.
  late CHeaderModel cHeaderModel;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<DealersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    cHeaderModel = createModel(context, () => CHeaderModel());
  }

  @override
  void dispose() {
    cHeaderModel.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
