import '/backend/backend.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/assign_ticket/assign_ticket_widget.dart';
import '/pages/components/call_details/call_details_widget.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import '/pages/components/dis_qualify_lead/dis_qualify_lead_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/update_stage_dropdown_copy/update_stage_dropdown_copy_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'deye_dashboard_old_model.dart';
export 'deye_dashboard_old_model.dart';

class DeyeDashboardOldWidget extends StatefulWidget {
  const DeyeDashboardOldWidget({super.key});

  static String routeName = 'DeyeDashboardOld';
  static String routePath = 'DeyeDashboard';

  @override
  State<DeyeDashboardOldWidget> createState() => _DeyeDashboardOldWidgetState();
}

class _DeyeDashboardOldWidgetState extends State<DeyeDashboardOldWidget>
    with TickerProviderStateMixin {
  late DeyeDashboardOldModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeyeDashboardOldModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.showNewTab = true;
      _model.showMore = false;
      _model.isSearched = false;
      safeSetState(() {});
      FFAppState().startDate = functions.lastDays(7);
      FFAppState().endDate = functions.tommarow();
      FFAppState().leadCreateValue = 'Unread';
      safeSetState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
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
    final chartPieChartColorsList = [
      Color(0xFFFC590C),
      FlutterFlowTheme.of(context).tertiary,
      Color(0xFFE3AB0F)
    ];
    return Title(
        title: 'DeyeDashboardOld',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).back2nd,
          endDrawer: Container(
            width: MediaQuery.sizeOf(context).width * 0.27,
            child: Drawer(
              elevation: 16.0,
              child: WebViewAware(
                child: Container(
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).back2nd,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 20.0),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FlutterFlowIconButton(
                                borderRadius: 3.0,
                                buttonSize: 40.0,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                icon: Icon(
                                  Icons.close_sharp,
                                  color: FlutterFlowTheme.of(context).primary,
                                  size: 20.0,
                                ),
                                onPressed: () async {
                                  if (scaffoldKey.currentState!.isDrawerOpen ||
                                      scaffoldKey
                                          .currentState!.isEndDrawerOpen) {
                                    Navigator.pop(context);
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: wrapWithModel(
                            model: _model.deyeMenuModel,
                            updateCallback: () => safeSetState(() {}),
                            child: DeyeMenuWidget(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          body: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).customColor6,
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            20.0, 0.0, 20.0, 0.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 150.0,
                              height: 50.0,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  fit: BoxFit.fitHeight,
                                  image: Image.asset(
                                    'assets/images/logo.png',
                                  ).image,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.person_sharp,
                                  color: FlutterFlowTheme.of(context).text2nd,
                                  size: 24.0,
                                ),
                                StreamBuilder<List<UserProfileRecord>>(
                                  stream: queryUserProfileRecord(
                                    queryBuilder: (userProfileRecord) =>
                                        userProfileRecord.where(
                                      'email',
                                      isEqualTo: FFAppState().currentEmail,
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UserProfileRecord>
                                        textUserProfileRecordList =
                                        snapshot.data!;
                                    // Return an empty Container when the item does not exist.
                                    if (snapshot.data!.isEmpty) {
                                      return Container();
                                    }
                                    final textUserProfileRecord =
                                        textUserProfileRecordList.isNotEmpty
                                            ? textUserProfileRecordList.first
                                            : null;

                                    return Text(
                                      valueOrDefault<String>(
                                        textUserProfileRecord?.name,
                                        '-',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .labelSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelSmallFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .labelSmallFamily),
                                          ),
                                    );
                                  },
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: Text(
                                    FFAppState().zone,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .text2nd,
                                          fontSize: 12.0,
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.w600,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 15.0, 0.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                          DeyeAddComplaintsWidget.routeName);
                                    },
                                    text: 'Add New Ticket',
                                    icon: Icon(
                                      Icons.add,
                                      size: 15.0,
                                    ),
                                    options: FFButtonOptions(
                                      height: 35.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 16.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: FlutterFlowTheme.of(context)
                                          .customColor5,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmallFamily,
                                            color: Colors.white,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
                                          ),
                                      elevation: 0.0,
                                      borderRadius: BorderRadius.circular(3.0),
                                    ),
                                  ),
                                ),
                                if (false)
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 15.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (animationsMap[
                                                'containerOnActionTriggerAnimation'] !=
                                            null) {
                                          await animationsMap[
                                                  'containerOnActionTriggerAnimation']!
                                              .controller
                                              .forward(from: 0.0);
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .warning,
                                            width: 0.5,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  7.0, 5.0, 7.0, 5.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.showMore = true;
                                                  safeSetState(() {});
                                                },
                                                child: Icon(
                                                  Icons.notifications_active,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .warning,
                                                  size: 21.0,
                                                ),
                                              ),
                                              Text(
                                                '5',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLarge
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineLargeFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .warning,
                                                          fontSize: 18.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily),
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                FlutterFlowIconButton(
                                  borderRadius: 3.0,
                                  buttonSize: 35.0,
                                  fillColor:
                                      FlutterFlowTheme.of(context).tertiary,
                                  icon: Icon(
                                    Icons.menu_open,
                                    color:
                                        FlutterFlowTheme.of(context).lineColor,
                                    size: 22.0,
                                  ),
                                  onPressed: () async {
                                    scaffoldKey.currentState!.openEndDrawer();
                                  },
                                ),
                              ].divide(SizedBox(width: 5.0)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 35,
                    child: StreamBuilder<List<LeadsManagementRecord>>(
                      stream: queryLeadsManagementRecord(
                        parent: FFAppState().outletRef,
                        queryBuilder: (leadsManagementRecord) =>
                            leadsManagementRecord
                                .where(
                                  'status',
                                  isEqualTo: FFAppState().leadCreateValue,
                                )
                                .where(
                                  'createdDate',
                                  isGreaterThan: FFAppState().startDate,
                                )
                                .where(
                                  'createdDate',
                                  isLessThanOrEqualTo: FFAppState().endDate,
                                )
                                .where(
                                  'zone',
                                  isEqualTo: FFAppState().zone,
                                )
                                .orderBy('createdDate', descending: true),
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
                        List<LeadsManagementRecord>
                            containerLeadsManagementRecordList = snapshot.data!;

                        return Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  flex: 26,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Container(
                                        height: 70.0,
                                        decoration: BoxDecoration(),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color: FFAppState()
                                                              .leadCreateValue ==
                                                          'Unread'
                                                      ? Color(0xFF216CE4)
                                                      : Color(0x00000000),
                                                  width: 1.5,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    _model.showNewTab = true;
                                                    safeSetState(() {});
                                                    FFAppState()
                                                            .leadCreateValue =
                                                        'Unread';
                                                    safeSetState(() {});
                                                  },
                                                  child: Container(
                                                    width: 210.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFF401E50),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  15.0,
                                                                  10.0,
                                                                  15.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons.new_label,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                size: 30.0,
                                                              ),
                                                              Text(
                                                                'New',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryBtnText,
                                                                      fontSize:
                                                                          19.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 5.0)),
                                                          ),
                                                          if (false)
                                                            Text(
                                                              getJsonField(
                                                                FFAppState()
                                                                    .newLeadCounts
                                                                    .firstOrNull,
                                                                r'''$.total''',
                                                              ).toString(),
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .headlineMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .headlineMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        20.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                  ),
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: StreamBuilder<
                                                  List<LeadStagesRecord>>(
                                                stream: queryLeadStagesRecord(
                                                  parent:
                                                      FFAppState().outletRef,
                                                  queryBuilder:
                                                      (leadStagesRecord) =>
                                                          leadStagesRecord
                                                              .orderBy('code'),
                                                ),
                                                builder: (context, snapshot) {
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
                                                      listViewLeadStagesRecordList =
                                                      snapshot.data!;

                                                  return ListView.separated(
                                                    padding: EdgeInsets.zero,
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount:
                                                        listViewLeadStagesRecordList
                                                            .length,
                                                    separatorBuilder: (_, __) =>
                                                        SizedBox(width: 10.0),
                                                    itemBuilder: (context,
                                                        listViewIndex) {
                                                      final listViewLeadStagesRecord =
                                                          listViewLeadStagesRecordList[
                                                              listViewIndex];
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          border: Border.all(
                                                            color: FFAppState()
                                                                        .leadCreateValue ==
                                                                    listViewLeadStagesRecord
                                                                        .name
                                                                ? Color(
                                                                    0xFF216CE4)
                                                                : Color(
                                                                    0x00000000),
                                                            width: 1.5,
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  3.0),
                                                          child: InkWell(
                                                            splashColor: Colors
                                                                .transparent,
                                                            focusColor: Colors
                                                                .transparent,
                                                            hoverColor: Colors
                                                                .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.showNewTab =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                              FFAppState()
                                                                      .leadCreateValue =
                                                                  listViewLeadStagesRecord
                                                                      .name;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            child: Container(
                                                              width: 210.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: () {
                                                                  if (listViewLeadStagesRecord
                                                                          .name ==
                                                                      'assigned') {
                                                                    return Color(
                                                                        0xFFE3AB0F);
                                                                  } else if (listViewLeadStagesRecord
                                                                          .name ==
                                                                      'pending') {
                                                                    return Color(
                                                                        0xFFFC590C);
                                                                  } else {
                                                                    return FlutterFlowTheme.of(
                                                                            context)
                                                                        .tertiary;
                                                                  }
                                                                }(),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        15.0,
                                                                        10.0,
                                                                        15.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .center,
                                                                      children:
                                                                          [
                                                                        Stack(
                                                                          children: [
                                                                            if (listViewLeadStagesRecord.name ==
                                                                                'completed')
                                                                              Icon(
                                                                                Icons.check_box_rounded,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                size: 30.0,
                                                                              ),
                                                                            if (listViewLeadStagesRecord.name ==
                                                                                'pending')
                                                                              Icon(
                                                                                Icons.watch_later_sharp,
                                                                                color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                size: 30.0,
                                                                              ),
                                                                            if (listViewLeadStagesRecord.name ==
                                                                                'assigned')
                                                                              Icon(
                                                                                Icons.location_history,
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                size: 30.0,
                                                                              ),
                                                                          ],
                                                                        ),
                                                                        Text(
                                                                          listViewLeadStagesRecord
                                                                              .display,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .titleMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                fontSize: 19.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.normal,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ].divide(SizedBox(
                                                                              width: 5.0)),
                                                                    ),
                                                                    if (false)
                                                                      Text(
                                                                        getJsonField(
                                                                          FFAppState()
                                                                              .assignedLeadCount
                                                                              .firstOrNull,
                                                                          r'''$.total''',
                                                                        ).toString(),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              fontSize: 20.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                            ),
                                                                      ),
                                                                  ],
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
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 17,
                                        child: Container(
                                          width: double.infinity,
                                          height: 300.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        StreamBuilder<
                                                            List<
                                                                TeamTreeRecord>>(
                                                          stream:
                                                              queryTeamTreeRecord(
                                                            parent: FFAppState()
                                                                .outletRef,
                                                            queryBuilder:
                                                                (teamTreeRecord) =>
                                                                    teamTreeRecord
                                                                        .where(
                                                                          'zone',
                                                                          isEqualTo:
                                                                              FFAppState().zone,
                                                                        )
                                                                        .orderBy(
                                                                            'userName'),
                                                          ),
                                                          builder: (context,
                                                              snapshot) {
                                                            // Customize what your widget looks like when it's loading.
                                                            if (!snapshot
                                                                .hasData) {
                                                              return Center(
                                                                child: SizedBox(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  child:
                                                                      CircularProgressIndicator(
                                                                    valueColor:
                                                                        AlwaysStoppedAnimation<
                                                                            Color>(
                                                                      FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
                                                                    ),
                                                                  ),
                                                                ),
                                                              );
                                                            }
                                                            List<TeamTreeRecord>
                                                                dropDownAssignedTeamTreeRecordList =
                                                                snapshot.data!;

                                                            return FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownAssignedValueController ??=
                                                                  FormFieldController<
                                                                      String>(
                                                                _model.dropDownAssignedValue ??=
                                                                    '',
                                                              ),
                                                              options: List<
                                                                      String>.from(
                                                                  dropDownAssignedTeamTreeRecordList
                                                                      .map((e) =>
                                                                          e.userProfileId)
                                                                      .toList()),
                                                              optionLabels:
                                                                  dropDownAssignedTeamTreeRecordList
                                                                      .map((e) =>
                                                                          e.userName)
                                                                      .toList(),
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownAssignedValue =
                                                                          val),
                                                              width: 250.0,
                                                              height: 40.0,
                                                              searchHintTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                              searchTextStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                      ),
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                      ),
                                                              hintText:
                                                                  'Select Executive',
                                                              searchHintText:
                                                                  'Search...',
                                                              icon: Icon(
                                                                Icons
                                                                    .keyboard_arrow_down_rounded,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .text2nd,
                                                                size: 20.0,
                                                              ),
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              elevation: 2.0,
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderWidth: 0.0,
                                                              borderRadius:
                                                                  10.0,
                                                              margin:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0),
                                                              hidesUnderline:
                                                                  true,
                                                              isOverButton:
                                                                  false,
                                                              isSearchable:
                                                                  true,
                                                              isMultiSelect:
                                                                  false,
                                                            );
                                                          },
                                                        ),
                                                        FlutterFlowDropDown<
                                                            String>(
                                                          controller: _model
                                                                  .dropDownValueController ??=
                                                              FormFieldController<
                                                                  String>(null),
                                                          options: [
                                                            'Mobile',
                                                            'Serial',
                                                            'Complaint'
                                                          ],
                                                          onChanged: (val) =>
                                                              safeSetState(() =>
                                                                  _model.dropDownValue =
                                                                      val),
                                                          width: 150.0,
                                                          height: 40.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmall
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelSmallFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelSmallFamily),
                                                                  ),
                                                          hintText:
                                                              'Select Filter',
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .text2nd,
                                                            size: 20.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderWidth: 0.0,
                                                          borderRadius: 10.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12.0,
                                                                      0.0,
                                                                      12.0,
                                                                      0.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                        Container(
                                                          width: 150.0,
                                                          child: TextFormField(
                                                            controller: _model
                                                                .textController,
                                                            focusNode: _model
                                                                .textFieldFocusNode,
                                                            autofocus: false,
                                                            obscureText: false,
                                                            decoration:
                                                                InputDecoration(
                                                              isDense: true,
                                                              labelStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                              hintStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .text2nd,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                      ),
                                                              enabledBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              focusedBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: Color(
                                                                      0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              errorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              focusedErrorBorder:
                                                                  OutlineInputBorder(
                                                                borderSide:
                                                                    BorderSide(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .error,
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                              ),
                                                              filled: true,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                            cursorColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                            validator: _model
                                                                .textControllerValidator
                                                                .asValidator(
                                                                    context),
                                                          ),
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderRadius: 10.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customColor5,
                                                          icon: Icon(
                                                            Icons.done_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            size: 20.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model.isSearched =
                                                                true;
                                                            safeSetState(() {});
                                                          },
                                                        ),
                                                        FlutterFlowIconButton(
                                                          borderRadius: 10.0,
                                                          buttonSize: 40.0,
                                                          fillColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .text2nd,
                                                          icon: Icon(
                                                            Icons.close,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            size: 20.0,
                                                          ),
                                                          onPressed: () async {
                                                            _model.isSearched =
                                                                false;
                                                            safeSetState(() {});
                                                            safeSetState(() {
                                                              _model
                                                                  .textController
                                                                  ?.clear();
                                                            });
                                                            safeSetState(() {
                                                              _model
                                                                  .dropDownValueController
                                                                  ?.reset();
                                                              _model
                                                                  .dropDownAssignedValueController
                                                                  ?.reset();
                                                            });
                                                          },
                                                        ),
                                                      ].divide(
                                                          SizedBox(width: 5.0)),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        dateTimeFormat(
                                                            "yMMMd",
                                                            DateTime.fromMillisecondsSinceEpoch(
                                                                FFAppState()
                                                                    .startDate)),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        'to',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                      ),
                                                      Text(
                                                        dateTimeFormat(
                                                            "yMMMd",
                                                            DateTime
                                                                .fromMillisecondsSinceEpoch(
                                                                    FFAppState()
                                                                        .endDate)),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily),
                                                                ),
                                                      ),
                                                      Builder(
                                                        builder: (context) =>
                                                            FlutterFlowIconButton(
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .text2nd,
                                                          borderRadius: 10.0,
                                                          borderWidth: 0.5,
                                                          buttonSize: 40.0,
                                                          icon: Icon(
                                                            Icons
                                                                .calendar_month,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .customColor5,
                                                            size: 20.0,
                                                          ),
                                                          onPressed: () async {
                                                            await showDialog(
                                                              context: context,
                                                              builder:
                                                                  (dialogContext) {
                                                                return Dialog(
                                                                  elevation: 0,
                                                                  insetPadding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                  alignment: AlignmentDirectional(
                                                                          0.0,
                                                                          0.0)
                                                                      .resolve(
                                                                          Directionality.of(
                                                                              context)),
                                                                  child:
                                                                      WebViewAware(
                                                                    child:
                                                                        CustomDateRangeWidget(),
                                                                  ),
                                                                );
                                                              },
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ].divide(
                                                        SizedBox(width: 10.0)),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                child: Stack(
                                                  children: [
                                                    if (_model.showNewTab)
                                                      StreamBuilder<
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
                                                                            FFAppState().leadCreateValue,
                                                                      )
                                                                      .where(
                                                                        'logId',
                                                                        isGreaterThan:
                                                                            functions.last30days(),
                                                                      )
                                                                      .where(
                                                                        'logId',
                                                                        isLessThanOrEqualTo:
                                                                            functions.timestampToMili(getCurrentTimestamp),
                                                                      )
                                                                      .where(
                                                                        'zone',
                                                                        isEqualTo:
                                                                            FFAppState().zone,
                                                                      ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 40.0,
                                                                height: 40.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor6,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<OutletLeadsRecord>
                                                              containerOutletLeadsRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                            ),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final containerVar = (_model
                                                                            .isSearched
                                                                        ? functions.filteredNewComplaints(
                                                                            containerOutletLeadsRecordList.toList(),
                                                                            _model.textController.text,
                                                                            _model.dropDownValue!)
                                                                        : containerOutletLeadsRecordList)
                                                                    .toList();
                                                                if (containerVar
                                                                    .isEmpty) {
                                                                  return Center(
                                                                    child:
                                                                        ListViewMsgWidget(),
                                                                  );
                                                                }

                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      containerVar
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          height:
                                                                              10.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          containerVarIndex) {
                                                                    final containerVarItem =
                                                                        containerVar[
                                                                            containerVarIndex];
                                                                    return Container(
                                                                      width:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(3.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor1,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Ticket :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerVarItem.ticket,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            )),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Customer :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              containerVarItem.username,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Mobile :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            SelectionArea(
                                                                                                child: AutoSizeText(
                                                                                              containerVarItem.mobile,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            )),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'City :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              containerVarItem.city,
                                                                                              textAlign: TextAlign.start,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 10,
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Serial No. :',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                      color: FlutterFlowTheme.of(context).text2nd,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                    ),
                                                                                              ),
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerVarItem.customFields.serial.toString(),
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                    ),
                                                                                              )),
                                                                                            ].divide(SizedBox(width: 5.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Type :',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                      color: FlutterFlowTheme.of(context).text2nd,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                    ),
                                                                                              ),
                                                                                              StreamBuilder<List<CategoryRecord>>(
                                                                                                stream: queryCategoryRecord(
                                                                                                  parent: FFAppState().outletRef,
                                                                                                  queryBuilder: (categoryRecord) => categoryRecord.where(
                                                                                                    'id',
                                                                                                    isEqualTo: containerVarItem.customFields.productType,
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
                                                                                                  List<CategoryRecord> textCategoryRecordList = snapshot.data!;
                                                                                                  // Return an empty Container when the item does not exist.
                                                                                                  if (snapshot.data!.isEmpty) {
                                                                                                    return Container();
                                                                                                  }
                                                                                                  final textCategoryRecord = textCategoryRecordList.isNotEmpty ? textCategoryRecordList.first : null;

                                                                                                  return SelectionArea(
                                                                                                      child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      textCategoryRecord?.name,
                                                                                                      '-',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ));
                                                                                                },
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 5.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Capecity :',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                      color: FlutterFlowTheme.of(context).text2nd,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                    ),
                                                                                              ),
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerVarItem.customFields.capacity,
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                    ),
                                                                                              )),
                                                                                            ].divide(SizedBox(width: 5.0)),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Purchased from :',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                      color: FlutterFlowTheme.of(context).text2nd,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                    ),
                                                                                              ),
                                                                                              SelectionArea(
                                                                                                  child: Text(
                                                                                                containerVarItem.customFields.purchasedFrom,
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                    ),
                                                                                              )),
                                                                                            ].divide(SizedBox(width: 5.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Created On :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              containerVarItem.date,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              containerVarItem.time,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Status :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            if (FFAppState().newLead)
                                                                                              FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderWidth: 1.0,
                                                                                                buttonSize: 35.0,
                                                                                                icon: Icon(
                                                                                                  Icons.stars,
                                                                                                  color: Color(0xFFF7B34C),
                                                                                                  size: 12.0,
                                                                                                ),
                                                                                                onPressed: () {
                                                                                                  print('IconButton pressed ...');
                                                                                                },
                                                                                              ),
                                                                                            Text(
                                                                                              containerVarItem.status,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    color: FlutterFlowTheme.of(context).customColor5,
                                                                                                    letterSpacing: 1.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          height: 10.0,
                                                                                          decoration: BoxDecoration(),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Container(
                                                                                          width: 100.0,
                                                                                          height: 10.0,
                                                                                          decoration: BoxDecoration(),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: SelectionArea(
                                                                                        child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions.leadsReq(containerVarItem.requirement),
                                                                                        'Requirement not specified',
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            color: Color(0xFF5283EB),
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                          ),
                                                                                    )),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                      children: [
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            FFAppState().changeAssignedFlag = false;
                                                                                            safeSetState(() {});
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return WebViewAware(
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: AssignTicketWidget(
                                                                                                      ticket: containerVarItem.ticket,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          },
                                                                                          text: 'Qualify Ticket',
                                                                                          options: FFButtonOptions(
                                                                                            height: 40.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: Color(0xFF30AC50),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                  color: Colors.white,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                        FFButtonWidget(
                                                                                          onPressed: () async {
                                                                                            await showModalBottomSheet(
                                                                                              isScrollControlled: true,
                                                                                              backgroundColor: Colors.transparent,
                                                                                              enableDrag: false,
                                                                                              context: context,
                                                                                              builder: (context) {
                                                                                                return WebViewAware(
                                                                                                  child: Padding(
                                                                                                    padding: MediaQuery.viewInsetsOf(context),
                                                                                                    child: DisQualifyLeadWidget(
                                                                                                      area: containerVarItem.area,
                                                                                                      city: containerVarItem.city,
                                                                                                      comments: containerVarItem.comments,
                                                                                                      createdDateTime: getCurrentTimestamp,
                                                                                                      date: containerVarItem.username,
                                                                                                      email: containerVarItem.email,
                                                                                                      logId: containerVarItem.logId,
                                                                                                      id: containerVarItem.id,
                                                                                                      mobile: containerVarItem.mobile,
                                                                                                      mobilrAlt: containerVarItem.mobileAlt,
                                                                                                      phone: containerVarItem.phone,
                                                                                                      requirement: containerVarItem.requirement,
                                                                                                      source: containerVarItem.source,
                                                                                                      state: containerVarItem.state,
                                                                                                      status: containerVarItem.status,
                                                                                                      time: containerVarItem.time,
                                                                                                      username: containerVarItem.username,
                                                                                                      leadRefId: containerVarItem.reference.id,
                                                                                                      businessName: containerVarItem.businessName,
                                                                                                      businessType: containerVarItem.businessType,
                                                                                                      leadid: '0',
                                                                                                      leadtype: '0',
                                                                                                      prefix: '0',
                                                                                                      priority: containerVarItem.priority,
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ).then((value) => safeSetState(() {}));
                                                                                          },
                                                                                          text: 'Disqualify Ticket',
                                                                                          options: FFButtonOptions(
                                                                                            height: 40.0,
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                            color: Color(0xFFAC305A),
                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                  color: Colors.white,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                ),
                                                                                            elevation: 0.0,
                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 15.0)),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 15.0)),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                if (FFAppState().assignedExec)
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
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: CallDetailsWidget(
                                                                                                id: containerVarItem.reference.id,
                                                                                                username: containerVarItem.username,
                                                                                                mobile: containerVarItem.mobile,
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
                                                                                    Icons.more_time,
                                                                                    color: FlutterFlowTheme.of(context).lineColor,
                                                                                    size: 19.0,
                                                                                  ),
                                                                                  onPressed: () {
                                                                                    print('IconButton pressed ...');
                                                                                  },
                                                                                ),
                                                                                if (responsiveVisibility(
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
                                                                                    fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                    icon: Icon(
                                                                                      Icons.edit_square,
                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                      size: 15.0,
                                                                                    ),
                                                                                    onPressed: () async {
                                                                                      context.pushNamed(
                                                                                        DeyeComplaintDetailsWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'mobile': serializeParam(
                                                                                            containerVarItem.mobile,
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                              ].divide(SizedBox(height: 15.0)),
                                                                            ),
                                                                          ].divide(SizedBox(width: 15.0)),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    if (!_model.showNewTab)
                                                      StreamBuilder<
                                                          List<
                                                              LeadsManagementRecord>>(
                                                        stream:
                                                            queryLeadsManagementRecord(
                                                          parent: FFAppState()
                                                              .outletRef,
                                                          queryBuilder: (leadsManagementRecord) =>
                                                              leadsManagementRecord
                                                                  .where(
                                                                    'status',
                                                                    isEqualTo:
                                                                        FFAppState()
                                                                            .leadCreateValue,
                                                                  )
                                                                  .where(
                                                                    'createdDate',
                                                                    isGreaterThan:
                                                                        FFAppState()
                                                                            .startDate,
                                                                  )
                                                                  .where(
                                                                    'createdDate',
                                                                    isLessThanOrEqualTo:
                                                                        FFAppState()
                                                                            .endDate,
                                                                  )
                                                                  .where(
                                                                    'zone',
                                                                    isEqualTo:
                                                                        FFAppState()
                                                                            .zone,
                                                                  )
                                                                  .orderBy(
                                                                      'createdDate',
                                                                      descending:
                                                                          true),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor6,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<LeadsManagementRecord>
                                                              containerLeadsManagementRecordList =
                                                              snapshot.data!;

                                                          return Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final containerVar = (_model
                                                                            .isSearched
                                                                        ? functions.filteredComplaints(
                                                                            containerLeadsManagementRecordList.toList(),
                                                                            _model.dropDownAssignedValue!,
                                                                            _model.textController.text,
                                                                            _model.dropDownValue!)
                                                                        : containerLeadsManagementRecordList)
                                                                    .toList();
                                                                if (containerVar
                                                                    .isEmpty) {
                                                                  return ListViewMsgWidget();
                                                                }

                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      containerVar
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          height:
                                                                              1.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          containerVarIndex) {
                                                                    final containerVarItem =
                                                                        containerVar[
                                                                            containerVarIndex];
                                                                    return Container(
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
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(7.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Ticket :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerVarItem.ticket,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    fontSize: 16.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            )),
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                              tabletLandscape: false,
                                                                                            ))
                                                                                              FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                buttonSize: 28.0,
                                                                                                icon: Icon(
                                                                                                  Icons.edit_square,
                                                                                                  color: FlutterFlowTheme.of(context).tertiary,
                                                                                                  size: 15.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  context.pushNamed(
                                                                                                    DeyeComplaintDetailsWidget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'mobile': serializeParam(
                                                                                                        containerVarItem.mobile,
                                                                                                        ParamType.String,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Customer :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              containerVarItem.username,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Mobile :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            SelectionArea(
                                                                                                child: AutoSizeText(
                                                                                              containerVarItem.mobile,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            )),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 5,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'City :',
                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    containerVarItem.city,
                                                                                                    textAlign: TextAlign.start,
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Serial No. :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              containerVarItem.customFields.serial.toString(),
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Type :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            StreamBuilder<List<CategoryRecord>>(
                                                                                              stream: queryCategoryRecord(
                                                                                                parent: FFAppState().outletRef,
                                                                                                queryBuilder: (categoryRecord) => categoryRecord.where(
                                                                                                  'id',
                                                                                                  isEqualTo: containerVarItem.customFields.productType,
                                                                                                ),
                                                                                                singleRecord: true,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 40.0,
                                                                                                      height: 40.0,
                                                                                                      child: CircularProgressIndicator(
                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                          FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<CategoryRecord> textCategoryRecordList = snapshot.data!;
                                                                                                // Return an empty Container when the item does not exist.
                                                                                                if (snapshot.data!.isEmpty) {
                                                                                                  return Container();
                                                                                                }
                                                                                                final textCategoryRecord = textCategoryRecordList.isNotEmpty ? textCategoryRecordList.first : null;

                                                                                                return SelectionArea(
                                                                                                    child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    textCategoryRecord?.name,
                                                                                                    '-',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                      ),
                                                                                                ));
                                                                                              },
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Capacity :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            StreamBuilder<List<ProductRecord>>(
                                                                                              stream: queryProductRecord(
                                                                                                parent: FFAppState().outletRef,
                                                                                                queryBuilder: (productRecord) => productRecord.where(
                                                                                                  'id',
                                                                                                  isEqualTo: containerVarItem.customFields.capacity,
                                                                                                ),
                                                                                                singleRecord: true,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 40.0,
                                                                                                      height: 40.0,
                                                                                                      child: CircularProgressIndicator(
                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                          FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  );
                                                                                                }
                                                                                                List<ProductRecord> textProductRecordList = snapshot.data!;
                                                                                                // Return an empty Container when the item does not exist.
                                                                                                if (snapshot.data!.isEmpty) {
                                                                                                  return Container();
                                                                                                }
                                                                                                final textProductRecord = textProductRecordList.isNotEmpty ? textProductRecordList.first : null;

                                                                                                return SelectionArea(
                                                                                                    child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    textProductRecord?.name,
                                                                                                    '-',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                      ),
                                                                                                ));
                                                                                              },
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Purchased from :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              containerVarItem.customFields.purchasedFrom,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Created On :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            Text(
                                                                                              dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(containerVarItem.createdDate)),
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Status :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            if (FFAppState().newLead)
                                                                                              FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderWidth: 1.0,
                                                                                                buttonSize: 35.0,
                                                                                                icon: Icon(
                                                                                                  Icons.stars,
                                                                                                  color: Color(0xFFF7B34C),
                                                                                                  size: 12.0,
                                                                                                ),
                                                                                                onPressed: () {
                                                                                                  print('IconButton pressed ...');
                                                                                                },
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
                                                                                                          child: Container(
                                                                                                            height: 300.0,
                                                                                                            width: 300.0,
                                                                                                            child: UpdateStageDropdownCopyWidget(
                                                                                                              doc: containerVarItem,
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ).then((value) => safeSetState(() => _model.stage = value));

                                                                                                  safeSetState(() {});
                                                                                                },
                                                                                                child: Text(
                                                                                                  containerVarItem.stage,
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                        color: FlutterFlowTheme.of(context).customColor5,
                                                                                                        letterSpacing: 1.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Assign to :',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            StreamBuilder<List<UserProfileRecord>>(
                                                                                              stream: queryUserProfileRecord(
                                                                                                queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                  'id',
                                                                                                  isEqualTo: containerVarItem.assignedTo,
                                                                                                ),
                                                                                                singleRecord: true,
                                                                                              ),
                                                                                              builder: (context, snapshot) {
                                                                                                // Customize what your widget looks like when it's loading.
                                                                                                if (!snapshot.hasData) {
                                                                                                  return Center(
                                                                                                    child: SizedBox(
                                                                                                      width: 40.0,
                                                                                                      height: 40.0,
                                                                                                      child: CircularProgressIndicator(
                                                                                                        valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                          FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                        ),
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

                                                                                                return InkWell(
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
                                                                                                          child: Padding(
                                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                                            child: AssignTicketWidget(
                                                                                                              ticket: containerVarItem.ticket,
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      },
                                                                                                    ).then((value) => safeSetState(() {}));
                                                                                                  },
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      textUserProfileRecord?.name,
                                                                                                      '--',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          color: FlutterFlowTheme.of(context).customColor4,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 1,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Comments',
                                                                                              style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                    color: FlutterFlowTheme.of(context).text2nd,
                                                                                                    fontSize: 12.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyLargeFamily),
                                                                                                  ),
                                                                                            ),
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              containerVarItem.comments,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                  ),
                                                                                            )),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 0.0),
                                                                                    child: SelectionArea(
                                                                                        child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions.leadsReq(containerVarItem.requirement),
                                                                                        'Requirement not specified',
                                                                                      ),
                                                                                      textAlign: TextAlign.start,
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            color: FlutterFlowTheme.of(context).customColor5,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                          ),
                                                                                    )),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 8.0)),
                                                                              ),
                                                                            ),
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                          child: Padding(
                                                                                            padding: MediaQuery.viewInsetsOf(context),
                                                                                            child: CallDetailsWidget(
                                                                                              id: containerVarItem.id,
                                                                                              username: containerVarItem.username,
                                                                                              mobile: containerVarItem.mobile,
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
                                                                                    await launchURL('https://wa.me/');
                                                                                  },
                                                                                ),
                                                                              ].divide(SizedBox(height: 5.0)),
                                                                            ),
                                                                          ].divide(SizedBox(width: 15.0)),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 5.0)),
                                          ),
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      StreamBuilder<
                                          List<LeadsManagementRecord>>(
                                        stream: queryLeadsManagementRecord(
                                          parent: FFAppState().outletRef,
                                          queryBuilder:
                                              (leadsManagementRecord) =>
                                                  leadsManagementRecord
                                                      .where(
                                                        'zone',
                                                        isEqualTo:
                                                            FFAppState().zone,
                                                      )
                                                      .where(
                                                        'createdDate',
                                                        isGreaterThan: functions
                                                            .lastDays(7),
                                                      )
                                                      .where(
                                                        'createdDate',
                                                        isLessThanOrEqualTo:
                                                            functions
                                                                .timestampToMili(
                                                                    getCurrentTimestamp),
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  size: 30.0,
                                                ),
                                              ),
                                            );
                                          }
                                          List<LeadsManagementRecord>
                                              containerLeadsManagementRecordList =
                                              snapshot.data!;

                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Container(
                                              width: double.infinity,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor3,
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                        width: 0.5,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  15.0,
                                                                  10.0,
                                                                  15.0,
                                                                  10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            'Statistics ',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelLarge
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLargeFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBtnText,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelLargeFamily),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 10.0,
                                                                0.0, 10.0),
                                                    child: Container(
                                                      width: 300.0,
                                                      height: 150.0,
                                                      child:
                                                          FlutterFlowPieChart(
                                                        data: FFPieChartData(
                                                          values: functions
                                                              .groupLeadDocs(
                                                                  'status',
                                                                  containerLeadsManagementRecordList
                                                                      .toList())
                                                              .map((e) =>
                                                                  getJsonField(
                                                                    e,
                                                                    r'''$.count''',
                                                                  ))
                                                              .toList(),
                                                          colors:
                                                              chartPieChartColorsList,
                                                          radius: [70.0],
                                                          borderWidth: [1.0],
                                                          borderColor: [
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondary
                                                          ],
                                                        ),
                                                        donutHoleRadius: 0.0,
                                                        donutHoleColor:
                                                            Colors.transparent,
                                                        sectionLabelType:
                                                            PieChartSectionLabelType
                                                                .value,
                                                        sectionLabelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryBackground,
                                                                  fontSize:
                                                                      10.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineSmallFamily),
                                                                ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: 394.0,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              border: Border.all(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor1,
                                                width: 0.5,
                                              ),
                                            ),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor3,
                                                    border: Border.all(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      width: 0.5,
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                15.0,
                                                                10.0,
                                                                15.0,
                                                                10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          'Activity Log',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(10.0),
                                                    child: StreamBuilder<
                                                        List<
                                                            LeadActivitiesRecord>>(
                                                      stream:
                                                          queryLeadActivitiesRecord(
                                                        parent: FFAppState()
                                                            .outletRef,
                                                        queryBuilder: (leadActivitiesRecord) =>
                                                            leadActivitiesRecord
                                                                .orderBy(
                                                                    'scheduledDate',
                                                                    descending:
                                                                        true),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        List<LeadActivitiesRecord>
                                                            listViewLeadActivitiesRecordList =
                                                            snapshot.data!;

                                                        return ListView
                                                            .separated(
                                                          padding:
                                                              EdgeInsets.zero,
                                                          shrinkWrap: true,
                                                          scrollDirection:
                                                              Axis.vertical,
                                                          itemCount:
                                                              listViewLeadActivitiesRecordList
                                                                  .length,
                                                          separatorBuilder: (_,
                                                                  __) =>
                                                              SizedBox(
                                                                  height: 5.0),
                                                          itemBuilder: (context,
                                                              listViewIndex) {
                                                            final listViewLeadActivitiesRecord =
                                                                listViewLeadActivitiesRecordList[
                                                                    listViewIndex];
                                                            return Container(
                                                              width: 100.0,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                              ),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    '${listViewLeadActivitiesRecord.type}  activity has been scheduled for  ${listViewLeadActivitiesRecord.leadName}',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelSmallFamily,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                          lineHeight:
                                                                              1.5,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                              "MMMMEEEEd",
                                                                              DateTime.fromMillisecondsSinceEpoch(listViewLeadActivitiesRecord.scheduledDate)),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).customColor3,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          dateTimeFormat(
                                                                              "jm",
                                                                              DateTime.fromMillisecondsSinceEpoch(listViewLeadActivitiesRecord.scheduledTime)),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).customColor3,
                                                                                fontSize: 12.0,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Divider(
                                                                    height:
                                                                        10.0,
                                                                    thickness:
                                                                        1.0,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                  ),
                                                                ].divide(SizedBox(
                                                                    height:
                                                                        3.0)),
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
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: StreamBuilder<
                                            List<LeadsManagementRecord>>(
                                          stream: queryLeadsManagementRecord(
                                            parent: FFAppState().outletRef,
                                            queryBuilder:
                                                (leadsManagementRecord) =>
                                                    leadsManagementRecord
                                                        .where(
                                                          'zone',
                                                          isEqualTo:
                                                              FFAppState().zone,
                                                        )
                                                        .where(
                                                          'createdDate',
                                                          isGreaterThan:
                                                              functions
                                                                  .last30days(),
                                                        )
                                                        .where(
                                                          'createdDate',
                                                          isLessThanOrEqualTo:
                                                              functions
                                                                  .tommarow(),
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 30.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<LeadsManagementRecord>
                                                containerLeadsManagementRecordList =
                                                snapshot.data!;

                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                              child: Container(
                                                width: double.infinity,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  border: Border.all(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .customColor1,
                                                    width: 0.5,
                                                  ),
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Container(
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        border: Border.all(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                          width: 0.5,
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    15.0,
                                                                    10.0,
                                                                    15.0,
                                                                    10.0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Text(
                                                              'Top Members with Tickets',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelLargeFamily),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding: EdgeInsets.all(
                                                            10.0),
                                                        child: Builder(
                                                          builder: (context) {
                                                            final list = functions
                                                                .groupLeadByExcecutive(
                                                                    containerLeadsManagementRecordList
                                                                        .toList())
                                                                .toList();

                                                            return ListView
                                                                .separated(
                                                              padding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              shrinkWrap: true,
                                                              scrollDirection:
                                                                  Axis.vertical,
                                                              itemCount:
                                                                  list.length,
                                                              separatorBuilder: (_,
                                                                      __) =>
                                                                  SizedBox(
                                                                      height:
                                                                          15.0),
                                                              itemBuilder:
                                                                  (context,
                                                                      listIndex) {
                                                                final listItem =
                                                                    list[
                                                                        listIndex];
                                                                return Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          35.0,
                                                                      height:
                                                                          35.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        shape: BoxShape
                                                                            .circle,
                                                                      ),
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/employee.jpeg',
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              UserProfileRecord>>(
                                                                        stream:
                                                                            queryUserProfileRecord(
                                                                          queryBuilder: (userProfileRecord) =>
                                                                              userProfileRecord.where(
                                                                            'id',
                                                                            isEqualTo:
                                                                                getJsonField(
                                                                              listItem,
                                                                              r'''$.id''',
                                                                            ).toString(),
                                                                          ),
                                                                          singleRecord:
                                                                              true,
                                                                        ),
                                                                        builder:
                                                                            (context,
                                                                                snapshot) {
                                                                          // Customize what your widget looks like when it's loading.
                                                                          if (!snapshot
                                                                              .hasData) {
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
                                                                          List<UserProfileRecord>
                                                                              textUserProfileRecordList =
                                                                              snapshot.data!;
                                                                          // Return an empty Container when the item does not exist.
                                                                          if (snapshot
                                                                              .data!
                                                                              .isEmpty) {
                                                                            return Container();
                                                                          }
                                                                          final textUserProfileRecord = textUserProfileRecordList.isNotEmpty
                                                                              ? textUserProfileRecordList.first
                                                                              : null;

                                                                          return Text(
                                                                            valueOrDefault<String>(
                                                                              textUserProfileRecord?.name,
                                                                              '-',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                ),
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        listItem,
                                                                        r'''$.count''',
                                                                      ).toString(),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelSmallFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                          ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          10.0)),
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
                                            );
                                          },
                                        ),
                                      ),
                                    ].divide(SizedBox(height: 10.0)),
                                  ),
                                ),
                              ].divide(SizedBox(width: 10.0)),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              if (_model.showMore)
                Align(
                  alignment: AlignmentDirectional(1.0, -1.0),
                  child: Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 70.0, 90.0, 0.0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * 0.25,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).back2nd,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 65.0,
                            color: Color(0xB1000000),
                            offset: Offset(
                              5.0,
                              4.0,
                            ),
                            spreadRadius: 5.0,
                          )
                        ],
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).warning,
                          width: 2.0,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            FlutterFlowIconButton(
                              borderRadius: 8.0,
                              buttonSize: 35.0,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              icon: Icon(
                                Icons.close_sharp,
                                color: FlutterFlowTheme.of(context).primary,
                                size: 18.0,
                              ),
                              onPressed: () async {
                                if (animationsMap[
                                        'containerOnActionTriggerAnimation'] !=
                                    null) {
                                  await animationsMap[
                                          'containerOnActionTriggerAnimation']!
                                      .controller
                                      .reverse();
                                }
                              },
                            ),
                            StreamBuilder<List<NotificationsRecord>>(
                              stream: queryNotificationsRecord(
                                queryBuilder: (notificationsRecord) =>
                                    notificationsRecord.where(
                                  'isSeen',
                                  isEqualTo: false,
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
                                List<NotificationsRecord>
                                    listViewNotificationsRecordList =
                                    snapshot.data!;

                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewNotificationsRecordList.length,
                                  separatorBuilder: (_, __) =>
                                      SizedBox(height: 3.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewNotificationsRecord =
                                        listViewNotificationsRecordList[
                                            listViewIndex];
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(15.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Text(
                                                listViewNotificationsRecord
                                                    .title,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                              ),
                                            ),
                                            Text(
                                              'Msg',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmallFamily),
                                                      ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
                      ),
                    ).animateOnActionTrigger(
                      animationsMap['containerOnActionTriggerAnimation']!,
                    ),
                  ),
                ),
            ],
          ),
        ));
  }
}
