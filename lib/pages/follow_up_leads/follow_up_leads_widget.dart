import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/add_follow_up/add_follow_up_widget.dart';
import '/pages/components/call_details/call_details_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/test_dropdown/test_dropdown_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'follow_up_leads_model.dart';
export 'follow_up_leads_model.dart';

class FollowUpLeadsWidget extends StatefulWidget {
  const FollowUpLeadsWidget({super.key});

  static String routeName = 'FollowUpLeads';
  static String routePath = 'followUpLeads';

  @override
  State<FollowUpLeadsWidget> createState() => _FollowUpLeadsWidgetState();
}

class _FollowUpLeadsWidgetState extends State<FollowUpLeadsWidget>
    with TickerProviderStateMixin {
  late FollowUpLeadsModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FollowUpLeadsModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().selectedDate =
          functions.timestampToMili(getCurrentTimestamp);
      safeSetState(() {});
    });

    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation3': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 10.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 10.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation4': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 20.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 20.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation5': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation6': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation7': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 10.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 10.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
      'containerOnActionTriggerAnimation8': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 20.0.ms,
            duration: 200.0.ms,
            begin: Offset(0.0, 30.0),
            end: Offset(0.0, 0.0),
          ),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 20.0.ms,
            duration: 200.0.ms,
            begin: 0.0,
            end: 1.0,
          ),
        ],
      ),
    });
    setupAnimations(
      animationsMap.values.where((anim) =>
          anim.trigger == AnimationTrigger.onActionTrigger ||
          !anim.applyInitialState),
      this,
    );

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
        title: 'FollowUpLeads',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(
                          color: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    context.safePop();
                                  },
                                  text: '',
                                  icon: Icon(
                                    Icons.chevron_left,
                                    size: 32.0,
                                  ),
                                  options: FFButtonOptions(
                                    height: double.infinity,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    color: FlutterFlowTheme.of(context).primary,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: Colors.white,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleSmallIsCustom,
                                        ),
                                    elevation: 2.0,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 25.0, 0.0),
                                  child: Text(
                                    'Follow Up Leads',
                                    style: FlutterFlowTheme.of(context)
                                        .headlineMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .headlineMediumFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .headlineMediumIsCustom,
                                        ),
                                  ),
                                ),
                                Text(
                                  functions.milisecToTimestamp(
                                      FFAppState().selectedDate),
                                  style: FlutterFlowTheme.of(context)
                                      .headlineSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .headlineSmallIsCustom,
                                      ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: FlutterFlowIconButton(
                                      borderRadius: 10.0,
                                      borderWidth: 1.0,
                                      buttonSize: 40.0,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondary,
                                      icon: Icon(
                                        Icons.calendar_today_rounded,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        final _datePickedDate =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: getCurrentTimestamp,
                                          firstDate: DateTime(1900),
                                          lastDate: DateTime(2050),
                                        );

                                        if (_datePickedDate != null) {
                                          safeSetState(() {
                                            _model.datePicked = DateTime(
                                              _datePickedDate.year,
                                              _datePickedDate.month,
                                              _datePickedDate.day,
                                            );
                                          });
                                        } else if (_model.datePicked != null) {
                                          safeSetState(() {
                                            _model.datePicked =
                                                getCurrentTimestamp;
                                          });
                                        }
                                        FFAppState().selectedDate = functions
                                            .timestampToMili(_model.datePicked);
                                        safeSetState(() {});
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                            TodayDetailsWidget.routeName);
                                      },
                                      text: 'Today',
                                      icon: Icon(
                                        Icons.phone_in_talk_rounded,
                                        size: 18.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 90.0,
                                        height: 40.0,
                                        padding: EdgeInsets.all(0.0),
                                        iconPadding: EdgeInsets.all(0.0),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primary,
                                        color: FlutterFlowTheme.of(context)
                                            .secondary,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 11.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                  ),
                                  if (FFAppState().hide)
                                    FFButtonWidget(
                                      onPressed: () async {
                                        context.pushNamed(
                                          AddNewLeadWidget.routeName,
                                          extra: <String, dynamic>{
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .leftToRight,
                                            ),
                                          },
                                        );
                                      },
                                      text: 'Add New Lead',
                                      icon: Icon(
                                        Icons.add,
                                        size: 20.0,
                                      ),
                                      options: FFButtonOptions(
                                        width: 170.0,
                                        height: 40.0,
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 0.0),
                                        iconPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                0.0, 0.0, 0.0, 0.0),
                                        iconColor: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .titleSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              fontSize: 15.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .titleSmallIsCustom,
                                            ),
                                        elevation: 2.0,
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 13,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: 200.0,
                              decoration: BoxDecoration(),
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          2.0, 0.0, 3.0, 10.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          FFAppState().showStatus = false;
                                          safeSetState(() {});
                                          FFAppState().cAll =
                                              FlutterFlowTheme.of(context)
                                                  .primary;
                                          FFAppState().cDemoDone =
                                              Colors.transparent;
                                          FFAppState().cDemoResch =
                                              Colors.transparent;
                                          FFAppState().cFollowUp =
                                              Colors.transparent;
                                          FFAppState().cInstallation =
                                              Colors.transparent;
                                          FFAppState().cHold =
                                              Colors.transparent;
                                          FFAppState().cLost =
                                              Colors.transparent;
                                          safeSetState(() {});
                                        },
                                        text: 'All',
                                        options: FFButtonOptions(
                                          width: double.infinity,
                                          height: 40.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .headlineLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLargeIsCustom,
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: valueOrDefault<Color>(
                                              FFAppState().cAll,
                                              FlutterFlowTheme.of(context)
                                                  .secondary,
                                            ),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 5.0, 3.0, 5.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().dropDownStatus =
                                                    'DEMO DONE';
                                                FFAppState().showStatus = true;
                                                safeSetState(() {});
                                                FFAppState().cAll =
                                                    Colors.transparent;
                                                FFAppState().cDemoDone =
                                                    FlutterFlowTheme.of(context)
                                                        .primary;
                                                FFAppState().cDemoResch =
                                                    Colors.transparent;
                                                FFAppState().cFollowUp =
                                                    Colors.transparent;
                                                FFAppState().cInstallation =
                                                    Colors.transparent;
                                                FFAppState().cHold =
                                                    Colors.transparent;
                                                FFAppState().cLost =
                                                    Colors.transparent;
                                                safeSetState(() {});
                                              },
                                              text: 'Demo Done',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding: EdgeInsets.all(0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().cDemoDone,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 5.0, 3.0, 5.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().dropDownStatus =
                                                    'DEMO RESCEDULE';
                                                FFAppState().showStatus = true;
                                                safeSetState(() {});
                                                FFAppState().cAll =
                                                    Colors.transparent;
                                                FFAppState().cDemoDone =
                                                    Colors.transparent;
                                                FFAppState().cDemoResch =
                                                    FlutterFlowTheme.of(context)
                                                        .primary;
                                                FFAppState().cFollowUp =
                                                    Colors.transparent;
                                                FFAppState().cInstallation =
                                                    Colors.transparent;
                                                FFAppState().cHold =
                                                    Colors.transparent;
                                                FFAppState().cLost =
                                                    Colors.transparent;
                                                safeSetState(() {});
                                              },
                                              text: ' Reschedule',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding: EdgeInsets.all(0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().cDemoResch,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 5.0, 3.0, 5.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().dropDownStatus =
                                                    'FOLLOWUP';
                                                FFAppState().showStatus = true;
                                                safeSetState(() {});
                                                FFAppState().cAll =
                                                    Colors.transparent;
                                                FFAppState().cDemoDone =
                                                    Colors.transparent;
                                                FFAppState().cDemoResch =
                                                    Colors.transparent;
                                                FFAppState().cFollowUp =
                                                    FlutterFlowTheme.of(context)
                                                        .primary;
                                                FFAppState().cInstallation =
                                                    Colors.transparent;
                                                FFAppState().cHold =
                                                    Colors.transparent;
                                                FFAppState().cLost =
                                                    Colors.transparent;
                                                safeSetState(() {});
                                              },
                                              text: 'Follow up',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding: EdgeInsets.all(0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().cFollowUp,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    2.0, 5.0, 3.0, 5.0),
                                            child: FFButtonWidget(
                                              onPressed: () async {
                                                FFAppState().dropDownStatus =
                                                    'HOLD';
                                                FFAppState().showStatus = true;
                                                safeSetState(() {});
                                                FFAppState().cAll =
                                                    Colors.transparent;
                                                FFAppState().cDemoDone =
                                                    Colors.transparent;
                                                FFAppState().cDemoResch =
                                                    Colors.transparent;
                                                FFAppState().cFollowUp =
                                                    Colors.transparent;
                                                FFAppState().cInstallation =
                                                    Colors.transparent;
                                                FFAppState().cHold =
                                                    FlutterFlowTheme.of(context)
                                                        .primary;
                                                FFAppState().cLost =
                                                    Colors.transparent;
                                                safeSetState(() {});
                                              },
                                              text: 'Hold',
                                              options: FFButtonOptions(
                                                width: double.infinity,
                                                height: 40.0,
                                                padding: EdgeInsets.all(0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                                elevation: 2.0,
                                                borderSide: BorderSide(
                                                  color: valueOrDefault<Color>(
                                                    FFAppState().cHold,
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                  ),
                                                  width: 2.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                          ),
                                          if (FFAppState().hide)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 5.0, 3.0, 5.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {},
                                                text: 'Installation',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumIsCustom,
                                                          ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState()
                                                          .cInstallation,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          if (FFAppState().hide)
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(2.0, 5.0, 3.0, 5.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {},
                                                text: 'Lost',
                                                options: FFButtonOptions(
                                                  width: double.infinity,
                                                  height: 40.0,
                                                  padding: EdgeInsets.all(0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumIsCustom,
                                                          ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color:
                                                        valueOrDefault<Color>(
                                                      FFAppState().cLost,
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                    ),
                                                    width: 2.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 8,
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Container(
                                width: 500.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .customColor1,
                                  ),
                                ),
                                child: Stack(
                                  children: [
                                    if (!FFAppState().showStatus)
                                      StreamBuilder<
                                          List<LeadsManagementRecord>>(
                                        stream: queryLeadsManagementRecord(
                                          parent: FFAppState().outletRef,
                                          queryBuilder:
                                              (leadsManagementRecord) =>
                                                  leadsManagementRecord
                                                      .where(
                                                        'stage',
                                                        isEqualTo:
                                                            'followup' != ''
                                                                ? 'followup'
                                                                : null,
                                                      )
                                                      .where(
                                                        'updatedDate',
                                                        isGreaterThan: functions
                                                            .getYest(FFAppState()
                                                                .selectedDate),
                                                      )
                                                      .where(
                                                        'updatedDate',
                                                        isLessThan: functions
                                                            .getTommorrow(
                                                                FFAppState()
                                                                    .selectedDate),
                                                      )
                                                      .orderBy('updatedDate',
                                                          descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 30.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<LeadsManagementRecord>
                                              allLeadsLeadsManagementRecordList =
                                              snapshot.data!;

                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                1.0,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20.0, 10.0,
                                                          20.0, 10.0),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .width *
                                                                0.05,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                0.05,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFFE0E0),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          shape: BoxShape
                                                              .rectangle,
                                                          border: Border.all(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor1,
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              allLeadsLeadsManagementRecordList
                                                                  .length
                                                                  .toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyMediumIsCustom,
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  width:
                                                      MediaQuery.sizeOf(context)
                                                              .width *
                                                          1.0,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.8,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0.0, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(15.0),
                                                      child: Builder(
                                                        builder: (context) {
                                                          final allLeads =
                                                              allLeadsLeadsManagementRecordList
                                                                  .map((e) => e)
                                                                  .toList();
                                                          if (allLeads
                                                              .isEmpty) {
                                                            return Center(
                                                              child:
                                                                  ListViewMsgWidget(),
                                                            );
                                                          }

                                                          return ListView
                                                              .builder(
                                                            padding:
                                                                EdgeInsets.zero,
                                                            scrollDirection:
                                                                Axis.vertical,
                                                            itemCount:
                                                                allLeads.length,
                                                            itemBuilder: (context,
                                                                allLeadsIndex) {
                                                              final allLeadsItem =
                                                                  allLeads[
                                                                      allLeadsIndex];
                                                              return Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            9.0),
                                                                child: InkWell(
                                                                  splashColor:
                                                                      Colors
                                                                          .transparent,
                                                                  focusColor: Colors
                                                                      .transparent,
                                                                  hoverColor: Colors
                                                                      .transparent,
                                                                  highlightColor:
                                                                      Colors
                                                                          .transparent,
                                                                  onTap:
                                                                      () async {},
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor1,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Stack(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            1.0),
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.0, 0.0),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {},
                                                                                          child: Stack(
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsets.all(3.0),
                                                                                                child: Container(
                                                                                                  width: 35.0,
                                                                                                  height: 35.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Icon(
                                                                                                    Icons.offline_bolt_sharp,
                                                                                                    color: Color(0xFFFF0A00),
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsets.all(3.0),
                                                                                                child: Container(
                                                                                                  width: 35.0,
                                                                                                  height: 35.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Icon(
                                                                                                    Icons.waves,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                        child: Stack(
                                                                                          children: [
                                                                                            Image.asset(
                                                                                              'assets/images/185-1853635_other-ask-a-question-icon-images-manager-question-icon.png',
                                                                                              width: 30.0,
                                                                                              height: 30.0,
                                                                                              fit: BoxFit.contain,
                                                                                            ),
                                                                                            if (allLeadsItem.source == 'Reference')
                                                                                              Image.asset(
                                                                                                'assets/images/download.png',
                                                                                                width: 30.0,
                                                                                                height: 25.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            if (allLeadsItem.source == 'Walk-in')
                                                                                              Image.asset(
                                                                                                'assets/images/walking-icon-png-19.jpg',
                                                                                                width: 30.0,
                                                                                                height: 30.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            if (allLeadsItem.source == '')
                                                                                              Image.asset(
                                                                                                'assets/images/JustDial.png',
                                                                                                width: 30.0,
                                                                                                height: 30.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            if (allLeadsItem.source == '')
                                                                                              Image.asset(
                                                                                                'assets/images/INDIAMART.NS-ecf147e0.png',
                                                                                                width: 30.0,
                                                                                                height: 30.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                            if (allLeadsItem.source == '')
                                                                                              Image.asset(
                                                                                                'assets/images/facebook.png',
                                                                                                width: 30.0,
                                                                                                height: 30.0,
                                                                                                fit: BoxFit.contain,
                                                                                              ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 18,
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                                      child: ClipRRect(
                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).accent4,
                                                                                                            borderRadius: BorderRadius.circular(5.0),
                                                                                                            border: Border.all(
                                                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          child: Padding(
                                                                                                            padding: EdgeInsets.all(6.0),
                                                                                                            child: StreamBuilder<List<BusinessTypeRecord>>(
                                                                                                              stream: queryBusinessTypeRecord(
                                                                                                                queryBuilder: (businessTypeRecord) => businessTypeRecord.where(
                                                                                                                  'id',
                                                                                                                  isEqualTo: allLeadsItem.businessType != '' ? allLeadsItem.businessType : null,
                                                                                                                ),
                                                                                                                singleRecord: true,
                                                                                                              ),
                                                                                                              builder: (context, snapshot) {
                                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                                if (!snapshot.hasData) {
                                                                                                                  return Center(
                                                                                                                    child: SizedBox(
                                                                                                                      width: 30.0,
                                                                                                                      height: 30.0,
                                                                                                                      child: SpinKitRing(
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        size: 30.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                }
                                                                                                                List<BusinessTypeRecord> rowBusinessTypeRecordList = snapshot.data!;
                                                                                                                // Return an empty Container when the item does not exist.
                                                                                                                if (snapshot.data!.isEmpty) {
                                                                                                                  return Container();
                                                                                                                }
                                                                                                                final rowBusinessTypeRecord = rowBusinessTypeRecordList.isNotEmpty ? rowBusinessTypeRecordList.first : null;

                                                                                                                return Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  children: [
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        allLeadsItem.businessName,
                                                                                                                        style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                                              fontSize: 12.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    Text(
                                                                                                                      rowBusinessTypeRecord!.name,
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                            fontSize: 10.0,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                  ],
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Container(
                                                                                                      constraints: BoxConstraints(
                                                                                                        maxWidth: MediaQuery.sizeOf(context).width * 0.12,
                                                                                                      ),
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                              child: Text(
                                                                                                                allLeadsItem.username,
                                                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      fontSize: 14.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              allLeadsItem.mobile,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      allLeadsItem.city,
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.leadsReq(allLeadsItem.requirement),
                                                                                              'Requirement not specified',
                                                                                            ),
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                  color: Color(0xFF5283EB),
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            allLeadsItem.status,
                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Stack(
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                                child: StreamBuilder<List<UserProfileRecord>>(
                                                                                                  stream: queryUserProfileRecord(
                                                                                                    queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                      'id',
                                                                                                      isEqualTo: allLeadsItem.assignedTo != '' ? allLeadsItem.assignedTo : null,
                                                                                                    ),
                                                                                                    singleRecord: true,
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 30.0,
                                                                                                          height: 30.0,
                                                                                                          child: SpinKitRing(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            size: 30.0,
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<UserProfileRecord> containerUserProfileRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final containerUserProfileRecord = containerUserProfileRecordList.isNotEmpty ? containerUserProfileRecordList.first : null;

                                                                                                    return Container(
                                                                                                      decoration: BoxDecoration(
                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                        border: Border.all(
                                                                                                          color: FlutterFlowTheme.of(context).customColor1,
                                                                                                        ),
                                                                                                      ),
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsets.all(5.0),
                                                                                                        child: Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                                              child: Icon(
                                                                                                                Icons.person,
                                                                                                                color: Color(0xFF003DC4),
                                                                                                                size: 10.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              containerUserProfileRecord!.name,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: Color(0xFF003DC4),
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'By : ',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).customColor3,
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        'Amrut N',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).customColor3,
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Created on : ',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontSize: 9.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                              Text(
                                                                                                allLeadsItem.date,
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                child: Text(
                                                                                                  functions.dateToTime(allLeadsItem.createdDate),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        if (FFAppState().assignedExec)
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  allLeadsLeadsManagementRecordList.length.toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 9.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                Text(
                                                                                                  functions.milisecToTimestamp(allLeadsItem.updatedDate),
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                            child: Container(
                                                                                              height: MediaQuery.sizeOf(context).height * 0.045,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).customColor1,
                                                                                                ),
                                                                                              ),
                                                                                              child: Stack(
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Expanded(
                                                                                                        child: Container(
                                                                                                          decoration: BoxDecoration(
                                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          ),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                child: TestDropdownWidget(
                                                                                                                  key: Key('Keygxr_${allLeadsIndex}_of_${allLeads.length}'),
                                                                                                                  ref: getJsonField(
                                                                                                                    functions.docToJson(allLeadsItem),
                                                                                                                    r'''$''',
                                                                                                                  ),
                                                                                                                  flag: 1,
                                                                                                                  isSearching: false,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Container(
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    ),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 30.0,
                                                                                                borderWidth: 1.0,
                                                                                                buttonSize: 30.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                icon: Icon(
                                                                                                  Icons.call,
                                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                                  size: 12.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  await showModalBottomSheet(
                                                                                                    isScrollControlled: true,
                                                                                                    backgroundColor: Colors.transparent,
                                                                                                    barrierColor: Color(0x00000000),
                                                                                                    enableDrag: false,
                                                                                                    context: context,
                                                                                                    builder: (context) {
                                                                                                      return WebViewAware(
                                                                                                        child: GestureDetector(
                                                                                                          onTap: () {
                                                                                                            FocusScope.of(context).unfocus();
                                                                                                            FocusManager.instance.primaryFocus?.unfocus();
                                                                                                          },
                                                                                                          child: Padding(
                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                            child: CallDetailsWidget(
                                                                                                              id: allLeadsItem.id,
                                                                                                              username: allLeadsItem.username,
                                                                                                              mobile: allLeadsItem.mobile,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() {}));
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                              child: Stack(
                                                                                                children: [
                                                                                                  if (FFAppState().assignedExec)
                                                                                                    Align(
                                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                      child: FlutterFlowIconButton(
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderRadius: 30.0,
                                                                                                        borderWidth: 1.0,
                                                                                                        buttonSize: 30.0,
                                                                                                        fillColor: Color(0xFFD8E6FF),
                                                                                                        icon: Icon(
                                                                                                          Icons.line_weight_rounded,
                                                                                                          color: Color(0xFF003DC4),
                                                                                                          size: 13.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
                                                                                                            barrierColor: Color(0x00000000),
                                                                                                            enableDrag: false,
                                                                                                            context: context,
                                                                                                            builder: (context) {
                                                                                                              return WebViewAware(
                                                                                                                child: GestureDetector(
                                                                                                                  onTap: () {
                                                                                                                    FocusScope.of(context).unfocus();
                                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                  },
                                                                                                                  child: Padding(
                                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                                    child: AddFollowUpWidget(
                                                                                                                      leadMRefid: allLeadsItem.id,
                                                                                                                      username: allLeadsItem.username,
                                                                                                                      mobile: allLeadsItem.mobile,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 30.0,
                                                                                                borderWidth: 1.0,
                                                                                                buttonSize: 50.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).secondary,
                                                                                                icon: Icon(
                                                                                                  Icons.read_more_rounded,
                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                  size: 30.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  if (allLeadsItem.status == 'Unread') {
                                                                                                    return;
                                                                                                  }

                                                                                                  context.pushNamed(
                                                                                                    LeadLogWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'id': serializeParam(
                                                                                                        allLeadsItem.id,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'username': serializeParam(
                                                                                                        allLeadsItem.username,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'mobile': serializeParam(
                                                                                                        allLeadsItem.mobile,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'state': serializeParam(
                                                                                                        allLeadsItem.state,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'source': serializeParam(
                                                                                                        allLeadsItem.source,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'requirement': serializeParam(
                                                                                                        allLeadsItem.requirement,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'area': serializeParam(
                                                                                                        allLeadsItem.area,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                      'city': serializeParam(
                                                                                                        allLeadsItem.city,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          if (responsiveVisibility(
                                                                            context:
                                                                                context,
                                                                            desktop:
                                                                                false,
                                                                          ))
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 5.0),
                                                                              child: ClipRRect(
                                                                                borderRadius: BorderRadius.circular(15.0),
                                                                                child: Container(
                                                                                  height: 40.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    boxShadow: [
                                                                                      BoxShadow(
                                                                                        blurRadius: 7.0,
                                                                                        color: FlutterFlowTheme.of(context).customColor3,
                                                                                        offset: Offset(
                                                                                          3.0,
                                                                                          5.0,
                                                                                        ),
                                                                                      )
                                                                                    ],
                                                                                    borderRadius: BorderRadius.circular(15.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).backgroundComponants,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                      children: [
                                                                                        Container(
                                                                                          width: 35.0,
                                                                                          height: 35.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Icon(
                                                                                            Icons.offline_bolt_sharp,
                                                                                            color: Color(0xFFFF0A00),
                                                                                            size: 20.0,
                                                                                          ),
                                                                                        ).animateOnActionTrigger(
                                                                                          animationsMap['containerOnActionTriggerAnimation2']!,
                                                                                        ),
                                                                                        Container(
                                                                                          width: 35.0,
                                                                                          height: 35.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Icon(
                                                                                            Icons.broken_image,
                                                                                            color: Color(0xFFF5A200),
                                                                                            size: 19.0,
                                                                                          ),
                                                                                        ).animateOnActionTrigger(
                                                                                          animationsMap['containerOnActionTriggerAnimation3']!,
                                                                                        ),
                                                                                        Container(
                                                                                          width: 35.0,
                                                                                          height: 35.0,
                                                                                          decoration: BoxDecoration(),
                                                                                          child: Icon(
                                                                                            Icons.waves,
                                                                                            color: Color(0xFF5283EB),
                                                                                            size: 18.0,
                                                                                          ),
                                                                                        ).animateOnActionTrigger(
                                                                                          animationsMap['containerOnActionTriggerAnimation4']!,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ).animateOnActionTrigger(
                                                                                animationsMap['containerOnActionTriggerAnimation1']!,
                                                                              ),
                                                                            ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                    if (FFAppState().showStatus)
                                      StreamBuilder<
                                          List<LeadsManagementRecord>>(
                                        stream: queryLeadsManagementRecord(
                                          parent: FFAppState().outletRef,
                                          queryBuilder:
                                              (leadsManagementRecord) =>
                                                  leadsManagementRecord
                                                      .where(
                                                        'status',
                                                        isEqualTo: FFAppState()
                                                                    .dropDownStatus !=
                                                                ''
                                                            ? FFAppState()
                                                                .dropDownStatus
                                                            : null,
                                                      )
                                                      .where(
                                                        'updatedDate',
                                                        isGreaterThan: functions
                                                            .getYest(FFAppState()
                                                                .selectedDate),
                                                      )
                                                      .where(
                                                        'updatedDate',
                                                        isLessThan: functions
                                                            .getTommorrow(
                                                                FFAppState()
                                                                    .selectedDate),
                                                      )
                                                      .orderBy('updatedDate',
                                                          descending: true),
                                        ),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (!snapshot.hasData) {
                                            return Center(
                                              child: SizedBox(
                                                width: 30.0,
                                                height: 30.0,
                                                child: SpinKitRing(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 30.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<LeadsManagementRecord>
                                              statusLeadLeadsManagementRecordList =
                                              snapshot.data!;

                                          return Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.9,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.05,
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.05,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFFE0E0),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                            shape: BoxShape
                                                                .rectangle,
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                valueOrDefault<
                                                                    String>(
                                                                  statusLeadLeadsManagementRecordList
                                                                      .length
                                                                      .toString(),
                                                                  '0',
                                                                ),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: double.infinity,
                                                  height:
                                                      MediaQuery.sizeOf(context)
                                                              .height *
                                                          0.8,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                  ),
                                                  child: Visibility(
                                                    visible:
                                                        FFAppState().showStatus,
                                                    child: Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0.0, 0.0),
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            15.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final statusList =
                                                                statusLeadLeadsManagementRecordList
                                                                    .map((e) =>
                                                                        e)
                                                                    .toList();
                                                            if (statusList
                                                                .isEmpty) {
                                                              return Center(
                                                                child:
                                                                    ListViewMsgWidget(),
                                                              );
                                                            }

                                                            return ListView
                                                                .builder(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  statusList
                                                                      .length,
                                                              itemBuilder: (context,
                                                                  statusListIndex) {
                                                                final statusListItem =
                                                                    statusList[
                                                                        statusListIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          9.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {},
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor1,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Stack(
                                                                          alignment: AlignmentDirectional(
                                                                              -1.0,
                                                                              1.0),
                                                                          children: [
                                                                            Align(
                                                                              alignment: AlignmentDirectional(0.0, 0.0),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: Stack(
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsets.all(3.0),
                                                                                                child: Container(
                                                                                                  width: 35.0,
                                                                                                  height: 35.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Icon(
                                                                                                    Icons.offline_bolt_sharp,
                                                                                                    color: Color(0xFFFF0A00),
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsets.all(3.0),
                                                                                                child: Container(
                                                                                                  width: 35.0,
                                                                                                  height: 35.0,
                                                                                                  decoration: BoxDecoration(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                  ),
                                                                                                  child: Icon(
                                                                                                    Icons.waves,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    size: 20.0,
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                          child: Stack(
                                                                                            children: [
                                                                                              Image.asset(
                                                                                                'assets/images/185-1853635_other-ask-a-question-icon-images-manager-question-icon.png',
                                                                                                width: 30.0,
                                                                                                height: 30.0,
                                                                                                fit: BoxFit.cover,
                                                                                              ),
                                                                                              if (statusListItem.source == 'Reference')
                                                                                                Image.asset(
                                                                                                  'assets/images/download.png',
                                                                                                  width: 30.0,
                                                                                                  height: 25.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                              if (statusListItem.source == 'Walk-in')
                                                                                                Image.asset(
                                                                                                  'assets/images/walking-icon-png-19.jpg',
                                                                                                  width: 30.0,
                                                                                                  height: 30.0,
                                                                                                  fit: BoxFit.cover,
                                                                                                ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 12,
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 3.0, 10.0, 0.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                                        child: ClipRRect(
                                                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                                                          child: Container(
                                                                                                            decoration: BoxDecoration(
                                                                                                              color: FlutterFlowTheme.of(context).accent4,
                                                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                                                              border: Border.all(
                                                                                                                color: FlutterFlowTheme.of(context).secondary,
                                                                                                                width: 1.0,
                                                                                                              ),
                                                                                                            ),
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsets.all(6.0),
                                                                                                              child: StreamBuilder<List<BusinessTypeRecord>>(
                                                                                                                stream: queryBusinessTypeRecord(
                                                                                                                  queryBuilder: (businessTypeRecord) => businessTypeRecord.where(
                                                                                                                    'id',
                                                                                                                    isEqualTo: valueOrDefault<String>(
                                                                                                                              statusListItem.businessType,
                                                                                                                              '#',
                                                                                                                            ) !=
                                                                                                                            ''
                                                                                                                        ? valueOrDefault<String>(
                                                                                                                            statusListItem.businessType,
                                                                                                                            '#',
                                                                                                                          )
                                                                                                                        : null,
                                                                                                                  ),
                                                                                                                  singleRecord: true,
                                                                                                                ),
                                                                                                                builder: (context, snapshot) {
                                                                                                                  // Customize what your widget looks like when it's loading.
                                                                                                                  if (!snapshot.hasData) {
                                                                                                                    return Center(
                                                                                                                      child: SizedBox(
                                                                                                                        width: 30.0,
                                                                                                                        height: 30.0,
                                                                                                                        child: SpinKitRing(
                                                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                                                          size: 30.0,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    );
                                                                                                                  }
                                                                                                                  List<BusinessTypeRecord> rowBusinessTypeRecordList = snapshot.data!;
                                                                                                                  // Return an empty Container when the item does not exist.
                                                                                                                  if (snapshot.data!.isEmpty) {
                                                                                                                    return Container();
                                                                                                                  }
                                                                                                                  final rowBusinessTypeRecord = rowBusinessTypeRecordList.isNotEmpty ? rowBusinessTypeRecordList.first : null;

                                                                                                                  return Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          statusListItem.businessName,
                                                                                                                          style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                                                                fontSize: 12.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      Text(
                                                                                                                        valueOrDefault<String>(
                                                                                                                                      rowBusinessTypeRecord?.name,
                                                                                                                                      '#',
                                                                                                                                    ) ==
                                                                                                                                    null ||
                                                                                                                                valueOrDefault<String>(
                                                                                                                                      rowBusinessTypeRecord?.name,
                                                                                                                                      '#',
                                                                                                                                    ) ==
                                                                                                                                    ''
                                                                                                                            ? '#'
                                                                                                                            : valueOrDefault<String>(
                                                                                                                                rowBusinessTypeRecord?.name,
                                                                                                                                '#',
                                                                                                                              ),
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              fontSize: 10.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                            ),
                                                                                                                      ),
                                                                                                                    ],
                                                                                                                  );
                                                                                                                },
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                      Container(
                                                                                                        constraints: BoxConstraints(
                                                                                                          maxWidth: MediaQuery.sizeOf(context).width * 0.12,
                                                                                                        ),
                                                                                                        decoration: BoxDecoration(),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                                child: Text(
                                                                                                                  statusListItem.username,
                                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                                        fontSize: 14.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                statusListItem.mobile,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        statusListItem.city,
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Text(
                                                                                              valueOrDefault<String>(
                                                                                                functions.leadsReq(statusListItem.requirement),
                                                                                                'Requirement not specified',
                                                                                              ),
                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                    color: Color(0xFF5283EB),
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              statusListItem.status,
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 3,
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                                  child: StreamBuilder<List<UserProfileRecord>>(
                                                                                                    stream: queryUserProfileRecord(
                                                                                                      queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                        'id',
                                                                                                        isEqualTo: statusListItem.assignedTo != '' ? statusListItem.assignedTo : null,
                                                                                                      ),
                                                                                                      singleRecord: true,
                                                                                                    ),
                                                                                                    builder: (context, snapshot) {
                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                      if (!snapshot.hasData) {
                                                                                                        return Center(
                                                                                                          child: SizedBox(
                                                                                                            width: 30.0,
                                                                                                            height: 30.0,
                                                                                                            child: SpinKitRing(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 30.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                      List<UserProfileRecord> containerUserProfileRecordList = snapshot.data!;
                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                        return Container();
                                                                                                      }
                                                                                                      final containerUserProfileRecord = containerUserProfileRecordList.isNotEmpty ? containerUserProfileRecordList.first : null;

                                                                                                      return Container(
                                                                                                        decoration: BoxDecoration(
                                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                          borderRadius: BorderRadius.circular(5.0),
                                                                                                          border: Border.all(
                                                                                                            color: FlutterFlowTheme.of(context).customColor1,
                                                                                                          ),
                                                                                                        ),
                                                                                                        child: Padding(
                                                                                                          padding: EdgeInsets.all(5.0),
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 6.0, 0.0),
                                                                                                                child: Icon(
                                                                                                                  Icons.person,
                                                                                                                  color: Color(0xFF003DC4),
                                                                                                                  size: 10.0,
                                                                                                                ),
                                                                                                              ),
                                                                                                              AutoSizeText(
                                                                                                                containerUserProfileRecord!.name.maybeHandleOverflow(
                                                                                                                  maxChars: 15,
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      color: Color(0xFF003DC4),
                                                                                                                      fontSize: 10.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'By : ',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).customColor3,
                                                                                                                fontSize: 10.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        ),
                                                                                                        StreamBuilder<List<UserProfileRecord>>(
                                                                                                          stream: queryUserProfileRecord(
                                                                                                            queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                              'id',
                                                                                                              isEqualTo: statusListItem.assignedBy,
                                                                                                            ),
                                                                                                            singleRecord: true,
                                                                                                          ),
                                                                                                          builder: (context, snapshot) {
                                                                                                            // Customize what your widget looks like when it's loading.
                                                                                                            if (!snapshot.hasData) {
                                                                                                              return Center(
                                                                                                                child: SizedBox(
                                                                                                                  width: 30.0,
                                                                                                                  height: 30.0,
                                                                                                                  child: SpinKitRing(
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    size: 30.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }
                                                                                                            List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                            // Return an empty Container when the item does not exist.
                                                                                                            if (snapshot.data!.isEmpty) {
                                                                                                              return Container();
                                                                                                            }
                                                                                                            final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                            return Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                textUserProfileRecord?.name,
                                                                                                                '\"',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).customColor3,
                                                                                                                    fontSize: 10.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 7.0, 0.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Created on : ',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                Text(
                                                                                                  statusListItem.date,
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                  child: Text(
                                                                                                    functions.dateToTime(statusListItem.createdDate),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          if (FFAppState().assignedExec)
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Last activity : ',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    functions.milisecToTimestamp(statusListItem.updatedDate),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                                        children: [
                                                                                          Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 40.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                    icon: Icon(
                                                                                                      Icons.call,
                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                      size: 12.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      await showModalBottomSheet(
                                                                                                        isScrollControlled: true,
                                                                                                        backgroundColor: Colors.transparent,
                                                                                                        barrierColor: Color(0x00000000),
                                                                                                        enableDrag: false,
                                                                                                        context: context,
                                                                                                        builder: (context) {
                                                                                                          return WebViewAware(
                                                                                                            child: GestureDetector(
                                                                                                              onTap: () {
                                                                                                                FocusScope.of(context).unfocus();
                                                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                                                              },
                                                                                                              child: Padding(
                                                                                                                padding: MediaQuery.viewInsetsOf(context),
                                                                                                                child: CallDetailsWidget(
                                                                                                                  id: statusListItem.id,
                                                                                                                  username: statusListItem.username,
                                                                                                                  mobile: statusListItem.mobile,
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      ).then((value) => safeSetState(() {}));
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                  child: Stack(
                                                                                                    children: [
                                                                                                      if (FFAppState().assignedExec)
                                                                                                        Align(
                                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                          child: FlutterFlowIconButton(
                                                                                                            borderColor: Colors.transparent,
                                                                                                            borderRadius: 30.0,
                                                                                                            borderWidth: 1.0,
                                                                                                            buttonSize: 40.0,
                                                                                                            fillColor: Color(0xFFD8E6FF),
                                                                                                            icon: Icon(
                                                                                                              Icons.line_weight_rounded,
                                                                                                              color: Color(0xFF003DC4),
                                                                                                              size: 13.0,
                                                                                                            ),
                                                                                                            onPressed: () async {
                                                                                                              await showModalBottomSheet(
                                                                                                                isScrollControlled: true,
                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                barrierColor: Color(0x00000000),
                                                                                                                enableDrag: false,
                                                                                                                context: context,
                                                                                                                builder: (context) {
                                                                                                                  return WebViewAware(
                                                                                                                    child: GestureDetector(
                                                                                                                      onTap: () {
                                                                                                                        FocusScope.of(context).unfocus();
                                                                                                                        FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                      },
                                                                                                                      child: Padding(
                                                                                                                        padding: MediaQuery.viewInsetsOf(context),
                                                                                                                        child: AddFollowUpWidget(
                                                                                                                          leadMRefid: statusListItem.id,
                                                                                                                          username: statusListItem.username,
                                                                                                                          mobile: statusListItem.mobile,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  );
                                                                                                                },
                                                                                                              ).then((value) => safeSetState(() {}));
                                                                                                            },
                                                                                                          ),
                                                                                                        ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                  child: FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 40.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).secondary,
                                                                                                    icon: Icon(
                                                                                                      Icons.read_more,
                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                      size: 20.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      if (statusListItem.status == 'Unread') {
                                                                                                        return;
                                                                                                      }

                                                                                                      context.pushNamed(
                                                                                                        LeadLogWidget.routeName,
                                                                                                        queryParameters: {
                                                                                                          'id': serializeParam(
                                                                                                            statusListItem.id,
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'username': serializeParam(
                                                                                                            statusListItem.username,
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'mobile': serializeParam(
                                                                                                            statusListItem.mobile,
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'state': serializeParam(
                                                                                                            statusListItem.state,
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'source': serializeParam(
                                                                                                            statusListItem.source,
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'requirement': serializeParam(
                                                                                                            statusListItem.requirement,
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'area': serializeParam(
                                                                                                            statusListItem.area,
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                          'city': serializeParam(
                                                                                                            statusListItem.city,
                                                                                                            ParamType.String,
                                                                                                          ),
                                                                                                        }.withoutNulls,
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                          TestDropdownWidget(
                                                                                            key: Key('Key27k_${statusListIndex}_of_${statusList.length}'),
                                                                                            ref: getJsonField(
                                                                                              functions.docToJson(statusListItem),
                                                                                              r'''$''',
                                                                                            ),
                                                                                            flag: 1,
                                                                                            isSearching: false,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            if (responsiveVisibility(
                                                                              context: context,
                                                                              desktop: false,
                                                                            ))
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 5.0),
                                                                                child: ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(15.0),
                                                                                  child: Container(
                                                                                    height: 40.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          blurRadius: 7.0,
                                                                                          color: FlutterFlowTheme.of(context).customColor3,
                                                                                          offset: Offset(
                                                                                            3.0,
                                                                                            5.0,
                                                                                          ),
                                                                                        )
                                                                                      ],
                                                                                      borderRadius: BorderRadius.circular(15.0),
                                                                                      border: Border.all(
                                                                                        color: FlutterFlowTheme.of(context).backgroundComponants,
                                                                                      ),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 5.0, 0.0),
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.min,
                                                                                        children: [
                                                                                          Container(
                                                                                            width: 35.0,
                                                                                            height: 35.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Icon(
                                                                                              Icons.offline_bolt_sharp,
                                                                                              color: Color(0xFFFF0A00),
                                                                                              size: 20.0,
                                                                                            ),
                                                                                          ).animateOnActionTrigger(
                                                                                            animationsMap['containerOnActionTriggerAnimation6']!,
                                                                                          ),
                                                                                          Container(
                                                                                            width: 35.0,
                                                                                            height: 35.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Icon(
                                                                                              Icons.broken_image,
                                                                                              color: Color(0xFFF5A200),
                                                                                              size: 19.0,
                                                                                            ),
                                                                                          ).animateOnActionTrigger(
                                                                                            animationsMap['containerOnActionTriggerAnimation7']!,
                                                                                          ),
                                                                                          Container(
                                                                                            width: 35.0,
                                                                                            height: 35.0,
                                                                                            decoration: BoxDecoration(),
                                                                                            child: Icon(
                                                                                              Icons.waves,
                                                                                              color: Color(0xFF5283EB),
                                                                                              size: 18.0,
                                                                                            ),
                                                                                          ).animateOnActionTrigger(
                                                                                            animationsMap['containerOnActionTriggerAnimation8']!,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ).animateOnActionTrigger(
                                                                                  animationsMap['containerOnActionTriggerAnimation5']!,
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
