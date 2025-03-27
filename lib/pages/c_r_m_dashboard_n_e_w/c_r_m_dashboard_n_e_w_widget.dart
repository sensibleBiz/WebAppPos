import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/assign_ticket/assign_ticket_widget.dart';
import '/pages/components/c_header/c_header_widget.dart';
import '/pages/components/call_details/call_details_widget.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import '/pages/components/dis_qualify_lead/dis_qualify_lead_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/message_box/message_box_widget.dart';
import '/pages/components/schedule/schedule_widget.dart';
import '/pages/components/update_stage_dropdown/update_stage_dropdown_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'c_r_m_dashboard_n_e_w_model.dart';
export 'c_r_m_dashboard_n_e_w_model.dart';

class CRMDashboardNEWWidget extends StatefulWidget {
  const CRMDashboardNEWWidget({super.key});

  static String routeName = 'CRMDashboardNEW';
  static String routePath = 'CRMDashboardNEW';

  @override
  State<CRMDashboardNEWWidget> createState() => _CRMDashboardNEWWidgetState();
}

class _CRMDashboardNEWWidgetState extends State<CRMDashboardNEWWidget>
    with TickerProviderStateMixin {
  late CRMDashboardNEWModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool textFieldCityFocusListenerRegistered = false;
  var hasContainerTriggered1 = false;
  var hasContainerTriggered2 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CRMDashboardNEWModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.leadDetailsCopy1 = await actions.leadDocRefCopy(
        getCurrentTimestamp.toString(),
        FFAppState().outletId,
        'new',
        functions.last30days(),
        functions.timestampToMili(getCurrentTimestamp),
      );
      _model.leadDetailsCopy2 = await actions.leadDocRefCopy(
        '0',
        FFAppState().outletId,
        'all',
        functions.last30days(),
        functions.timestampToMili(getCurrentTimestamp),
      );
      FFAppState().allLeads = _model.leadDetailsCopy1!.toList().cast<dynamic>();
      FFAppState().update(() {});
      FFAppState().assignedExec = false;
      FFAppState().lostLeadIcon = false;
      safeSetState(() {});
      FFAppState().leadCreateValue = 'New Leads';
      FFAppState().nleads = Color(0xFF210EAF);
      FFAppState().aleads = Colors.transparent;
      FFAppState().cLeads = Colors.transparent;
      FFAppState().lleads = Colors.transparent;
      safeSetState(() {});
      FFAppState().searchHide = false;
      FFAppState().startDate = functions.lastDays(15);
      FFAppState().endDate = functions.tommarow();
      safeSetState(() {});
    });

    _model.expandableExpandableController1 =
        ExpandableController(initialExpanded: false);
    _model.textFieldCityTextController ??= TextEditingController();

    _model.textFieldMobileTextController ??= TextEditingController();
    _model.textFieldMobileFocusNode ??= FocusNode();
    _model.textFieldMobileFocusNode!.addListener(
      () async {
        safeSetState(() {
          _model.textFieldCityTextController?.clear();
        });
        safeSetState(() {
          _model.dropDownAssignedToValueController?.reset();
          _model.dropDownStatusSValueController?.reset();
        });
      },
    );
    animationsMap.addAll({
      'containerOnActionTriggerAnimation1': AnimationInfo(
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
      'containerOnActionTriggerAnimation2': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          VisibilityEffect(duration: 1.ms),
          FadeEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 600.0.ms,
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
        title: 'CRMDashboardNEW',
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
                Padding(
                  padding:
                      EdgeInsetsDirectional.fromSTEB(15.0, 10.0, 15.0, 10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      wrapWithModel(
                        model: _model.cHeaderModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CHeaderWidget(),
                      ),
                      Expanded(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(0.0),
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(0.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 25.0, 0.0),
                                      child: Text(
                                        ' Dashboard',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineLargeFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineLargeFamily),
                                            ),
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
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 10.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.add,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 22.0,
                                          ),
                                          onPressed: () async {
                                            context.goNamed(
                                                DeyeAddComplaintsWidget
                                                    .routeName);
                                          },
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 10.0, 0.0),
                                        child: FlutterFlowIconButton(
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          borderRadius: 10.0,
                                          borderWidth: 1.0,
                                          buttonSize: 40.0,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          icon: Icon(
                                            Icons.menu_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 22.0,
                                          ),
                                          onPressed: () async {
                                            _model.showMore = true;
                                            safeSetState(() {});

                                            context.pushNamed(
                                                CReportsWidget.routeName);
                                          },
                                        ),
                                      ),
                                      FlutterFlowIconButton(
                                        borderColor:
                                            FlutterFlowTheme.of(context)
                                                .primary,
                                        borderRadius: 10.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        icon: Icon(
                                          Icons.chat,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          scaffoldKey.currentState!
                                              .openEndDrawer();
                                        },
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
                        flex: 26,
                        child: Container(
                          width: double.infinity,
                          height: 100.0,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 5.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10.0),
                                      child: Container(
                                        width: 200.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          border: Border.all(
                                            color: valueOrDefault<Color>(
                                              FFAppState().nleads,
                                              FlutterFlowTheme.of(context)
                                                  .primaryBackground,
                                            ),
                                            width: 3.0,
                                          ),
                                        ),
                                        child: Container(
                                          width: double.infinity,
                                          color: Color(0x00000000),
                                          child: ExpandableNotifier(
                                            controller: _model
                                                .expandableExpandableController1,
                                            child: ExpandablePanel(
                                              header: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  _model.res333 = await actions
                                                      .leadDocRefCopy(
                                                    '0',
                                                    FFAppState().outletId,
                                                    'new',
                                                    functions.last30days(),
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                  );
                                                  FFAppState().assignedExec =
                                                      false;
                                                  FFAppState().lostLeadIcon =
                                                      false;
                                                  safeSetState(() {});
                                                  FFAppState().allLeads = _model
                                                      .res333!
                                                      .toList()
                                                      .cast<dynamic>();
                                                  FFAppState().update(() {});
                                                  FFAppState().leadCreateValue =
                                                      'New Leads';
                                                  FFAppState().nleads =
                                                      Color(0xFF210EAF);
                                                  FFAppState().aleads =
                                                      Colors.transparent;
                                                  FFAppState().fLeads =
                                                      Colors.transparent;
                                                  FFAppState().cLeads =
                                                      Colors.transparent;
                                                  FFAppState().lleads =
                                                      Colors.transparent;
                                                  safeSetState(() {});
                                                  FFAppState().searchHide =
                                                      false;
                                                  safeSetState(() {});
                                                  FFAppState().isSearching =
                                                      false;
                                                  safeSetState(() {});

                                                  safeSetState(() {});
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10.0,
                                                                25.0,
                                                                10.0,
                                                                25.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              'New',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
                                                            ),
                                                            if (false)
                                                              Text(
                                                                getJsonField(
                                                                  FFAppState()
                                                                      .newLeadCounts
                                                                      .firstOrNull,
                                                                  r'''$.total''',
                                                                ).toString(),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .headlineMediumFamily,
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
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              collapsed: Container(),
                                              expanded: Visibility(
                                                visible: false,
                                                child: Builder(
                                                  builder: (context) {
                                                    final list = functions
                                                        .demoListLastObjCopy(
                                                            FFAppState()
                                                                .newLeadCounts
                                                                .toList())
                                                        .toList();

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: List.generate(
                                                          list.length,
                                                          (listIndex) {
                                                        final listItem =
                                                            list[listIndex];
                                                        return Container(
                                                          width:
                                                              double.infinity,
                                                          height: 100.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        5.0,
                                                                        10.0,
                                                                        10.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'IndiaMart',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            listItem,
                                                                            r'''$.indiamart''',
                                                                          )?.toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'JustDial',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            listItem,
                                                                            r'''$.justdail''',
                                                                          )?.toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Facebook',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            listItem,
                                                                            r'''$.facebook''',
                                                                          )?.toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          3.0,
                                                                          0.0,
                                                                          3.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Quick Add',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          getJsonField(
                                                                            listItem,
                                                                            r'''$.quicklead''',
                                                                          )?.toString(),
                                                                          '0',
                                                                        ),
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
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
                                  StreamBuilder<List<LeadStagesRecord>>(
                                    stream: queryLeadStagesRecord(
                                      parent: FFAppState().outletRef,
                                      queryBuilder: (leadStagesRecord) =>
                                          leadStagesRecord.orderBy('code'),
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
                                      List<LeadStagesRecord>
                                          leadsTabsLeadStagesRecordList =
                                          snapshot.data!;

                                      return Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: List.generate(
                                            leadsTabsLeadStagesRecordList
                                                .length, (leadsTabsIndex) {
                                          final leadsTabsLeadStagesRecord =
                                              leadsTabsLeadStagesRecordList[
                                                  leadsTabsIndex];
                                          return ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            child: Container(
                                              width: 200.0,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                                border: Border.all(
                                                  color:
                                                      leadsTabsLeadStagesRecord
                                                                  .name ==
                                                              FFAppState()
                                                                  .leadCreateValue
                                                          ? FlutterFlowTheme.of(
                                                                  context)
                                                              .primary
                                                          : FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryBackground,
                                                  width: 3.0,
                                                ),
                                              ),
                                              child: Container(
                                                width: double.infinity,
                                                color: Color(0x00000000),
                                                child: ExpandableNotifier(
                                                  initialExpanded: false,
                                                  child: ExpandablePanel(
                                                    header: Padding(
                                                      padding:
                                                          EdgeInsets.all(2.0),
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
                                                          _model.res2 =
                                                              await actions
                                                                  .leadDocRefCopy(
                                                            '0',
                                                            FFAppState()
                                                                .outletId,
                                                            leadsTabsLeadStagesRecord
                                                                .name,
                                                            functions
                                                                .last30days(),
                                                            functions
                                                                .timestampToMili(
                                                                    getCurrentTimestamp),
                                                          );
                                                          FFAppState()
                                                                  .assignedExec =
                                                              true;
                                                          FFAppState()
                                                                  .allLeads =
                                                              _model.res2!
                                                                  .toList()
                                                                  .cast<
                                                                      dynamic>();
                                                          safeSetState(() {});
                                                          FFAppState()
                                                                  .leadCreateValue =
                                                              leadsTabsLeadStagesRecord
                                                                  .name;
                                                          FFAppState()
                                                                  .lostLeadIcon =
                                                              false;
                                                          safeSetState(() {});
                                                          FFAppState().nleads =
                                                              Colors
                                                                  .transparent;
                                                          FFAppState().aleads =
                                                              Color(0xFFCC0404);
                                                          FFAppState().cLeads =
                                                              Colors
                                                                  .transparent;
                                                          FFAppState().lleads =
                                                              Colors
                                                                  .transparent;
                                                          safeSetState(() {});
                                                          FFAppState()
                                                                  .searchHide =
                                                              true;
                                                          safeSetState(() {});
                                                          FFAppState()
                                                                  .isSearching =
                                                              false;
                                                          safeSetState(() {});

                                                          safeSetState(() {});
                                                        },
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10.0,
                                                                        25.0,
                                                                        10.0,
                                                                        25.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      leadsTabsLeadStagesRecord
                                                                          .display,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .titleMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).titleMediumFamily,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                          ),
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
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
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
                                                    collapsed: Container(),
                                                    expanded: Visibility(
                                                      visible: false,
                                                      child: Builder(
                                                        builder: (context) {
                                                          final assList = functions
                                                              .demoListLastObjCopy(
                                                                  FFAppState()
                                                                      .assignedLeadCount
                                                                      .toList())
                                                              .toList();

                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: List.generate(
                                                                assList.length,
                                                                (assListIndex) {
                                                              final assListItem =
                                                                  assList[
                                                                      assListIndex];
                                                              return Container(
                                                                width: double
                                                                    .infinity,
                                                                height: 100.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          5.0,
                                                                          10.0,
                                                                          10.0),
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Call Pending',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                assListItem,
                                                                                r'''$.callPending''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Demo Pending',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                assListItem,
                                                                                r'''$.demoPending''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Demo Sceduled',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                assListItem,
                                                                                r'''$.demoScheduled''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            3.0,
                                                                            0.0,
                                                                            3.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Text(
                                                                              'Called',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                            Text(
                                                                              getJsonField(
                                                                                assListItem,
                                                                                r'''$.called''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            }),
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    theme: ExpandableThemeData(
                                                      tapHeaderToExpand: true,
                                                      tapBodyToExpand: false,
                                                      tapBodyToCollapse: false,
                                                      headerAlignment:
                                                          ExpandablePanelHeaderAlignment
                                                              .center,
                                                      hasIcon: true,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        }).divide(SizedBox(height: 5.0)),
                                      );
                                    },
                                  ),
                                ],
                              ),
                              Expanded(
                                flex: 9,
                                child: Container(
                                  decoration: BoxDecoration(),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (FFAppState().searchHide &&
                                          responsiveVisibility(
                                            context: context,
                                            phone: false,
                                            tablet: false,
                                          ))
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 15.0),
                                          child: Container(
                                            width: double.infinity,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.07,
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 5.0, 0.0),
                                              child: Stack(
                                                alignment: AlignmentDirectional(
                                                    1.0, 0.0),
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                5.0, 0.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        FFButtonWidget(
                                                          onPressed: () async {
                                                            if (animationsMap[
                                                                    'containerOnActionTriggerAnimation1'] !=
                                                                null) {
                                                              safeSetState(() =>
                                                                  hasContainerTriggered1 =
                                                                      true);
                                                              SchedulerBinding
                                                                  .instance
                                                                  .addPostFrameCallback((_) async => await animationsMap[
                                                                          'containerOnActionTriggerAnimation1']!
                                                                      .controller
                                                                      .forward(
                                                                          from:
                                                                              0.0));
                                                            }
                                                          },
                                                          text: 'Lead Search',
                                                          icon: Icon(
                                                            Icons.search,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .lineColor,
                                                            size: 16.0,
                                                          ),
                                                          options:
                                                              FFButtonOptions(
                                                            width: 140.0,
                                                            height: 40.0,
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            iconPadding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .tertiary,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .lineColor,
                                                                      fontSize:
                                                                          11.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleSmallFamily),
                                                                    ),
                                                            elevation: 2.0,
                                                            borderSide:
                                                                BorderSide(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 1.0,
                                                            ),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20.0),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          3.0,
                                                                          0.0),
                                                              child: Container(
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              UserProfileRecord>>(
                                                                        stream:
                                                                            queryUserProfileRecord(
                                                                          queryBuilder: (userProfileRecord) =>
                                                                              userProfileRecord.where(
                                                                            'outlets',
                                                                            arrayContains: FFAppState().outletId != ''
                                                                                ? FFAppState().outletId
                                                                                : null,
                                                                          ),
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
                                                                              dropDownAssignedToUserProfileRecordList =
                                                                              snapshot.data!;

                                                                          return FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.dropDownAssignedToValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownAssignedToValue ??= '',
                                                                            ),
                                                                            options:
                                                                                List<String>.from(dropDownAssignedToUserProfileRecordList.where((e) => e.permissionList.where((e) => (e.title == 'Leads') && (e.value != 0)).toList().isNotEmpty).toList().map((e) => e.id).toList()),
                                                                            optionLabels:
                                                                                dropDownAssignedToUserProfileRecordList.where((e) => e.permissionList.where((e) => (e.title == 'Leads') && (e.value != 0)).toList().isNotEmpty).toList().map((e) => e.name).toList(),
                                                                            onChanged:
                                                                                (val) async {
                                                                              safeSetState(() => _model.dropDownAssignedToValue = val);
                                                                              safeSetState(() {
                                                                                _model.textFieldMobileTextController?.clear();
                                                                                _model.textFieldCityTextController?.clear();
                                                                              });
                                                                              _model.resAssignedTo = await queryLeadsManagementRecordOnce(
                                                                                parent: FFAppState().outletRef,
                                                                                queryBuilder: (leadsManagementRecord) => leadsManagementRecord
                                                                                    .where(
                                                                                      'assignedTo',
                                                                                      isEqualTo: _model.dropDownAssignedToValue,
                                                                                    )
                                                                                    .where(
                                                                                      'createdDate',
                                                                                      isGreaterThanOrEqualTo: FFAppState().startDate,
                                                                                    )
                                                                                    .where(
                                                                                      'createdDate',
                                                                                      isLessThan: FFAppState().endDate,
                                                                                    ),
                                                                              );
                                                                              if (_model.dropDownStatusSValue != null && _model.dropDownStatusSValue != '') {
                                                                                _model.allLeadSearchRess3 = await actions.leadDocToLeadJson(
                                                                                  _model.resAssignedTo!.where((e) => e.status == _model.dropDownStatusSValue).toList(),
                                                                                );
                                                                                FFAppState().allLeads = _model.allLeadSearchRess3!.toList().cast<dynamic>();
                                                                                safeSetState(() {});
                                                                              } else {
                                                                                _model.allLeadSearchRes4 = await actions.leadDocToLeadJson(
                                                                                  _model.resAssignedTo!.toList(),
                                                                                );
                                                                                FFAppState().allLeads = _model.allLeadSearchRes4!.toList().cast<dynamic>();
                                                                                safeSetState(() {});
                                                                              }

                                                                              FFAppState().isSearching = true;
                                                                              safeSetState(() {});

                                                                              safeSetState(() {});
                                                                            },
                                                                            width:
                                                                                250.0,
                                                                            height:
                                                                                50.0,
                                                                            searchHintTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            hintText:
                                                                                ' AssignedTo',
                                                                            searchHintText:
                                                                                'Search for an item...',
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 16.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).customColor1,
                                                                            borderWidth:
                                                                                1.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                5.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isOverButton:
                                                                                true,
                                                                            isSearchable:
                                                                                true,
                                                                            isMultiSelect:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child: StreamBuilder<
                                                                          List<
                                                                              LeadStagesRecord>>(
                                                                        stream:
                                                                            queryLeadStagesRecord(
                                                                          parent:
                                                                              FFAppState().outletRef,
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
                                                                          List<LeadStagesRecord>
                                                                              dropDownStatusSLeadStagesRecordList =
                                                                              snapshot.data!;

                                                                          return FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.dropDownStatusSValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownStatusSValue ??= '',
                                                                            ),
                                                                            options:
                                                                                List<String>.from(dropDownStatusSLeadStagesRecordList.map((e) => e.name).toList()),
                                                                            optionLabels:
                                                                                dropDownStatusSLeadStagesRecordList.map((e) => e.display).toList(),
                                                                            onChanged:
                                                                                (val) async {
                                                                              safeSetState(() => _model.dropDownStatusSValue = val);
                                                                              safeSetState(() {
                                                                                _model.textFieldMobileTextController?.clear();
                                                                                _model.textFieldCityTextController?.clear();
                                                                              });
                                                                              _model.resSource3 = await queryLeadsManagementRecordOnce(
                                                                                parent: FFAppState().outletRef,
                                                                                queryBuilder: (leadsManagementRecord) => leadsManagementRecord
                                                                                    .whereIn('status', functions.statusFilters(_model.dropDownStatusSValue!))
                                                                                    .where(
                                                                                      'createdDate',
                                                                                      isGreaterThanOrEqualTo: FFAppState().startDate,
                                                                                    )
                                                                                    .where(
                                                                                      'createdDate',
                                                                                      isLessThan: FFAppState().endDate,
                                                                                    ),
                                                                              );
                                                                              if (_model.dropDownAssignedToValue != null && _model.dropDownAssignedToValue != '') {
                                                                                _model.allLeadSearch11 = await actions.leadDocToLeadJson(
                                                                                  _model.resSource3!.where((e) => e.assignedTo == _model.dropDownAssignedToValue).toList(),
                                                                                );
                                                                                FFAppState().allLeads = _model.allLeadSearch11!.toList().cast<dynamic>();
                                                                                safeSetState(() {});
                                                                              } else {
                                                                                _model.allLeadSearchRess14 = await actions.leadDocToLeadJson(
                                                                                  _model.resSource3!.toList(),
                                                                                );
                                                                                FFAppState().allLeads = _model.allLeadSearchRess14!.toList().cast<dynamic>();
                                                                                safeSetState(() {});
                                                                              }

                                                                              FFAppState().isSearching = true;
                                                                              safeSetState(() {});

                                                                              safeSetState(() {});
                                                                            },
                                                                            height:
                                                                                50.0,
                                                                            searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                ),
                                                                            searchTextStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                  fontSize: 13.0,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            hintText:
                                                                                'Status',
                                                                            searchHintText:
                                                                                'Search for an item...',
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 16.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).customColor1,
                                                                            borderWidth:
                                                                                1.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                4.0,
                                                                                10.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isOverButton:
                                                                                true,
                                                                            isSearchable:
                                                                                true,
                                                                            isMultiSelect:
                                                                                false,
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor1,
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: StreamBuilder<List<CitiesRecord>>(
                                                                                  stream: queryCitiesRecord(),
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
                                                                                    List<CitiesRecord> textFieldCityCitiesRecordList = snapshot.data!;

                                                                                    return Autocomplete<String>(
                                                                                      initialValue: TextEditingValue(),
                                                                                      optionsBuilder: (textEditingValue) {
                                                                                        if (textEditingValue.text == '') {
                                                                                          return const Iterable<String>.empty();
                                                                                        }
                                                                                        return textFieldCityCitiesRecordList.map((e) => e.cityName).toList().where((option) {
                                                                                          final lowercaseOption = option.toLowerCase();
                                                                                          return lowercaseOption.contains(textEditingValue.text.toLowerCase());
                                                                                        });
                                                                                      },
                                                                                      optionsViewBuilder: (context, onSelected, options) {
                                                                                        return AutocompleteOptionsList(
                                                                                          textFieldKey: _model.textFieldCityKey,
                                                                                          textController: _model.textFieldCityTextController!,
                                                                                          options: options.toList(),
                                                                                          onSelected: onSelected,
                                                                                          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          textHighlightStyle: TextStyle(),
                                                                                          elevation: 4.0,
                                                                                          optionBackgroundColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                          optionHighlightColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          maxHeight: 200.0,
                                                                                        );
                                                                                      },
                                                                                      onSelected: (String selection) {
                                                                                        safeSetState(() => _model.textFieldCitySelectedOption = selection);
                                                                                        FocusScope.of(context).unfocus();
                                                                                      },
                                                                                      fieldViewBuilder: (
                                                                                        context,
                                                                                        textEditingController,
                                                                                        focusNode,
                                                                                        onEditingComplete,
                                                                                      ) {
                                                                                        _model.textFieldCityFocusNode = focusNode;
                                                                                        if (!textFieldCityFocusListenerRegistered) {
                                                                                          textFieldCityFocusListenerRegistered = true;
                                                                                          _model.textFieldCityFocusNode!.addListener(
                                                                                            () async {
                                                                                              safeSetState(() {
                                                                                                _model.textFieldMobileTextController?.clear();
                                                                                              });
                                                                                              safeSetState(() {
                                                                                                _model.dropDownStatusSValueController?.reset();
                                                                                                _model.dropDownAssignedToValueController?.reset();
                                                                                              });
                                                                                            },
                                                                                          );
                                                                                        }
                                                                                        _model.textFieldCityTextController = textEditingController;
                                                                                        return TextFormField(
                                                                                          key: _model.textFieldCityKey,
                                                                                          controller: textEditingController,
                                                                                          focusNode: focusNode,
                                                                                          onEditingComplete: onEditingComplete,
                                                                                          onChanged: (_) => EasyDebounce.debounce(
                                                                                            '_model.textFieldCityTextController',
                                                                                            Duration(milliseconds: 2000),
                                                                                            () async {
                                                                                              _model.resCity = await queryLeadsManagementRecordOnce(
                                                                                                parent: FFAppState().outletRef,
                                                                                                queryBuilder: (leadsManagementRecord) => leadsManagementRecord
                                                                                                    .where(
                                                                                                      'city',
                                                                                                      isGreaterThanOrEqualTo: _model.textFieldCityTextController.text,
                                                                                                    )
                                                                                                    .where(
                                                                                                      'city',
                                                                                                      isLessThanOrEqualTo: '${_model.textFieldCityTextController.text}~',
                                                                                                    ),
                                                                                              );
                                                                                              _model.allLeadSearchRes2 = await actions.leadDocToLeadJson(
                                                                                                _model.resCity!.toList(),
                                                                                              );
                                                                                              FFAppState().allLeads = _model.allLeadSearchRes2!.toList().cast<dynamic>();
                                                                                              safeSetState(() {});

                                                                                              safeSetState(() {});
                                                                                            },
                                                                                          ),
                                                                                          autofocus: false,
                                                                                          obscureText: false,
                                                                                          decoration: InputDecoration(
                                                                                            labelText: 'City',
                                                                                            labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                            hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                            enabledBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
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
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            focusedErrorBorder: OutlineInputBorder(
                                                                                              borderSide: BorderSide(
                                                                                                color: Color(0x00000000),
                                                                                                width: 1.0,
                                                                                              ),
                                                                                              borderRadius: BorderRadius.circular(8.0),
                                                                                            ),
                                                                                            contentPadding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                              ),
                                                                                          validator: _model.textFieldCityTextControllerValidator.asValidator(context),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  safeSetState(() {
                                                                                    _model.textFieldMobileTextController?.clear();
                                                                                  });
                                                                                  safeSetState(() {
                                                                                    _model.dropDownAssignedToValueController?.reset();
                                                                                    _model.dropDownStatusSValueController?.reset();
                                                                                  });
                                                                                  _model.resCity13 = await queryLeadsManagementRecordOnce(
                                                                                    parent: FFAppState().outletRef,
                                                                                    queryBuilder: (leadsManagementRecord) => leadsManagementRecord
                                                                                        .where(
                                                                                          'city',
                                                                                          isGreaterThanOrEqualTo: _model.textFieldCityTextController.text,
                                                                                        )
                                                                                        .where(
                                                                                          'city',
                                                                                          isLessThanOrEqualTo: '${_model.textFieldCityTextController.text}~',
                                                                                        ),
                                                                                  );
                                                                                  _model.allLeadSearchRes13 = await actions.leadDocToLeadJson(
                                                                                    _model.resCity13!.toList(),
                                                                                  );
                                                                                  FFAppState().allLeads = _model.allLeadSearchRes13!.toList().cast<dynamic>();
                                                                                  safeSetState(() {});
                                                                                  FFAppState().isSearching = true;
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.search,
                                                                                  color: FlutterFlowTheme.of(context).customColor3,
                                                                                  size: 25.0,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            double.infinity,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor1,
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Expanded(
                                                                                child: TextFormField(
                                                                                  controller: _model.textFieldMobileTextController,
                                                                                  focusNode: _model.textFieldMobileFocusNode,
                                                                                  onChanged: (_) => EasyDebounce.debounce(
                                                                                    '_model.textFieldMobileTextController',
                                                                                    Duration(milliseconds: 2000),
                                                                                    () async {
                                                                                      _model.res1 = await queryLeadsManagementRecordOnce(
                                                                                        parent: FFAppState().outletRef,
                                                                                        queryBuilder: (leadsManagementRecord) => leadsManagementRecord
                                                                                            .where(
                                                                                              'mobile',
                                                                                              isGreaterThanOrEqualTo: _model.textFieldMobileTextController.text,
                                                                                            )
                                                                                            .where(
                                                                                              'mobile',
                                                                                              isLessThanOrEqualTo: '${_model.textFieldMobileTextController.text}~',
                                                                                            ),
                                                                                      );
                                                                                      _model.allLeadSearchRes1 = await actions.leadDocToLeadJson(
                                                                                        _model.res1!.toList(),
                                                                                      );
                                                                                      FFAppState().allLeads = _model.allLeadSearchRes1!.toList().cast<dynamic>();
                                                                                      safeSetState(() {});

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                  ),
                                                                                  onFieldSubmitted: (_) async {},
                                                                                  autofocus: false,
                                                                                  obscureText: false,
                                                                                  decoration: InputDecoration(
                                                                                    labelText: 'Mobile',
                                                                                    labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                        ),
                                                                                    hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelMediumFamily),
                                                                                        ),
                                                                                    enabledBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: Color(0x00000000),
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
                                                                                        color: Color(0x00000000),
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    focusedErrorBorder: OutlineInputBorder(
                                                                                      borderSide: BorderSide(
                                                                                        color: Color(0x00000000),
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                    ),
                                                                                    contentPadding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                        fontSize: 13.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                  textAlign: TextAlign.start,
                                                                                  validator: _model.textFieldMobileTextControllerValidator.asValidator(context),
                                                                                ),
                                                                              ),
                                                                              InkWell(
                                                                                splashColor: Colors.transparent,
                                                                                focusColor: Colors.transparent,
                                                                                hoverColor: Colors.transparent,
                                                                                highlightColor: Colors.transparent,
                                                                                onTap: () async {
                                                                                  safeSetState(() {
                                                                                    _model.textFieldCityTextController?.clear();
                                                                                  });
                                                                                  safeSetState(() {
                                                                                    _model.dropDownAssignedToValueController?.reset();
                                                                                    _model.dropDownStatusSValueController?.reset();
                                                                                  });
                                                                                  _model.res12 = await queryLeadsManagementRecordOnce(
                                                                                    parent: FFAppState().outletRef,
                                                                                    queryBuilder: (leadsManagementRecord) => leadsManagementRecord
                                                                                        .where(
                                                                                          'mobile',
                                                                                          isGreaterThanOrEqualTo: _model.textFieldMobileTextController.text,
                                                                                        )
                                                                                        .where(
                                                                                          'mobile',
                                                                                          isLessThanOrEqualTo: '${_model.textFieldMobileTextController.text}~',
                                                                                        ),
                                                                                  );
                                                                                  _model.allLeadSearchRes12 = await actions.leadDocToLeadJson(
                                                                                    _model.res12!.toList(),
                                                                                  );
                                                                                  FFAppState().allLeads = _model.allLeadSearchRes12!.toList().cast<dynamic>();
                                                                                  safeSetState(() {});
                                                                                  FFAppState().isSearching = true;
                                                                                  safeSetState(() {});

                                                                                  safeSetState(() {});
                                                                                },
                                                                                child: Icon(
                                                                                  Icons.search,
                                                                                  color: FlutterFlowTheme.of(context).customColor3,
                                                                                  size: 25.0,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              FlutterFlowIconButton(
                                                                        borderColor:
                                                                            FlutterFlowTheme.of(context).info,
                                                                        borderRadius:
                                                                            8.0,
                                                                        borderWidth:
                                                                            0.5,
                                                                        buttonSize:
                                                                            50.0,
                                                                        fillColor:
                                                                            FlutterFlowTheme.of(context).secondaryBackground,
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .calendar_month_outlined,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).info,
                                                                          size:
                                                                              21.0,
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          await showDialog(
                                                                            context:
                                                                                context,
                                                                            builder:
                                                                                (dialogContext) {
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
                                                                                    child: CustomDateRangeWidget(),
                                                                                  ),
                                                                                ),
                                                                              );
                                                                            },
                                                                          );
                                                                        },
                                                                      ),
                                                                    ),
                                                                  ].divide(SizedBox(
                                                                      width:
                                                                          5.0)),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          FlutterFlowIconButton(
                                                            borderColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                            borderRadius: 8.0,
                                                            borderWidth: 0.5,
                                                            buttonSize: 50.0,
                                                            fillColor: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            icon: Icon(
                                                              Icons.close_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primary,
                                                              size: 21.0,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              safeSetState(() {
                                                                _model
                                                                    .textFieldMobileTextController
                                                                    ?.clear();
                                                                _model
                                                                    .textFieldCityTextController
                                                                    ?.clear();
                                                              });
                                                              safeSetState(() {
                                                                _model
                                                                    .dropDownAssignedToValueController
                                                                    ?.reset();
                                                                _model
                                                                    .dropDownStatusSValueController
                                                                    ?.reset();
                                                              });
                                                              FFAppState()
                                                                      .isSearching =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation1']!,
                                                      hasBeenTriggered:
                                                          hasContainerTriggered1),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      Expanded(
                                        child: Container(
                                          width: double.infinity,
                                          height: 100.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Builder(
                                                  builder: (context) {
                                                    final leadList =
                                                        FFAppState()
                                                            .allLeads
                                                            .toList();
                                                    if (leadList.isEmpty) {
                                                      return ListViewMsgWidget();
                                                    }

                                                    return ListView.separated(
                                                      padding: EdgeInsets.zero,
                                                      shrinkWrap: true,
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount:
                                                          leadList.length,
                                                      separatorBuilder:
                                                          (_, __) => SizedBox(
                                                              height: 25.0),
                                                      itemBuilder: (context,
                                                          leadListIndex) {
                                                        final leadListItem =
                                                            leadList[
                                                                leadListIndex];
                                                        return Container(
                                                          width: 100.0,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor1,
                                                              width: 1.0,
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    15.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Expanded(
                                                                  flex: 14,
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Expanded(
                                                                              flex: 2,
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
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
                                                                                                getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.ticket''',
                                                                                                ).toString(),
                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                      color: Color(0xFF5283EB),
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                    ),
                                                                                              )),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Text(
                                                                                    getJsonField(
                                                                                      leadListItem,
                                                                                      r'''$.username''',
                                                                                    ).toString(),
                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          fontWeight: FontWeight.w600,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
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
                                                                                        getJsonField(
                                                                                          leadListItem,
                                                                                          r'''$.mobile''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: Color(0xFFE75007),
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                            ),
                                                                                      )),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    flex: 3,
                                                                                    child: Align(
                                                                                      alignment: AlignmentDirectional(1.0, 0.0),
                                                                                      child: Text(
                                                                                        getJsonField(
                                                                                          leadListItem,
                                                                                          r'''$.city''',
                                                                                        ).toString(),
                                                                                        textAlign: TextAlign.end,
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                            ),
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
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              SelectionArea(
                                                                                  child: Text(
                                                                                valueOrDefault<String>(
                                                                                  functions.leadsReq(getJsonField(
                                                                                    leadListItem,
                                                                                    r'''$.requirement''',
                                                                                  ).toString()),
                                                                                  'Requirement not specified',
                                                                                ),
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                      color: Color(0xFF5283EB),
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                    ),
                                                                              )),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 30.0, 0.0),
                                                                              child: SelectionArea(
                                                                                  child: Text(
                                                                                getJsonField(
                                                                                  leadListItem,
                                                                                  r'''$.product''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                      color: Color(0xFF5283EB),
                                                                                      fontSize: 13.0,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                    ),
                                                                              )),
                                                                            ),
                                                                            SelectionArea(
                                                                                child: Text(
                                                                              getJsonField(
                                                                                leadListItem,
                                                                                r'''$.capacity''',
                                                                              ).toString(),
                                                                              style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                    color: Color(0xFF5283EB),
                                                                                    fontSize: 13.0,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                  ),
                                                                            )),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Expanded(
                                                                        flex: 4,
                                                                        child:
                                                                            Stack(
                                                                          children: [
                                                                            Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 8.0),
                                                                                  child: InkWell(
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
                                                                                                child: AssignTicketWidget(
                                                                                                  ticket: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.ticket''',
                                                                                                  ).toString(),
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
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                if (!FFAppState().assignedExec)
                                                                                  InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
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
                                                                                                child: DisQualifyLeadWidget(
                                                                                                  area: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.area''',
                                                                                                  ).toString(),
                                                                                                  city: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.city''',
                                                                                                  ).toString(),
                                                                                                  comments: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.comments''',
                                                                                                  ).toString(),
                                                                                                  createdDateTime: getCurrentTimestamp,
                                                                                                  date: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.date''',
                                                                                                  ).toString(),
                                                                                                  email: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.email''',
                                                                                                  ).toString(),
                                                                                                  logId: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.logId''',
                                                                                                  ),
                                                                                                  id: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.id''',
                                                                                                  ),
                                                                                                  mobile: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.mobile''',
                                                                                                  ).toString(),
                                                                                                  mobilrAlt: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.mobileAlt''',
                                                                                                  ).toString(),
                                                                                                  phone: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.phone''',
                                                                                                  ).toString(),
                                                                                                  requirement: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.requirement''',
                                                                                                  ).toString(),
                                                                                                  source: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.source''',
                                                                                                  ).toString(),
                                                                                                  state: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.state''',
                                                                                                  ).toString(),
                                                                                                  status: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.status''',
                                                                                                  ).toString(),
                                                                                                  time: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.time''',
                                                                                                  ).toString(),
                                                                                                  username: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.username''',
                                                                                                  ).toString(),
                                                                                                  leadRefId: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.leadRefId''',
                                                                                                  ).toString(),
                                                                                                  businessName: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.businessName''',
                                                                                                  ).toString(),
                                                                                                  businessType: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.businessType''',
                                                                                                  ).toString(),
                                                                                                  leadid: '',
                                                                                                  leadtype: '',
                                                                                                  prefix: '',
                                                                                                  priority: '',
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          );
                                                                                        },
                                                                                      ).then((value) => safeSetState(() {}));
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
                                                                                                    fontSize: 11.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                            if (FFAppState().assignedExec)
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                                                                                    child: StreamBuilder<List<UserProfileRecord>>(
                                                                                      stream: queryUserProfileRecord(
                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                          'id',
                                                                                          isEqualTo: getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.assignedTo''',
                                                                                                  ).toString() !=
                                                                                                  ''
                                                                                              ? getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.assignedTo''',
                                                                                                ).toString()
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
                                                                                                      child: AssignTicketWidget(
                                                                                                        ticket: getJsonField(
                                                                                                          leadListItem,
                                                                                                          r'''$.ticket''',
                                                                                                        ).toString(),
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
                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                          color: Color(0xFF003DC4),
                                                                                                          fontSize: 11.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
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
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                          FutureBuilder<List<UserProfileRecord>>(
                                                                                            future: queryUserProfileRecordOnce(
                                                                                              queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                'id',
                                                                                                isEqualTo: getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.assignedBy''',
                                                                                                ).toString(),
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
                                                                                                  '\"\"',
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).customColor3,
                                                                                                      fontSize: 10.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Expanded(
                                                                        flex: 4,
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.start,
                                                                          children:
                                                                              [
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
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                                child: GestureDetector(
                                                                                                  onTap: () {
                                                                                                    FocusScope.of(dialogContext).unfocus();
                                                                                                    FocusManager.instance.primaryFocus?.unfocus();
                                                                                                  },
                                                                                                  child: Container(
                                                                                                    height: 300.0,
                                                                                                    width: 300.0,
                                                                                                    child: UpdateStageDropdownWidget(
                                                                                                      flag: 0,
                                                                                                      isSearching: false,
                                                                                                      ref: leadListItem,
                                                                                                    ),
                                                                                                  ),
                                                                                                ),
                                                                                              ),
                                                                                            );
                                                                                          },
                                                                                        ).then((value) => safeSetState(() => _model.stage = value));

                                                                                        _model.res25 = await actions.leadDocRefCopy(
                                                                                          '0',
                                                                                          FFAppState().outletId,
                                                                                          _model.stage!,
                                                                                          functions.last30days(),
                                                                                          functions.timestampToMili(getCurrentTimestamp),
                                                                                        );
                                                                                        FFAppState().assignedExec = true;
                                                                                        FFAppState().allLeads = _model.res25!.toList().cast<dynamic>();
                                                                                        safeSetState(() {});
                                                                                        FFAppState().leadCreateValue = _model.stage!;
                                                                                        FFAppState().lostLeadIcon = false;
                                                                                        safeSetState(() {});
                                                                                        FFAppState().nleads = Colors.transparent;
                                                                                        FFAppState().aleads = Color(0xFFCC0404);
                                                                                        FFAppState().cLeads = Colors.transparent;
                                                                                        FFAppState().lleads = Colors.transparent;
                                                                                        safeSetState(() {});
                                                                                        FFAppState().searchHide = true;
                                                                                        safeSetState(() {});
                                                                                        FFAppState().isSearching = false;
                                                                                        safeSetState(() {});

                                                                                        safeSetState(() {});
                                                                                      },
                                                                                      child: Text(
                                                                                        getJsonField(
                                                                                          leadListItem,
                                                                                          r'''$.status''',
                                                                                        ).toString(),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  getJsonField(
                                                                                    leadListItem,
                                                                                    r'''$.date''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                                Text(
                                                                                  getJsonField(
                                                                                    leadListItem,
                                                                                    r'''$.time''',
                                                                                  ).toString(),
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                      ),
                                                                                ),
                                                                              ].divide(SizedBox(width: 5.0)),
                                                                            ),
                                                                            if (FFAppState().assignedExec)
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    'Updated On :',
                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                          fontSize: 11.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    dateTimeFormat(
                                                                                        "dd-MM-yyyy",
                                                                                        DateTime.fromMillisecondsSinceEpoch(getJsonField(
                                                                                          leadListItem,
                                                                                          r'''$.updatedDate''',
                                                                                        ))),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                  Text(
                                                                                    dateTimeFormat(
                                                                                        "jms",
                                                                                        DateTime.fromMillisecondsSinceEpoch(getJsonField(
                                                                                          leadListItem,
                                                                                          r'''$.updatedDate''',
                                                                                        ))),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                        ),
                                                                                  ),
                                                                                ].divide(SizedBox(width: 5.0)),
                                                                              ),
                                                                          ].divide(SizedBox(height: 10.0)),
                                                                        ),
                                                                      ),
                                                                      Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children:
                                                                                [
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
                                                                                          child: GestureDetector(
                                                                                            onTap: () {
                                                                                              FocusScope.of(context).unfocus();
                                                                                              FocusManager.instance.primaryFocus?.unfocus();
                                                                                            },
                                                                                            child: Padding(
                                                                                              padding: MediaQuery.viewInsetsOf(context),
                                                                                              child: CallDetailsWidget(
                                                                                                id: getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.id''',
                                                                                                ).toString(),
                                                                                                username: getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.username''',
                                                                                                ).toString(),
                                                                                                mobile: getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.mobile''',
                                                                                                ).toString(),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                ),
                                                                              if (FFAppState().assignedExec)
                                                                                FlutterFlowIconButton(
                                                                                  borderColor: Colors.transparent,
                                                                                  borderRadius: 30.0,
                                                                                  borderWidth: 1.0,
                                                                                  buttonSize: 35.0,
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
                                                                                                leadMRefid: getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.id''',
                                                                                                ).toString(),
                                                                                                username: getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.username''',
                                                                                                ).toString(),
                                                                                                mobile: getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.mobile''',
                                                                                                ).toString(),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    ).then((value) => safeSetState(() {}));
                                                                                  },
                                                                                ),
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
                                                                                  await launchURL('https://wa.me/${functions.trimMobile(getJsonField(
                                                                                        leadListItem,
                                                                                        r'''$.mobile''',
                                                                                      ).toString(), '+')}');
                                                                                },
                                                                              ),
                                                                            ].divide(SizedBox(width: 5.0)),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ].divide(SizedBox(
                                                                        width:
                                                                            15.0)),
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Container(
                                  width: 100.0,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(15.0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Activity Log',
                                          style: FlutterFlowTheme.of(context)
                                              .labelLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .labelLargeFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .customColor3,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .labelLargeFamily),
                                              ),
                                        ),
                                        ListView(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 5.0),
                                              child: Container(
                                                width: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Container(
                                                        width: double.infinity,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryBackground,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                  10.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Action taken by kjhskdf jkshkjdfh oiwg lkjsgd iyiouweh lkjilskj lk',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).titleMediumFamily),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  10.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              '01/02/2025',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor3,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        5.0,
                                                                        0.0),
                                                            child: Text(
                                                              '7.28 pm',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelMediumFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor3,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).labelMediumFamily),
                                                                  ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 1.0,
                                                      height: 20.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor1,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ].divide(SizedBox(height: 15.0)),
                                    ),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(width: 20.0)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                if (false)
                  Align(
                    alignment: AlignmentDirectional(1.0, -1.0),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          0.0, 135.0, 110.0, 0.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
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
                                    if (animationsMap[
                                            'containerOnActionTriggerAnimation2'] !=
                                        null) {
                                      await animationsMap[
                                              'containerOnActionTriggerAnimation2']!
                                          .controller
                                          .reverse();
                                    }
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
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
                                        LeadEmployeeReportFinalWidget
                                            .routeName);
                                  },
                                  text: 'Employee Report',
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
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleSmallFamily,
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          fontSize: 14.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleSmallFamily),
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
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
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
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 40.0,
                                      padding: EdgeInsets.all(0.0),
                                      iconPadding: EdgeInsets.all(0.0),
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
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
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
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
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
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
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
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
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
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
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
                                          DealerDasboardCopyWidget.routeName);
                                    },
                                    text: 'Lead analytics',
                                    icon: Icon(
                                      Icons.integration_instructions_outlined,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
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
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
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
                              if (FFAppState().billingType == 'CRM')
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 10.0),
                                  child: FFButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed(
                                          CComplaintReportWidget.routeName);
                                    },
                                    text: 'Complaint Report',
                                    icon: Icon(
                                      Icons.stacked_bar_chart,
                                      size: 20.0,
                                    ),
                                    options: FFButtonOptions(
                                      width: 200.0,
                                      height: 40.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
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
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily),
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
                      ).animateOnActionTrigger(
                          animationsMap['containerOnActionTriggerAnimation2']!,
                          hasBeenTriggered: hasContainerTriggered2),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
