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
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'response_page_model.dart';
export 'response_page_model.dart';

class ResponsePageWidget extends StatefulWidget {
  const ResponsePageWidget({
    super.key,
    required this.merchantTransactionId,
  });

  final String? merchantTransactionId;

  static String routeName = 'responsePage';
  static String routePath = 'responsePage';

  @override
  State<ResponsePageWidget> createState() => _ResponsePageWidgetState();
}

class _ResponsePageWidgetState extends State<ResponsePageWidget>
    with TickerProviderStateMixin {
  late ResponsePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ResponsePageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.paymentStatusTimer = InstantTimer.periodic(
        duration: Duration(milliseconds: 1000),
        callback: (timer) async {
          _model.apiResultjah = await SubscriptionPaymentPGStatusCall.call(
            merchantTransactionId: widget!.merchantTransactionId,
            outletId: FFAppState().outletId,
            userId: FFAppState().currentLoggedInUserId,
            deviceId:
                FFAppState().billingType == 'CRM' ? '0' : FFAppState().deviceId,
            duration: 12,
            isProd: false,
          );

          if (PaymentStatusStruct.maybeFromMap(
                      (_model.apiResultjah?.jsonBody ?? ''))
                  ?.status !=
              PaymentStatus.PENDING) {
            _model.paymentStatusTimer?.cancel();
            _model.paymentStatus = PaymentStatusStruct.maybeFromMap(
                    (_model.apiResultjah?.jsonBody ?? ''))
                ?.status;
            safeSetState(() {});
            await Future.delayed(
              Duration(
                milliseconds: 2000,
              ),
            );

            context.goNamed(DeyeSubscriptionWidget.routeName);
          }
        },
        startImmediately: true,
      );
    });

    animationsMap.addAll({
      'textOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'transactionSuccessOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'transactionFailedOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
      'transactionPendingOnPageLoadAnimation': AnimationInfo(
        trigger: AnimationTrigger.onPageLoad,
        effectsBuilder: () => [
          ShimmerEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            color: Color(0x80FFFFFF),
            angle: 0.524,
          ),
        ],
      ),
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Title(
        title: 'responsePage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (_model.paymentStatus == PaymentStatus.SUCCESS)
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 50.0, 50.0, 50.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6.0),
                              bottomRight: Radius.circular(6.0),
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0),
                            ),
                            border: Border.all(
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 75.0),
                                child: Text(
                                  'Thank You !',
                                  style: FlutterFlowTheme.of(context)
                                      .displayLarge
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .displayLargeFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .success,
                                        fontSize: 36.0,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        fontStyle: FontStyle.italic,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .displayLargeIsCustom,
                                      ),
                                ).animateOnPageLoad(
                                    animationsMap['textOnPageLoadAnimation']!),
                              ),
                              wrapWithModel(
                                model: _model.transactionSuccessModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TransactionSuccessWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'transactionSuccessOnPageLoadAnimation']!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (_model.paymentStatus == PaymentStatus.FAILED)
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 50.0, 50.0, 50.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6.0),
                              bottomRight: Radius.circular(6.0),
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.transactionFailedModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TransactionFailedWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'transactionFailedOnPageLoadAnimation']!),
                            ],
                          ),
                        ),
                      ),
                    ),
                  if (_model.paymentStatus == PaymentStatus.PENDING)
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            50.0, 50.0, 50.0, 50.0),
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(6.0),
                              bottomRight: Radius.circular(6.0),
                              topLeft: Radius.circular(6.0),
                              topRight: Radius.circular(6.0),
                            ),
                            border: Border.all(
                              color: FlutterFlowTheme.of(context).tertiary,
                              width: 2.0,
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              wrapWithModel(
                                model: _model.transactionPendingModel,
                                updateCallback: () => safeSetState(() {}),
                                child: TransactionPendingWidget(),
                              ).animateOnPageLoad(animationsMap[
                                  'transactionPendingOnPageLoadAnimation']!),
                            ],
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ));
  }
}
