import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'deye_subscription_copy_widget.dart' show DeyeSubscriptionCopyWidget;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class DeyeSubscriptionCopyModel
    extends FlutterFlowModel<DeyeSubscriptionCopyWidget> {
  ///  Local state fields for this page.

  String? pgURL;

  ///  State fields for stateful widgets in this page.

  // Model for DeyeHeader component.
  late DeyeHeaderModel deyeHeaderModel;
  // Stores action output result for [Backend Call - API (subscriptionPaymentPG)] action in FloatingActionButton widget.
  ApiCallResponse? apiResultpdm;

  @override
  void initState(BuildContext context) {
    deyeHeaderModel = createModel(context, () => DeyeHeaderModel());
  }

  @override
  void dispose() {
    deyeHeaderModel.dispose();
  }
}
