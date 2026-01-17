import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/instant_timer.dart';
import '/pages/components/transaction_status_component/transaction_failed/transaction_failed_widget.dart';
import '/pages/components/transaction_status_component/transaction_pending/transaction_pending_widget.dart';
import '/pages/components/transaction_status_component/transaction_success/transaction_success_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/backend/schema/structs/index.dart';
import '/index.dart';
import 'response_page_widget.dart' show ResponsePageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ResponsePageModel extends FlutterFlowModel<ResponsePageWidget> {
  ///  Local state fields for this page.

  PaymentStatus? paymentStatus = PaymentStatus.PENDING;

  ///  State fields for stateful widgets in this page.

  InstantTimer? paymentStatusTimer;
  // Stores action output result for [Backend Call - API (subscriptionPaymentPGStatus)] action in responsePage widget.
  ApiCallResponse? apiResultjah;
  // Model for transactionSuccess component.
  late TransactionSuccessModel transactionSuccessModel;
  // Model for transactionFailed component.
  late TransactionFailedModel transactionFailedModel;
  // Model for transactionPending component.
  late TransactionPendingModel transactionPendingModel;

  @override
  void initState(BuildContext context) {
    transactionSuccessModel =
        createModel(context, () => TransactionSuccessModel());
    transactionFailedModel =
        createModel(context, () => TransactionFailedModel());
    transactionPendingModel =
        createModel(context, () => TransactionPendingModel());
  }

  @override
  void dispose() {
    paymentStatusTimer?.cancel();
    transactionSuccessModel.dispose();
    transactionFailedModel.dispose();
    transactionPendingModel.dispose();
  }
}
