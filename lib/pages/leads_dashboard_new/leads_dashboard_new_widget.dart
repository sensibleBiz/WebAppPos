import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/deye_c_r_m/lead_activity_update/lead_activity_update_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/assign_lead_dealer/assign_lead_dealer_widget.dart';
import '/pages/components/c_header/c_header_widget.dart';
import '/pages/components/call_details/call_details_widget.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import '/pages/components/dis_qualify_lead_copy/dis_qualify_lead_copy_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/message_box/message_box_widget.dart';
import '/pages/components/schedule/schedule_widget.dart';
import '/pages/components/update_stage_dropdown_new/update_stage_dropdown_new_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'leads_dashboard_new_model.dart';
export 'leads_dashboard_new_model.dart';

class LeadsDashboardNewWidget extends StatefulWidget {
  const LeadsDashboardNewWidget({super.key});

  static String routeName = 'LeadsDashboardNew';
  static String routePath = 'LeadsDashboardNew';

  @override
  State<LeadsDashboardNewWidget> createState() =>
      _LeadsDashboardNewWidgetState();
}

class _LeadsDashboardNewWidgetState extends State<LeadsDashboardNewWidget>
    with TickerProviderStateMixin {
  late LeadsDashboardNewModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadsDashboardNewModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().startDate = functions.lastDays(7);
      FFAppState().endDate = functions.tommarow();
      safeSetState(() {});
      _model.showNewTab = true;
      safeSetState(() {});
    });

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: false,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
            begin: Offset(2000.0, 0.0),
            end: Offset(0.0, 0.0),
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
        title: 'LeadsDashboardNew',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Stack(
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    wrapWithModel(
                      model: _model.cHeaderModel,
                      updateCallback: () => safeSetState(() {}),
                      child: CHeaderWidget(),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            StreamBuilder<List<LeadActivitiesRecord>>(
                              stream: queryLeadActivitiesRecord(
                                parent: FFAppState().outletRef,
                                queryBuilder: (leadActivitiesRecord) =>
                                    leadActivitiesRecord
                                        .where(
                                          'status',
                                          isEqualTo: 'PENDING',
                                        )
                                        .where(
                                          'scheduledDate',
                                          isLessThan: functions.tommarow(),
                                        ),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 30.0,
                                      height: 30.0,
                                      child: SpinKitRing(
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 30.0,
                                      ),
                                    ),
                                  );
                                }
                                List<LeadActivitiesRecord>
                                    containerLeadActivitiesRecordList =
                                    snapshot.data!;

                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(0.0),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(0.0),
                                    ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 25.0, 0.0),
                                              child: Text(
                                                ' Dashboard',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLargeIsCustom,
                                                        ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    65.0, 0.0, 0.0, 0.0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Builder(
                                                  builder: (context) =>
                                                      FlutterFlowIconButton(
                                                    borderRadius: 8.0,
                                                    buttonSize: 40.0,
                                                    icon: Icon(
                                                      Icons
                                                          .calendar_month_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primary,
                                                      size: 24.0,
                                                    ),
                                                    onPressed: () async {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (dialogContext) {
                                                          return Dialog(
                                                            elevation: 0,
                                                            insetPadding:
                                                                EdgeInsets.zero,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                            alignment: AlignmentDirectional(
                                                                    0.0, 0.0)
                                                                .resolve(
                                                                    Directionality.of(
                                                                        context)),
                                                            child: WebViewAware(
                                                              child:
                                                                  GestureDetector(
                                                                onTap: () {
                                                                  FocusScope.of(
                                                                          dialogContext)
                                                                      .unfocus();
                                                                  FocusManager
                                                                      .instance
                                                                      .primaryFocus
                                                                      ?.unfocus();
                                                                },
                                                                child:
                                                                    CustomDateRangeWidget(),
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 25.0, 0.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        "yMMMd",
                                                        DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                FFAppState()
                                                                    .startDate)),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLargeIsCustom,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 25.0, 0.0),
                                                  child: Text(
                                                    '-',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLargeIsCustom,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          10.0, 0.0, 25.0, 0.0),
                                                  child: Text(
                                                    dateTimeFormat(
                                                        "yMMMd",
                                                        DateTime
                                                            .fromMillisecondsSinceEpoch(
                                                                FFAppState()
                                                                    .endDate)),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily,
                                                          fontSize: 14.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineLargeIsCustom,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 15.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  15.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 10.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        icon: Icon(
                                                          Icons.fact_check,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 22.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.goNamed(
                                                              FollowUpsWidget
                                                                  .routeName);
                                                        },
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .warning,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                containerLeadActivitiesRecordList
                                                                    .where((e) =>
                                                                        e.type ==
                                                                        'Follow Up')
                                                                    .toList()
                                                                    .length
                                                                    .toString(),
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
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  15.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 10.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        icon: Icon(
                                                          Icons.devices,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 22.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.goNamed(
                                                              DemosWidget
                                                                  .routeName);
                                                        },
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .warning,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  6.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                containerLeadActivitiesRecordList
                                                                    .where((e) =>
                                                                        e.type ==
                                                                        'Demo')
                                                                    .toList()
                                                                    .length
                                                                    .toString(),
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
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: Stack(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1.0, -1.0),
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  10.0,
                                                                  15.0,
                                                                  0.0),
                                                      child:
                                                          FlutterFlowIconButton(
                                                        borderColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        borderRadius: 10.0,
                                                        borderWidth: 1.0,
                                                        buttonSize: 40.0,
                                                        fillColor: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        icon: Icon(
                                                          Icons.wifi_calling_3,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primary,
                                                          size: 24.0,
                                                        ),
                                                        onPressed: () async {
                                                          context.pushNamed(
                                                              RingingLeadsWidget
                                                                  .routeName);
                                                        },
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          AlignmentDirectional(
                                                              1.0, -1.0),
                                                      child: StreamBuilder<
                                                          List<
                                                              OutletLeadsRecord>>(
                                                        stream:
                                                            queryOutletLeadsRecord(
                                                          parent: FFAppState()
                                                              .outletRef,
                                                          queryBuilder:
                                                              (outletLeadsRecord) =>
                                                                  outletLeadsRecord
                                                                      .where(
                                                            'status',
                                                            isEqualTo:
                                                                'ringing',
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 30.0,
                                                                height: 30.0,
                                                                child:
                                                                    SpinKitRing(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  size: 30.0,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<OutletLeadsRecord>
                                                              containerOutletLeadsRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .warning,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(6.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    containerOutletLeadsRecordList
                                                                        .length
                                                                        .toString(),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    Icons.add,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 22.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                        AddNewLeadWidget
                                                            .routeName);
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    Icons.groups_outlined,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 25.0,
                                                  ),
                                                  onPressed: () async {
                                                    context.pushNamed(
                                                        DealerDashboardWidget
                                                            .routeName);
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 10.0, 0.0),
                                                child: FlutterFlowIconButton(
                                                  borderColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .primary,
                                                  borderRadius: 10.0,
                                                  borderWidth: 1.0,
                                                  buttonSize: 40.0,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  icon: Icon(
                                                    Icons.more_vert,
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 22.0,
                                                  ),
                                                  onPressed: () async {
                                                    _model.showMore = true;
                                                    safeSetState(() {});
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                            Expanded(
                              flex: 26,
                              child: StreamBuilder<List<LeadsManagementRecord>>(
                                stream: queryLeadsManagementRecord(
                                  parent: FFAppState().outletRef,
                                  queryBuilder: (leadsManagementRecord) =>
                                      leadsManagementRecord
                                          .where(
                                            'createdDate',
                                            isGreaterThanOrEqualTo:
                                                FFAppState().startDate,
                                          )
                                          .where(
                                            'createdDate',
                                            isLessThan: FFAppState().endDate,
                                          )
                                          .orderBy('createdDate',
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<LeadsManagementRecord>
                                      containerMainLeadsManagementRecordList =
                                      snapshot.data!;

                                  return Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(),
                                    child:
                                        StreamBuilder<List<OutletLeadsRecord>>(
                                      stream: queryOutletLeadsRecord(
                                        parent: FFAppState().outletRef,
                                        queryBuilder: (outletLeadsRecord) =>
                                            outletLeadsRecord
                                                .where(
                                                  'logId',
                                                  isGreaterThanOrEqualTo:
                                                      functions.lastDays(15),
                                                )
                                                .where(
                                                  'status',
                                                  isEqualTo: 'Unread',
                                                )
                                                .orderBy('logId',
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<OutletLeadsRecord>
                                            containerMain1OutletLeadsRecordList =
                                            snapshot.data!;

                                        return Container(
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 5.0),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Container(
                                                        width: 180.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .leadCreateValue ==
                                                                    'Unread'
                                                                ? FlutterFlowTheme.of(
                                                                        context)
                                                                    .info
                                                                : Color(
                                                                    0x00000000),
                                                            width: 3.0,
                                                          ),
                                                        ),
                                                        child: Container(
                                                          width:
                                                              double.infinity,
                                                          color:
                                                              Color(0x00000000),
                                                          child:
                                                              ExpandableNotifier(
                                                            controller: _model
                                                                .expandableExpandableController1,
                                                            child:
                                                                ExpandablePanel(
                                                              header: InkWell(
                                                                splashColor: Colors
                                                                    .transparent,
                                                                focusColor: Colors
                                                                    .transparent,
                                                                hoverColor: Colors
                                                                    .transparent,
                                                                highlightColor:
                                                                    Colors
                                                                        .transparent,
                                                                onTap:
                                                                    () async {
                                                                  _model.showNewTab =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .leadCreateValue =
                                                                      'Unread';
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10.0,
                                                                            25.0,
                                                                            10.0,
                                                                            25.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'New',
                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    fontWeight: FontWeight.w600,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                              child: Text(
                                                                                containerMain1OutletLeadsRecordList.length.toString(),
                                                                                style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).customColor4,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              collapsed:
                                                                  Container(),
                                                              expanded:
                                                                  Visibility(
                                                                visible: false,
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width: double
                                                                          .infinity,
                                                                      height:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            5.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'IndiaMart',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '0',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'JustDial',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '0',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'Facebook',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '0',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'Quick Add',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    '0',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              theme:
                                                                  ExpandableThemeData(
                                                                tapHeaderToExpand:
                                                                    true,
                                                                tapBodyToExpand:
                                                                    false,
                                                                tapBodyToCollapse:
                                                                    false,
                                                                headerAlignment:
                                                                    ExpandablePanelHeaderAlignment
                                                                        .center,
                                                                hasIcon: true,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  StreamBuilder<
                                                      List<LeadStagesRecord>>(
                                                    stream:
                                                        queryLeadStagesRecord(
                                                      parent: FFAppState()
                                                          .outletRef,
                                                      queryBuilder:
                                                          (leadStagesRecord) =>
                                                              leadStagesRecord
                                                                  .orderBy(
                                                                      'code'),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
                                                      // Customize what your widget looks like when it's loading.
                                                      if (!snapshot.hasData) {
                                                        return Center(
                                                          child: SizedBox(
                                                            width: 30.0,
                                                            height: 30.0,
                                                            child: SpinKitRing(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 30.0,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<LeadStagesRecord>
                                                          leadsTabsLeadStagesRecordList =
                                                          snapshot.data!;

                                                      return Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            leadsTabsLeadStagesRecordList
                                                                .length,
                                                            (leadsTabsIndex) {
                                                          final leadsTabsLeadStagesRecord =
                                                              leadsTabsLeadStagesRecordList[
                                                                  leadsTabsIndex];
                                                          return ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                            child: Container(
                                                              width: 180.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: () {
                                                                  if (leadsTabsLeadStagesRecord
                                                                          .name ==
                                                                      'assigned') {
                                                                    return Color(
                                                                        0xFFAEC4F2);
                                                                  } else if (leadsTabsLeadStagesRecord
                                                                          .name ==
                                                                      'followup') {
                                                                    return Color(
                                                                        0xFFE3D4A9);
                                                                  } else if (leadsTabsLeadStagesRecord
                                                                          .name ==
                                                                      'completed') {
                                                                    return Color(
                                                                        0xFFA6E0B8);
                                                                  } else if (leadsTabsLeadStagesRecord
                                                                          .name ==
                                                                      'lost') {
                                                                    return Color(
                                                                        0xFFDCB2C6);
                                                                  } else {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground;
                                                                  }
                                                                }(),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                border:
                                                                    Border.all(
                                                                  color: leadsTabsLeadStagesRecord
                                                                              .name ==
                                                                          FFAppState()
                                                                              .leadCreateValue
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .info
                                                                      : FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBackground,
                                                                  width: 3.0,
                                                                ),
                                                              ),
                                                              child: Container(
                                                                width: double
                                                                    .infinity,
                                                                color: Color(
                                                                    0x00000000),
                                                                child:
                                                                    ExpandableNotifier(
                                                                  initialExpanded:
                                                                      false,
                                                                  child:
                                                                      ExpandablePanel(
                                                                    header:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              2.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          _model.showNewTab =
                                                                              false;
                                                                          safeSetState(
                                                                              () {});
                                                                          FFAppState().leadCreateValue =
                                                                              leadsTabsLeadStagesRecord.name;
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                25.0,
                                                                                10.0,
                                                                                25.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                  children: [
                                                                                    Text(
                                                                                      leadsTabsLeadStagesRecord.display,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                                                                      child: Text(
                                                                                        containerMainLeadsManagementRecordList.where((e) => e.stage == leadsTabsLeadStagesRecord.name).toList().length.toString(),
                                                                                        style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    collapsed:
                                                                        Container(),
                                                                    expanded:
                                                                        Visibility(
                                                                      visible:
                                                                          false,
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                100.0,
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 10.0, 10.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Call Pending',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          '0',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Demo Pending',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          '0',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Demo Sceduled',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          '0',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 3.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                      children: [
                                                                                        Text(
                                                                                          'Called',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                        Text(
                                                                                          '0',
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    theme:
                                                                        ExpandableThemeData(
                                                                      tapHeaderToExpand:
                                                                          true,
                                                                      tapBodyToExpand:
                                                                          false,
                                                                      tapBodyToCollapse:
                                                                          false,
                                                                      headerAlignment:
                                                                          ExpandablePanelHeaderAlignment
                                                                              .center,
                                                                      hasIcon:
                                                                          true,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          );
                                                        }).divide(SizedBox(
                                                            height: 5.0)),
                                                      );
                                                    },
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        8.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: 58.0,
                                                              height: 60.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFF041773),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                                border:
                                                                    Border.all(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                              ),
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
                                                                child: Text(
                                                                  (_model.isSearched
                                                                          ? functions.filteredLeadsForReports(
                                                                              containerMainLeadsManagementRecordList.toList(),
                                                                              _model.dropDownAssignedToValue != null && _model.dropDownAssignedToValue != '' ? _model.dropDownAssignedToValue : '',
                                                                              _model.textController.text != null && _model.textController.text != '' ? _model.textController.text : '',
                                                                              _model.dropDownValue != null && _model.dropDownValue != '' ? _model.dropDownValue : '',
                                                                              _model.dropDownRemarksValue != null && _model.dropDownRemarksValue != '' ? _model.dropDownRemarksValue : '',
                                                                              FFAppState().leadCreateValue,
                                                                              _model.dropDownSourceValue != null && _model.dropDownSourceValue != '' ? _model.dropDownSourceValue : '')
                                                                          : containerMainLeadsManagementRecordList)
                                                                      .length
                                                                      .toString(),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBackground,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          if (responsiveVisibility(
                                                            context: context,
                                                            phone: false,
                                                            tablet: false,
                                                          ))
                                                            Expanded(
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            15.0),
                                                                child:
                                                                    Container(
                                                                  width: double
                                                                      .infinity,
                                                                  height: MediaQuery.sizeOf(
                                                                              context)
                                                                          .height *
                                                                      0.07,
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.sizeOf(context)
                                                                            .width *
                                                                        1.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              10.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.end,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                              child: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: StreamBuilder<List<TeamTreeRecord>>(
                                                                                        stream: queryTeamTreeRecord(
                                                                                          parent: FFAppState().outletRef,
                                                                                          queryBuilder: (teamTreeRecord) => teamTreeRecord
                                                                                              .where(
                                                                                                'isActive',
                                                                                                isEqualTo: true,
                                                                                              )
                                                                                              .where(
                                                                                                'team',
                                                                                                isEqualTo: 'Sales',
                                                                                              ),
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
                                                                                          List<TeamTreeRecord> dropDownAssignedToTeamTreeRecordList = snapshot.data!;

                                                                                          return FlutterFlowDropDown<String>(
                                                                                            controller: _model.dropDownAssignedToValueController ??= FormFieldController<String>(
                                                                                              _model.dropDownAssignedToValue ??= '',
                                                                                            ),
                                                                                            options: List<String>.from(dropDownAssignedToTeamTreeRecordList.map((e) => e.userProfileId).toList()),
                                                                                            optionLabels: dropDownAssignedToTeamTreeRecordList.map((e) => e.userName).toList(),
                                                                                            onChanged: (val) => safeSetState(() => _model.dropDownAssignedToValue = val),
                                                                                            width: 250.0,
                                                                                            height: 50.0,
                                                                                            searchHintTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                            searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                            hintText: ' AssignedTo',
                                                                                            searchHintText: 'Search for an item...',
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_arrow_down_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 2.0,
                                                                                            borderColor: FlutterFlowTheme.of(context).customColor1,
                                                                                            borderWidth: 1.0,
                                                                                            borderRadius: 8.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 5.0, 4.0),
                                                                                            hidesUnderline: true,
                                                                                            isOverButton: true,
                                                                                            isSearchable: true,
                                                                                            isMultiSelect: false,
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: StreamBuilder<List<LeadStagesRecord>>(
                                                                                        stream: queryLeadStagesRecord(
                                                                                          parent: FFAppState().outletRef,
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
                                                                                          List<LeadStagesRecord> dropDownRemarksLeadStagesRecordList = snapshot.data!;

                                                                                          return FlutterFlowDropDown<String>(
                                                                                            controller: _model.dropDownRemarksValueController ??= FormFieldController<String>(null),
                                                                                            options: FFAppConstants.LeadRemarks,
                                                                                            onChanged: (val) => safeSetState(() => _model.dropDownRemarksValue = val),
                                                                                            height: 50.0,
                                                                                            searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                ),
                                                                                            searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                            hintText: 'Remarks',
                                                                                            searchHintText: 'Search for an item...',
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_arrow_down_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 2.0,
                                                                                            borderColor: FlutterFlowTheme.of(context).customColor1,
                                                                                            borderWidth: 1.0,
                                                                                            borderRadius: 8.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 10.0, 4.0),
                                                                                            hidesUnderline: true,
                                                                                            isOverButton: false,
                                                                                            isSearchable: true,
                                                                                            isMultiSelect: false,
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: StreamBuilder<List<LeadStagesRecord>>(
                                                                                        stream: queryLeadStagesRecord(
                                                                                          parent: FFAppState().outletRef,
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
                                                                                          List<LeadStagesRecord> dropDownSourceLeadStagesRecordList = snapshot.data!;

                                                                                          return FlutterFlowDropDown<String>(
                                                                                            controller: _model.dropDownSourceValueController ??= FormFieldController<String>(
                                                                                              _model.dropDownSourceValue ??= '',
                                                                                            ),
                                                                                            options: List<String>.from(FFAppConstants.LeadSources),
                                                                                            optionLabels: FFAppConstants.LeadSources,
                                                                                            onChanged: (val) => safeSetState(() => _model.dropDownSourceValue = val),
                                                                                            height: 50.0,
                                                                                            searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                ),
                                                                                            searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                ),
                                                                                            hintText: 'Source',
                                                                                            searchHintText: 'Search for an item...',
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_arrow_down_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 16.0,
                                                                                            ),
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 2.0,
                                                                                            borderColor: FlutterFlowTheme.of(context).customColor1,
                                                                                            borderWidth: 1.0,
                                                                                            borderRadius: 8.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(10.0, 4.0, 10.0, 4.0),
                                                                                            hidesUnderline: true,
                                                                                            isOverButton: true,
                                                                                            isSearchable: true,
                                                                                            isMultiSelect: false,
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: FlutterFlowDropDown<String>(
                                                                                        controller: _model.dropDownValueController ??= FormFieldController<String>(null),
                                                                                        options: [
                                                                                          'Mobile',
                                                                                          'City'
                                                                                        ],
                                                                                        onChanged: (val) => safeSetState(() => _model.dropDownValue = val),
                                                                                        width: 150.0,
                                                                                        height: 50.0,
                                                                                        textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                        hintText: 'Select Filter',
                                                                                        icon: Icon(
                                                                                          Icons.keyboard_arrow_down_rounded,
                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                          size: 20.0,
                                                                                        ),
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        elevation: 2.0,
                                                                                        borderColor: FlutterFlowTheme.of(context).customColor1,
                                                                                        borderWidth: 0.0,
                                                                                        borderRadius: 8.0,
                                                                                        margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
                                                                                        hidesUnderline: true,
                                                                                        isOverButton: false,
                                                                                        isSearchable: false,
                                                                                        isMultiSelect: false,
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 2,
                                                                                      child: Container(
                                                                                        width: 150.0,
                                                                                        child: TextFormField(
                                                                                          controller: _model.textController,
                                                                                          focusNode: _model.textFieldFocusNode,
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            isDense: true,
                                                                                            labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).text2nd,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).customColor1,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            errorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: FlutterFlowTheme.of(context).error,
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            filled: true,
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                          cursorColor: FlutterFlowTheme.of(context).primaryText,
                                                                                          validator: _model.textControllerValidator.asValidator(context),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    FlutterFlowIconButton(
                                                                                      borderRadius: 8.0,
                                                                                      buttonSize: 40.0,
                                                                                      fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                      icon: Icon(
                                                                                        Icons.done_sharp,
                                                                                        color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                        size: 21.0,
                                                                                      ),
                                                                                      onPressed: () async {
                                                                                        _model.isSearched = true;
                                                                                        safeSetState(() {});
                                                                                      },
                                                                                    ),
                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          FlutterFlowIconButton(
                                                                            borderRadius:
                                                                                8.0,
                                                                            buttonSize:
                                                                                40.0,
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            icon:
                                                                                Icon(
                                                                              Icons.close_sharp,
                                                                              color: FlutterFlowTheme.of(context).primaryBackground,
                                                                              size: 21.0,
                                                                            ),
                                                                            onPressed:
                                                                                () async {
                                                                              safeSetState(() {
                                                                                _model.dropDownRemarksValueController?.reset();
                                                                                _model.dropDownAssignedToValueController?.reset();
                                                                                _model.dropDownSourceValueController?.reset();
                                                                                _model.dropDownValueController?.reset();
                                                                              });
                                                                              safeSetState(() {
                                                                                _model.textController?.clear();
                                                                              });
                                                                              _model.isSearched = false;
                                                                              safeSetState(() {});
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ).animateOnActionTrigger(
                                                                          animationsMap[
                                                                              'containerOnActionTriggerAnimation']!,
                                                                          hasBeenTriggered:
                                                                              hasContainerTriggered),
                                                                ),
                                                              ),
                                                            ),
                                                        ],
                                                      ),
                                                      Expanded(
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Expanded(
                                                              flex: 11,
                                                              child: Stack(
                                                                children: [
                                                                  if (_model
                                                                      .showNewTab)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final newleadList =
                                                                                containerMain1OutletLeadsRecordList.toList();
                                                                            if (newleadList.isEmpty) {
                                                                              return ListViewMsgWidget();
                                                                            }

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: newleadList.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                              itemBuilder: (context, newleadListIndex) {
                                                                                final newleadListItem = newleadList[newleadListIndex];
                                                                                return Container(
                                                                                  width: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                    border: Border.all(
                                                                                      color: FlutterFlowTheme.of(context).customColor1,
                                                                                      width: 1.0,
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(15.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          flex: 14,
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.start,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      flex: 2,
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                            child: Stack(
                                                                                                              children: [
                                                                                                                if (newleadListItem.source == 'Reference')
                                                                                                                  Image.asset(
                                                                                                                    'assets/images/oie_5zbZfOBU0qjG.png',
                                                                                                                    width: 30.0,
                                                                                                                    height: 25.0,
                                                                                                                    fit: BoxFit.contain,
                                                                                                                  ),
                                                                                                                if (newleadListItem.source == 'Other')
                                                                                                                  Align(
                                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                    child: Image.asset(
                                                                                                                      'assets/images/oie_UzeNLLv9VG1T.png',
                                                                                                                      width: 30.0,
                                                                                                                      height: 30.0,
                                                                                                                      fit: BoxFit.contain,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (newleadListItem.source == 'WalkIn')
                                                                                                                  Image.asset(
                                                                                                                    'assets/images/oie_nD4zy5Fy6lde.png',
                                                                                                                    width: 30.0,
                                                                                                                    height: 30.0,
                                                                                                                    fit: BoxFit.contain,
                                                                                                                  ),
                                                                                                                if (newleadListItem.source == 'Facebook')
                                                                                                                  ClipRRect(
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                    child: Image.asset(
                                                                                                                      'assets/images/facebook.png',
                                                                                                                      width: 30.0,
                                                                                                                      height: 30.0,
                                                                                                                      fit: BoxFit.contain,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (newleadListItem.source == 'Indiamart')
                                                                                                                  ClipRRect(
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                    child: Image.asset(
                                                                                                                      'assets/images/INDIAMART.NS-ecf147e0.png',
                                                                                                                      width: 30.0,
                                                                                                                      height: 30.0,
                                                                                                                      fit: BoxFit.contain,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (newleadListItem.source == 'JustDail')
                                                                                                                  ClipRRect(
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                    child: Image.asset(
                                                                                                                      'assets/images/JustDial.png',
                                                                                                                      width: 30.0,
                                                                                                                      height: 30.0,
                                                                                                                      fit: BoxFit.contain,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                if (newleadListItem.source == 'Website')
                                                                                                                  ClipRRect(
                                                                                                                    borderRadius: BorderRadius.circular(8.0),
                                                                                                                    child: Image.asset(
                                                                                                                      'assets/images/5602732.png',
                                                                                                                      width: 30.0,
                                                                                                                      height: 30.0,
                                                                                                                      fit: BoxFit.contain,
                                                                                                                    ),
                                                                                                                  ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                            child: ClipRRect(
                                                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                                                              child: Container(
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                                  border: Border.all(
                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsets.all(6.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                                    children: [
                                                                                                                      SelectionArea(
                                                                                                                          child: Text(
                                                                                                                        newleadListItem.ticket,
                                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                              color: Color(0xFF5283EB),
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                            ),
                                                                                                                      )),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            newleadListItem.username,
                                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                    Expanded(
                                                                                                      flex: 1,
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            flex: 2,
                                                                                                            child: Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                              child: SelectionArea(
                                                                                                                  child: AutoSizeText(
                                                                                                                newleadListItem.mobile,
                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                      color: Color(0xFFE75007),
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                                    ),
                                                                                                              )),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            flex: 3,
                                                                                                            child: Text(
                                                                                                              newleadListItem.city,
                                                                                                              textAlign: TextAlign.end,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    fontSize: 13.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                child: Container(
                                                                                                  width: double.infinity,
                                                                                                  decoration: BoxDecoration(),
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      SelectionArea(
                                                                                                          child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          functions.leadsReq(newleadListItem.requirement),
                                                                                                          'Requirement not specified',
                                                                                                        ),
                                                                                                        textAlign: TextAlign.start,
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              color: Color(0xFF5283EB),
                                                                                                              fontSize: 13.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Align(
                                                                                          alignment: AlignmentDirectional(0.0, 0.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            crossAxisAlignment: CrossAxisAlignment.center,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                                      child: SelectionArea(
                                                                                                          child: Text(
                                                                                                        newleadListItem.businessName,
                                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                              color: Color(0xFF5283EB),
                                                                                                              fontSize: 13.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ),
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      newleadListItem.businessType,
                                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                            color: Color(0xFF5283EB),
                                                                                                            fontSize: 13.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Campaign Name : ',
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    newleadListItem.leadCampaign,
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Created On :',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          fontSize: 11.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      newleadListItem.createdDateTime?.toString(),
                                                                                                      '-',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 15.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    FFAppState().changeAssignedFlag = false;
                                                                                                    safeSetState(() {});
                                                                                                    await showModalBottomSheet(
                                                                                                      isScrollControlled: true,
                                                                                                      backgroundColor: Colors.transparent,
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
                                                                                                              child: AssignLeadDealerWidget(
                                                                                                                mobile: newleadListItem.mobile,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xE1DFFFE9),
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
                                                                                                              Icons.done,
                                                                                                              color: FlutterFlowTheme.of(context).success,
                                                                                                              size: 16.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'Qualify Lead',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).success,
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    _model.user = await queryUserProfileRecordOnce(
                                                                                                      queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                        'id',
                                                                                                        isEqualTo: FFAppState().logedInUserRef?.id,
                                                                                                      ),
                                                                                                      singleRecord: true,
                                                                                                    ).then((s) => s.firstOrNull);
                                                                                                    await showModalBottomSheet(
                                                                                                      isScrollControlled: true,
                                                                                                      backgroundColor: Colors.transparent,
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
                                                                                                              child: DisQualifyLeadCopyWidget(
                                                                                                                userProfile: _model.user,
                                                                                                                outletLeadDoc: newleadListItem,
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => safeSetState(() {}));

                                                                                                    safeSetState(() {});
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFFFDDDD),
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
                                                                                                              Icons.close,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 16.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'Disqualify Lead',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                  fontSize: 12.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                                InkWell(
                                                                                                  splashColor: Colors.transparent,
                                                                                                  focusColor: Colors.transparent,
                                                                                                  hoverColor: Colors.transparent,
                                                                                                  highlightColor: Colors.transparent,
                                                                                                  onTap: () async {
                                                                                                    var confirmDialogResponse = await showDialog<bool>(
                                                                                                          context: context,
                                                                                                          builder: (alertDialogContext) {
                                                                                                            return WebViewAware(
                                                                                                              child: AlertDialog(
                                                                                                                title: Text('Confirmation Meassge!!'),
                                                                                                                content: Text('Are you sure you want to mark ringing ?'),
                                                                                                                actions: [
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, false),
                                                                                                                    child: Text('Cancel'),
                                                                                                                  ),
                                                                                                                  TextButton(
                                                                                                                    onPressed: () => Navigator.pop(alertDialogContext, true),
                                                                                                                    child: Text('Confirm'),
                                                                                                                  ),
                                                                                                                ],
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ) ??
                                                                                                        false;
                                                                                                    if (confirmDialogResponse) {
                                                                                                      await newleadListItem.reference.update(createOutletLeadsRecordData(
                                                                                                        status: 'ringing',
                                                                                                      ));
                                                                                                      await showDialog(
                                                                                                        context: context,
                                                                                                        builder: (alertDialogContext) {
                                                                                                          return WebViewAware(
                                                                                                            child: AlertDialog(
                                                                                                              title: Text('Lead Status !!'),
                                                                                                              content: Text('The lead has been successfully marked as “Ringing”. '),
                                                                                                              actions: [
                                                                                                                TextButton(
                                                                                                                  onPressed: () => Navigator.pop(alertDialogContext),
                                                                                                                  child: Text('Ok'),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          );
                                                                                                        },
                                                                                                      );
                                                                                                    }
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    decoration: BoxDecoration(
                                                                                                      color: Color(0xFFF3EA84),
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
                                                                                                              Icons.ring_volume_rounded,
                                                                                                              color: Color(0xF6A58F06),
                                                                                                              size: 16.0,
                                                                                                            ),
                                                                                                          ),
                                                                                                          Text(
                                                                                                            'Mark Ringing',
                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                  color: Color(0xF6A58F06),
                                                                                                                  fontSize: 11.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 10.0)),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    if (FFAppState().hide &&
                                                                                                        responsiveVisibility(
                                                                                                          context: context,
                                                                                                          phone: false,
                                                                                                          tablet: false,
                                                                                                          tabletLandscape: false,
                                                                                                        ))
                                                                                                      FlutterFlowIconButton(
                                                                                                        borderColor: Colors.transparent,
                                                                                                        borderRadius: 30.0,
                                                                                                        borderWidth: 1.0,
                                                                                                        buttonSize: 35.0,
                                                                                                        fillColor: FlutterFlowTheme.of(context).success,
                                                                                                        icon: Icon(
                                                                                                          Icons.wechat_sharp,
                                                                                                          color: FlutterFlowTheme.of(context).lineColor,
                                                                                                          size: 12.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          await showModalBottomSheet(
                                                                                                            isScrollControlled: true,
                                                                                                            backgroundColor: Colors.transparent,
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
                                                                                                                    child: Container(
                                                                                                                      height: double.infinity,
                                                                                                                      child: MessageBoxWidget(),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            },
                                                                                                          ).then((value) => safeSetState(() {}));
                                                                                                        },
                                                                                                      ),
                                                                                                    FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 30.0,
                                                                                                      borderWidth: 1.0,
                                                                                                      buttonSize: 35.0,
                                                                                                      fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                      icon: Icon(
                                                                                                        Icons.sms_outlined,
                                                                                                        color: FlutterFlowTheme.of(context).lineColor,
                                                                                                        size: 18.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        await launchURL('https://wa.me/${functions.trimMobile(newleadListItem.mobile, '+')}');
                                                                                                      },
                                                                                                    ),
                                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            );
                                                                          },
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  if (!_model
                                                                      .showNewTab)
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          15.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        decoration:
                                                                            BoxDecoration(),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final leadMngList =
                                                                                (_model.isSearched ? functions.filteredLeadsForReports(containerMainLeadsManagementRecordList.toList(), _model.dropDownAssignedToValue != null && _model.dropDownAssignedToValue != '' ? _model.dropDownAssignedToValue : '', _model.textController.text != null && _model.textController.text != '' ? _model.textController.text : '', _model.dropDownValue != null && _model.dropDownValue != '' ? _model.dropDownValue : '', _model.dropDownRemarksValue != null && _model.dropDownRemarksValue != '' ? _model.dropDownRemarksValue : '', FFAppState().leadCreateValue, _model.dropDownSourceValue != null && _model.dropDownSourceValue != '' ? _model.dropDownSourceValue : '') : containerMainLeadsManagementRecordList.where((e) => e.stage == FFAppState().leadCreateValue).toList()).toList();
                                                                            if (leadMngList.isEmpty) {
                                                                              return ListViewMsgWidget();
                                                                            }

                                                                            return ListView.separated(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: leadMngList.length,
                                                                              separatorBuilder: (_, __) => SizedBox(height: 10.0),
                                                                              itemBuilder: (context, leadMngListIndex) {
                                                                                final leadMngListItem = leadMngList[leadMngListIndex];
                                                                                return ClipRRect(
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                  child: Container(
                                                                                    decoration: BoxDecoration(
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                    ),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      child: ExpandableNotifier(
                                                                                        initialExpanded: false,
                                                                                        child: ExpandablePanel(
                                                                                          header: Container(
                                                                                            width: 100.0,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 15.0, 5.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          flex: 2,
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                                child: Stack(
                                                                                                                  children: [
                                                                                                                    if (leadMngListItem.source == 'Reference')
                                                                                                                      Image.asset(
                                                                                                                        'assets/images/oie_5zbZfOBU0qjG.png',
                                                                                                                        width: 30.0,
                                                                                                                        height: 25.0,
                                                                                                                        fit: BoxFit.contain,
                                                                                                                      ),
                                                                                                                    if (leadMngListItem.source == 'Other')
                                                                                                                      Align(
                                                                                                                        alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                                        child: Image.asset(
                                                                                                                          'assets/images/oie_UzeNLLv9VG1T.png',
                                                                                                                          width: 30.0,
                                                                                                                          height: 30.0,
                                                                                                                          fit: BoxFit.contain,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (leadMngListItem.source == 'WalkIn')
                                                                                                                      Image.asset(
                                                                                                                        'assets/images/oie_nD4zy5Fy6lde.png',
                                                                                                                        width: 30.0,
                                                                                                                        height: 30.0,
                                                                                                                        fit: BoxFit.contain,
                                                                                                                      ),
                                                                                                                    if (leadMngListItem.source == 'Facebook')
                                                                                                                      ClipRRect(
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                        child: Image.asset(
                                                                                                                          'assets/images/facebook.png',
                                                                                                                          width: 30.0,
                                                                                                                          height: 30.0,
                                                                                                                          fit: BoxFit.contain,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (leadMngListItem.source == 'Indiamart')
                                                                                                                      ClipRRect(
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                        child: Image.asset(
                                                                                                                          'assets/images/INDIAMART.NS-ecf147e0.png',
                                                                                                                          width: 30.0,
                                                                                                                          height: 30.0,
                                                                                                                          fit: BoxFit.contain,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (leadMngListItem.source == 'JustDail')
                                                                                                                      ClipRRect(
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                        child: Image.asset(
                                                                                                                          'assets/images/JustDial.png',
                                                                                                                          width: 30.0,
                                                                                                                          height: 30.0,
                                                                                                                          fit: BoxFit.contain,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    if (leadMngListItem.source == 'Website')
                                                                                                                      ClipRRect(
                                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                                        child: Image.asset(
                                                                                                                          'assets/images/5602732.png',
                                                                                                                          width: 30.0,
                                                                                                                          height: 30.0,
                                                                                                                          fit: BoxFit.contain,
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                  ],
                                                                                                                ),
                                                                                                              ),
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                                child: ClipRRect(
                                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                                  child: Container(
                                                                                                                    decoration: BoxDecoration(
                                                                                                                      color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                                                      borderRadius: BorderRadius.circular(5.0),
                                                                                                                      border: Border.all(
                                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                                        width: 1.0,
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                    child: Padding(
                                                                                                                      padding: EdgeInsets.all(6.0),
                                                                                                                      child: Row(
                                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                                        children: [
                                                                                                                          SelectionArea(
                                                                                                                              child: Text(
                                                                                                                            leadMngListItem.ticket,
                                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                                  color: Color(0xFF5283EB),
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                                ),
                                                                                                                          )),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                leadMngListItem.username,
                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      fontWeight: FontWeight.w600,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          flex: 1,
                                                                                                          child: Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                flex: 2,
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                                  child: SelectionArea(
                                                                                                                      child: AutoSizeText(
                                                                                                                    leadMngListItem.mobile,
                                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                          color: Color(0xFFE75007),
                                                                                                                          fontSize: 10.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                                        ),
                                                                                                                  )),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Column(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Expanded(
                                                                                                                    flex: 3,
                                                                                                                    child: Align(
                                                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                      child: Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                                                        child: Text(
                                                                                                                          dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(leadMngListItem.createdDate)),
                                                                                                                          textAlign: TextAlign.end,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                color: FlutterFlowTheme.of(context).success,
                                                                                                                                fontSize: 11.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                  Expanded(
                                                                                                                    flex: 3,
                                                                                                                    child: Align(
                                                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                                                      child: Text(
                                                                                                                        leadMngListItem.city,
                                                                                                                        textAlign: TextAlign.end,
                                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                              fontSize: 13.0,
                                                                                                                              letterSpacing: 0.0,
                                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                            ),
                                                                                                                      ),
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
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                    child: Container(
                                                                                                      width: double.infinity,
                                                                                                      decoration: BoxDecoration(),
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          SelectionArea(
                                                                                                              child: Text(
                                                                                                            valueOrDefault<String>(
                                                                                                              functions.leadsReq(leadMngListItem.requirement),
                                                                                                              'Requirement not specified',
                                                                                                            ),
                                                                                                            textAlign: TextAlign.start,
                                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                  color: Color(0xFF5283EB),
                                                                                                                  fontSize: 13.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                ),
                                                                                                          )),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          collapsed: Container(),
                                                                                          expanded: Container(
                                                                                            decoration: BoxDecoration(
                                                                                              color: Color(0xFFE9EDF7),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 5.0, 15.0, 15.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      children: [
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                              child: SelectionArea(
                                                                                                                  child: Text(
                                                                                                                leadMngListItem.businessName,
                                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                    ),
                                                                                                              )),
                                                                                                            ),
                                                                                                            SelectionArea(
                                                                                                                child: Text(
                                                                                                              leadMngListItem.businessType,
                                                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                                    color: Color(0xFF5283EB),
                                                                                                                    fontSize: 13.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                                  ),
                                                                                                            )),
                                                                                                          ],
                                                                                                        ),
                                                                                                        Row(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Text(
                                                                                                              'Campaign Name : ',
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              leadMngListItem.leadCampaign,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.w600,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Align(
                                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          flex: 4,
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Expanded(
                                                                                                                flex: 2,
                                                                                                                child: Row(
                                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                  children: [
                                                                                                                    Text(
                                                                                                                      'Status :',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                            color: FlutterFlowTheme.of(context).text2nd,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                          ),
                                                                                                                    ),
                                                                                                                    Builder(
                                                                                                                      builder: (context) => InkWell(
                                                                                                                        splashColor: Colors.transparent,
                                                                                                                        focusColor: Colors.transparent,
                                                                                                                        hoverColor: Colors.transparent,
                                                                                                                        highlightColor: Colors.transparent,
                                                                                                                        onTap: () async {
                                                                                                                          await showDialog(
                                                                                                                            context: context,
                                                                                                                            builder: (dialogContext) {
                                                                                                                              return Dialog(
                                                                                                                                elevation: 0,
                                                                                                                                insetPadding: EdgeInsets.zero,
                                                                                                                                backgroundColor: Colors.transparent,
                                                                                                                                alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                                child: WebViewAware(
                                                                                                                                  child: GestureDetector(
                                                                                                                                    onTap: () {
                                                                                                                                      FocusScope.of(dialogContext).unfocus();
                                                                                                                                      FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                    },
                                                                                                                                    child: Container(
                                                                                                                                      height: 300.0,
                                                                                                                                      width: 300.0,
                                                                                                                                      child: UpdateStageDropdownNewWidget(
                                                                                                                                        ref: leadMngListItem,
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            },
                                                                                                                          ).then((value) => safeSetState(() => _model.stage = value));

                                                                                                                          safeSetState(() {});
                                                                                                                        },
                                                                                                                        child: Text(
                                                                                                                          leadMngListItem.status,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ].divide(SizedBox(width: 5.0)),
                                                                                                                ),
                                                                                                              ),
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'Created On :',
                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                                          fontSize: 11.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(leadMngListItem.createdDate)),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    leadMngListItem.time,
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                                              ),
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Text(
                                                                                                                    'Updated On :',
                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                                          fontSize: 11.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(leadMngListItem.updatedDate)),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                  Text(
                                                                                                                    dateTimeFormat("jms", DateTime.fromMillisecondsSinceEpoch(leadMngListItem.updatedDate)),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                                              ),
                                                                                                            ].divide(SizedBox(height: 10.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                                          children: [
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
                                                                                                                    FutureBuilder<List<UserProfileRecord>>(
                                                                                                                      future: queryUserProfileRecordOnce(
                                                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                                          'id',
                                                                                                                          isEqualTo: leadMngListItem.assignedBy,
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
                                                                                                                            '-',
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
                                                                                                            StreamBuilder<List<UserProfileRecord>>(
                                                                                                              stream: queryUserProfileRecord(
                                                                                                                queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                                  'id',
                                                                                                                  isEqualTo: leadMngListItem.assignedTo != '' ? leadMngListItem.assignedTo : null,
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

                                                                                                                return InkWell(
                                                                                                                  splashColor: Colors.transparent,
                                                                                                                  focusColor: Colors.transparent,
                                                                                                                  hoverColor: Colors.transparent,
                                                                                                                  highlightColor: Colors.transparent,
                                                                                                                  onTap: () async {
                                                                                                                    FFAppState().changeAssignedFlag = true;
                                                                                                                    safeSetState(() {});
                                                                                                                    await showModalBottomSheet(
                                                                                                                      isScrollControlled: true,
                                                                                                                      backgroundColor: Colors.transparent,
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
                                                                                                                              child: AssignLeadDealerWidget(
                                                                                                                                mobile: leadMngListItem.mobile,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                                  },
                                                                                                                  child: Container(
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
                                                                                                                              size: 14.0,
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                          Text(
                                                                                                                            containerUserProfileRecord!.name.maybeHandleOverflow(
                                                                                                                              maxChars: 15,
                                                                                                                            ),
                                                                                                                            textAlign: TextAlign.end,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                  color: Color(0xFF003DC4),
                                                                                                                                  fontSize: 11.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ],
                                                                                                                      ),
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                );
                                                                                                              },
                                                                                                            ),
                                                                                                          ].divide(SizedBox(height: 3.0)),
                                                                                                        ),
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          children: [
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                                                              children: [
                                                                                                                FlutterFlowIconButton(
                                                                                                                  borderColor: Colors.transparent,
                                                                                                                  borderRadius: 30.0,
                                                                                                                  borderWidth: 1.0,
                                                                                                                  buttonSize: 35.0,
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
                                                                                                                                id: leadMngListItem.id,
                                                                                                                                username: leadMngListItem.followUpName,
                                                                                                                                mobile: leadMngListItem.mobile,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                                  },
                                                                                                                ),
                                                                                                                FlutterFlowIconButton(
                                                                                                                  borderColor: Colors.transparent,
                                                                                                                  borderRadius: 30.0,
                                                                                                                  borderWidth: 1.0,
                                                                                                                  buttonSize: 35.0,
                                                                                                                  fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                                  icon: Icon(
                                                                                                                    Icons.line_weight_rounded,
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    size: 13.0,
                                                                                                                  ),
                                                                                                                  onPressed: () async {
                                                                                                                    await showModalBottomSheet(
                                                                                                                      isScrollControlled: true,
                                                                                                                      backgroundColor: Colors.transparent,
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
                                                                                                                              child: ScheduleWidget(
                                                                                                                                leadMRefid: leadMngListItem.reference.id,
                                                                                                                                username: leadMngListItem.username,
                                                                                                                                mobile: leadMngListItem.mobile,
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                                  },
                                                                                                                ),
                                                                                                                Builder(
                                                                                                                  builder: (context) => FlutterFlowIconButton(
                                                                                                                    borderColor: Colors.transparent,
                                                                                                                    borderRadius: 30.0,
                                                                                                                    borderWidth: 1.0,
                                                                                                                    buttonSize: 35.0,
                                                                                                                    fillColor: FlutterFlowTheme.of(context).customColor5,
                                                                                                                    icon: Icon(
                                                                                                                      Icons.sticky_note_2_outlined,
                                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                                      size: 20.0,
                                                                                                                    ),
                                                                                                                    onPressed: () async {
                                                                                                                      await showDialog(
                                                                                                                        context: context,
                                                                                                                        builder: (dialogContext) {
                                                                                                                          return Dialog(
                                                                                                                            elevation: 0,
                                                                                                                            insetPadding: EdgeInsets.zero,
                                                                                                                            backgroundColor: Colors.transparent,
                                                                                                                            alignment: AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                                                                            child: WebViewAware(
                                                                                                                              child: GestureDetector(
                                                                                                                                onTap: () {
                                                                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                                                                },
                                                                                                                                child: LeadActivityUpdateWidget(
                                                                                                                                  leadManagement: leadMngListItem,
                                                                                                                                  status: leadMngListItem.status,
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            ),
                                                                                                                          );
                                                                                                                        },
                                                                                                                      );
                                                                                                                    },
                                                                                                                  ),
                                                                                                                ),
                                                                                                                FlutterFlowIconButton(
                                                                                                                  borderColor: Colors.transparent,
                                                                                                                  borderRadius: 30.0,
                                                                                                                  borderWidth: 1.0,
                                                                                                                  buttonSize: 35.0,
                                                                                                                  fillColor: Color(0xFF6492DB),
                                                                                                                  icon: Icon(
                                                                                                                    Icons.mode_edit_outline_outlined,
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    size: 20.0,
                                                                                                                  ),
                                                                                                                  onPressed: () async {
                                                                                                                    context.pushNamed(
                                                                                                                      LeadLogNewWidget.routeName,
                                                                                                                      queryParameters: {
                                                                                                                        'leadDoc': serializeParam(
                                                                                                                          leadMngListItem,
                                                                                                                          ParamType.Document,
                                                                                                                        ),
                                                                                                                      }.withoutNulls,
                                                                                                                      extra: <String, dynamic>{
                                                                                                                        'leadDoc': leadMngListItem,
                                                                                                                      },
                                                                                                                    );
                                                                                                                  },
                                                                                                                ),
                                                                                                              ].divide(SizedBox(width: 5.0)),
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ].divide(SizedBox(width: 15.0)),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          theme: ExpandableThemeData(
                                                                                            tapHeaderToExpand: true,
                                                                                            tapBodyToExpand: false,
                                                                                            tapBodyToCollapse: false,
                                                                                            headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                            hasIcon: true,
                                                                                          ),
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
                                                                ],
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 4,
                                                              child: StreamBuilder<
                                                                  List<
                                                                      LeadsManagementRecord>>(
                                                                stream:
                                                                    queryLeadsManagementRecord(
                                                                  parent: FFAppState()
                                                                      .outletRef,
                                                                  queryBuilder: (leadsManagementRecord) =>
                                                                      leadsManagementRecord
                                                                          .where(
                                                                            'createdDate',
                                                                            isGreaterThanOrEqualTo:
                                                                                FFAppState().startDate,
                                                                          )
                                                                          .where(
                                                                            'createdDate',
                                                                            isLessThan:
                                                                                FFAppState().endDate,
                                                                          ),
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            30.0,
                                                                        height:
                                                                            30.0,
                                                                        child:
                                                                            SpinKitRing(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          size:
                                                                              30.0,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  List<LeadsManagementRecord>
                                                                      containerLeadsManagementRecordList =
                                                                      snapshot
                                                                          .data!;

                                                                  return Container(
                                                                    width:
                                                                        100.0,
                                                                    height: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          15.0,
                                                                          10.0,
                                                                          15.0,
                                                                          10.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children:
                                                                            [
                                                                          Text(
                                                                            'Activity Log',
                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                  color: FlutterFlowTheme.of(context).customColor3,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                ),
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                370.0,
                                                                            height:
                                                                                250.0,
                                                                            child:
                                                                                FlutterFlowBarChart(
                                                                              barData: [
                                                                                FFBarChartData(
                                                                                  yData: functions
                                                                                      .groupLeadDocs('stage', containerLeadsManagementRecordList.toList())
                                                                                      .map((e) => getJsonField(
                                                                                            e,
                                                                                            r'''$.count''',
                                                                                          ))
                                                                                      .toList(),
                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                )
                                                                              ],
                                                                              xLabels: functions
                                                                                  .groupLeadDocs('stage', containerLeadsManagementRecordList.toList())
                                                                                  .map((e) => getJsonField(
                                                                                        e,
                                                                                        r'''$.status''',
                                                                                      ))
                                                                                  .toList()
                                                                                  .map((e) => e.toString())
                                                                                  .toList(),
                                                                              barWidth: 10.0,
                                                                              barBorderRadius: BorderRadius.circular(8.0),
                                                                              groupSpace: 2.0,
                                                                              alignment: BarChartAlignment.spaceAround,
                                                                              chartStylingInfo: ChartStylingInfo(
                                                                                enableTooltip: true,
                                                                                backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderColor: FlutterFlowTheme.of(context).secondaryText,
                                                                                borderWidth: 1.0,
                                                                              ),
                                                                              axisBounds: AxisBounds(),
                                                                              xAxisLabelInfo: AxisLabelInfo(
                                                                                title: 'Stages',
                                                                                titleTextStyle: TextStyle(
                                                                                  fontSize: 14.0,
                                                                                ),
                                                                                showLabels: true,
                                                                                labelInterval: 10.0,
                                                                                reservedSize: 28.0,
                                                                              ),
                                                                              yAxisLabelInfo: AxisLabelInfo(
                                                                                title: 'Count',
                                                                                titleTextStyle: TextStyle(
                                                                                  fontSize: 14.0,
                                                                                ),
                                                                                showLabels: true,
                                                                                labelInterval: 20.0,
                                                                                reservedSize: 42.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Container(
                                                                              width: double.infinity,
                                                                              height: 100.0,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).back2nd,
                                                                              ),
                                                                              child: Align(
                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                child: Text(
                                                                                  'Funnel ',
                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(height: 10.0)),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ].divide(SizedBox(width: 20.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 5.0)),
                        ),
                      ),
                    ),
                  ],
                ),
                if (_model.showMore)
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(1190.0, 135.0, 0.0, 0.0),
                    child: Container(
                      width: 300.0,
                      height: 400.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 15.0,
                            color: Color(0x33000000),
                            offset: Offset(
                              5.0,
                              4.0,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: FlutterFlowIconButton(
                                borderColor:
                                    FlutterFlowTheme.of(context).primary,
                                borderRadius: 5.0,
                                borderWidth: 1.0,
                                buttonSize: 37.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.close_sharp,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 15.0,
                                ),
                                onPressed: () async {
                                  _model.showMore = false;
                                  safeSetState(() {});
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  FFAppState().startDate =
                                      functions.currentMonth('first');
                                  FFAppState().endDate =
                                      functions.currentMonth('last');
                                  safeSetState(() {});

                                  context.pushNamed(
                                      LeadReportMonthlyWidget.routeName);
                                },
                                text: 'Citywise report',
                                icon: Icon(
                                  Icons.table_chart,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
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
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  context.pushNamed(
                                      LeadEmployeeReportFinalWidget.routeName);
                                },
                                text: 'Employee Report',
                                icon: Icon(
                                  Icons.people_rounded,
                                  size: 20.0,
                                ),
                                options: FFButtonOptions(
                                  width: 200.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      24.0, 0.0, 24.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        fontSize: 14.0,
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
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                            ),
                            if (FFAppState().billingType != 'CRM')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                        LeadReportMonthlSourceWiseWidget
                                            .routeName);
                                  },
                                  text: 'Source Report',
                                  icon: Icon(
                                    Icons.stacked_bar_chart,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            if (FFAppState().billingType != 'CRM')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                        TodayDetailsWidget.routeName);
                                  },
                                  text: 'Today',
                                  icon: Icon(
                                    Icons.phone_in_talk_rounded,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 40.0,
                                    padding: EdgeInsets.all(0.0),
                                    iconPadding: EdgeInsets.all(0.0),
                                    iconColor:
                                        FlutterFlowTheme.of(context).primary,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            if (FFAppState().billingType != 'CRM')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                        DealerAssignmentWidget.routeName);
                                  },
                                  text: 'Dealer Report',
                                  icon: Icon(
                                    Icons.people_alt_outlined,
                                    size: 15.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            if (FFAppState().billingType != 'CRM')
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: FFButtonWidget(
                                  onPressed: () async {
                                    context.pushNamed(
                                        IntegrationMasterWidget.routeName);
                                  },
                                  text: 'Lead Integration',
                                  icon: Icon(
                                    Icons.integration_instructions_outlined,
                                    size: 20.0,
                                  ),
                                  options: FFButtonOptions(
                                    width: 200.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        24.0, 0.0, 24.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
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
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
