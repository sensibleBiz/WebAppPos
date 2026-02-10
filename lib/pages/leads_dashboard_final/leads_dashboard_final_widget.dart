import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
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
import '/pages/components/dis_qualify_lead/dis_qualify_lead_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/message_box/message_box_widget.dart';
import '/pages/components/schedule/schedule_widget.dart';
import '/pages/components/test_dropdown/test_dropdown_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:styled_divider/styled_divider.dart';
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
import 'leads_dashboard_final_model.dart';
export 'leads_dashboard_final_model.dart';

class LeadsDashboardFinalWidget extends StatefulWidget {
  const LeadsDashboardFinalWidget({super.key});

  static String routeName = 'LeadsDashboardFinal';
  static String routePath = 'leadsDashboard';

  @override
  State<LeadsDashboardFinalWidget> createState() =>
      _LeadsDashboardFinalWidgetState();
}

class _LeadsDashboardFinalWidgetState extends State<LeadsDashboardFinalWidget>
    with TickerProviderStateMixin {
  late LeadsDashboardFinalModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  var hasContainerTriggered1 = false;
  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadsDashboardFinalModel());

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
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
    _model.expandableExpandableController2 =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
    _model.expandableExpandableController3 =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
    _model.expandableExpandableController4 =
        ExpandableController(initialExpanded: false)
          ..addListener(() => safeSetState(() {}));
    _model.textFieldCityTextController ??= TextEditingController();
    _model.textFieldCityFocusNode ??= FocusNode();
    _model.textFieldCityFocusNode!.addListener(
      () async {
        safeSetState(() {
          _model.textFieldMobileTextController?.clear();
        });
        safeSetState(() {
          _model.dropDownAssignedToValueController?.reset();
          _model.dropDownAssignedToValue = null;
          _model.dropDownSourceValueController?.reset();
          _model.dropDownSourceValue = null;
          _model.dropDownStatusSValueController?.reset();
          _model.dropDownStatusSValue = null;
        });
      },
    );
    _model.textFieldMobileTextController ??= TextEditingController();
    _model.textFieldMobileFocusNode ??= FocusNode();
    _model.textFieldMobileFocusNode!.addListener(
      () async {
        safeSetState(() {
          _model.textFieldCityTextController?.clear();
        });
        safeSetState(() {
          _model.dropDownAssignedToValueController?.reset();
          _model.dropDownAssignedToValue = null;
          _model.dropDownSourceValueController?.reset();
          _model.dropDownSourceValue = null;
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
      'containerOnActionTriggerAnimation4': AnimationInfo(
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
      'containerOnActionTriggerAnimation5': AnimationInfo(
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
      'containerOnActionTriggerAnimation6': AnimationInfo(
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

    return Title(
        title: 'LeadsDashboardFinal',
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
                                    if (FFAppState().BackButtonRole == true)
                                      FFButtonWidget(
                                        onPressed: () async {
                                          context
                                              .pushNamed(CDashWidget.routeName);
                                        },
                                        text: '',
                                        icon: Icon(
                                          Icons.chevron_left,
                                          size: 32.0,
                                        ),
                                        options: FFButtonOptions(
                                          height: double.infinity,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconColor:
                                              FlutterFlowTheme.of(context)
                                                  .primary,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBackground,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                color: Colors.white,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .titleSmallIsCustom,
                                              ),
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                      ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          10.0, 0.0, 25.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                              LeadsDashboardNewWidget
                                                  .routeName);
                                        },
                                        child: Text(
                                          'Leads Dashboard',
                                          style: FlutterFlowTheme.of(context)
                                              .headlineLarge
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineLargeFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts:
                                                    !FlutterFlowTheme.of(
                                                            context)
                                                        .headlineLargeIsCustom,
                                              ),
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
                                            context.pushNamed(
                                                AddNewLeadWidget.routeName);
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
                                            if (animationsMap[
                                                    'containerOnActionTriggerAnimation6'] !=
                                                null) {
                                              await animationsMap[
                                                      'containerOnActionTriggerAnimation6']!
                                                  .controller
                                                  .forward(from: 0.0);
                                            }
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
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 5.0, 0.0, 5.0),
                                child: ClipRRect(
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(),
                                    child: Stack(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 5.0, 0.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: FFAppState()
                                                              .nleads,
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        color:
                                                            Color(0x00000000),
                                                        child:
                                                            ExpandableNotifier(
                                                          controller: _model
                                                              .expandableExpandableController1,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
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
                                                                onTap:
                                                                    () async {
                                                                  _model.res333 =
                                                                      await actions
                                                                          .leadDocRefCopy(
                                                                    '0',
                                                                    FFAppState()
                                                                        .outletId,
                                                                    'new',
                                                                    functions
                                                                        .last30days(),
                                                                    functions
                                                                        .timestampToMili(
                                                                            getCurrentTimestamp),
                                                                  );
                                                                  FFAppState()
                                                                          .assignedExec =
                                                                      false;
                                                                  FFAppState()
                                                                          .lostLeadIcon =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .allLeads =
                                                                      _model
                                                                          .res333!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                  FFAppState()
                                                                      .update(
                                                                          () {});
                                                                  FFAppState()
                                                                          .leadCreateValue =
                                                                      'New Leads';
                                                                  FFAppState()
                                                                          .nleads =
                                                                      Color(
                                                                          0xFF210EAF);
                                                                  FFAppState()
                                                                          .aleads =
                                                                      Colors
                                                                          .transparent;
                                                                  FFAppState()
                                                                          .fLeads =
                                                                      Colors
                                                                          .transparent;
                                                                  FFAppState()
                                                                          .cLeads =
                                                                      Colors
                                                                          .transparent;
                                                                  FFAppState()
                                                                          .lleads =
                                                                      Colors
                                                                          .transparent;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .searchHide =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .isSearching =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});

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
                                                                            20.0,
                                                                            15.0,
                                                                            10.0,
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'New',
                                                                                style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                getJsonField(
                                                                                  FFAppState().newLeadCounts.firstOrNull,
                                                                                  r'''$.total''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        StyledDivider(
                                                                          thickness:
                                                                              1.5,
                                                                          color:
                                                                              Color(0xFF210EAF),
                                                                          lineStyle:
                                                                              DividerLineStyle.dashed,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            collapsed:
                                                                Container(),
                                                            expanded: Builder(
                                                              builder:
                                                                  (context) {
                                                                final list = functions
                                                                    .demoListLastObjCopy(FFAppState()
                                                                        .newLeadCounts
                                                                        .toList())
                                                                    .toList();

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List
                                                                      .generate(
                                                                          list.length,
                                                                          (listIndex) {
                                                                    final listItem =
                                                                        list[
                                                                            listIndex];
                                                                    return Container(
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
                                                                                    valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        listItem,
                                                                                        r'''$.indiamart''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
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
                                                                                    valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        listItem,
                                                                                        r'''$.justdail''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
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
                                                                                    valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        listItem,
                                                                                        r'''$.facebook''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
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
                                                                                    valueOrDefault<String>(
                                                                                      getJsonField(
                                                                                        listItem,
                                                                                        r'''$.quicklead''',
                                                                                      )?.toString(),
                                                                                      '0',
                                                                                    ),
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
                                                                    );
                                                                  }),
                                                                );
                                                              },
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
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                    child: Container(
                                                      width: 100.0,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        border: Border.all(
                                                          color: FFAppState()
                                                              .aleads,
                                                        ),
                                                      ),
                                                      child: Container(
                                                        width: double.infinity,
                                                        color:
                                                            Color(0x00000000),
                                                        child:
                                                            ExpandableNotifier(
                                                          controller: _model
                                                              .expandableExpandableController2,
                                                          child:
                                                              ExpandablePanel(
                                                            header: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2.0),
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
                                                                onTap:
                                                                    () async {
                                                                  _model.res2 =
                                                                      await actions
                                                                          .leadDocRefCopy(
                                                                    '0',
                                                                    FFAppState()
                                                                        .outletId,
                                                                    'assigned',
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
                                                                      _model
                                                                          .res2!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .leadCreateValue =
                                                                      'Assigned';
                                                                  FFAppState()
                                                                          .lostLeadIcon =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .nleads =
                                                                      Colors
                                                                          .transparent;
                                                                  FFAppState()
                                                                          .aleads =
                                                                      Color(
                                                                          0xFFCC0404);
                                                                  FFAppState()
                                                                          .cLeads =
                                                                      Colors
                                                                          .transparent;
                                                                  FFAppState()
                                                                          .lleads =
                                                                      Colors
                                                                          .transparent;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .searchHide =
                                                                      true;
                                                                  safeSetState(
                                                                      () {});
                                                                  FFAppState()
                                                                          .isSearching =
                                                                      false;
                                                                  safeSetState(
                                                                      () {});

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
                                                                            20.0,
                                                                            15.0,
                                                                            10.0,
                                                                            10.0),
                                                                    child:
                                                                        Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceBetween,
                                                                            children: [
                                                                              Text(
                                                                                'Qualified',
                                                                                style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                              Text(
                                                                                getJsonField(
                                                                                  FFAppState().assignedLeadCount.firstOrNull,
                                                                                  r'''$.total''',
                                                                                ).toString(),
                                                                                style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        StyledDivider(
                                                                          thickness:
                                                                              1.5,
                                                                          color:
                                                                              Color(0xFFFF9C8A),
                                                                          lineStyle:
                                                                              DividerLineStyle.dashed,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            collapsed:
                                                                Container(),
                                                            expanded: Builder(
                                                              builder:
                                                                  (context) {
                                                                final assList = functions
                                                                    .demoListLastObjCopy(FFAppState()
                                                                        .assignedLeadCount
                                                                        .toList())
                                                                    .toList();

                                                                return Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: List
                                                                      .generate(
                                                                          assList
                                                                              .length,
                                                                          (assListIndex) {
                                                                    final assListItem =
                                                                        assList[
                                                                            assListIndex];
                                                                    return Container(
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
                                                                                    'Call Pending',
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                                                    getJsonField(
                                                                                      assListItem,
                                                                                      r'''$.demoPending''',
                                                                                    ).toString(),
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
                                                                                    getJsonField(
                                                                                      assListItem,
                                                                                      r'''$.demoScheduled''',
                                                                                    ).toString(),
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
                                                                                    getJsonField(
                                                                                      assListItem,
                                                                                      r'''$.called''',
                                                                                    ).toString(),
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
                                                                    );
                                                                  }),
                                                                );
                                                              },
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
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: FutureBuilder<int>(
                                                    future:
                                                        queryLeadsManagementRecordCount(
                                                      parent: FFAppState()
                                                          .outletRef,
                                                      queryBuilder:
                                                          (leadsManagementRecord) =>
                                                              leadsManagementRecord
                                                                  .where(
                                                                    'stage',
                                                                    isEqualTo:
                                                                        'completed',
                                                                  )
                                                                  .where(
                                                                    'updatedDate',
                                                                    isGreaterThanOrEqualTo:
                                                                        functions
                                                                            .currentMonth('first'),
                                                                  )
                                                                  .where(
                                                                    'updatedDate',
                                                                    isLessThan:
                                                                        functions
                                                                            .currentMonth('last'),
                                                                  ),
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
                                                      int containerCount =
                                                          snapshot.data!;

                                                      return ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10.0),
                                                        child: Container(
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
                                                              color:
                                                                  FFAppState()
                                                                      .cLeads,
                                                            ),
                                                          ),
                                                          child: Container(
                                                            width:
                                                                double.infinity,
                                                            color: Color(
                                                                0x00000000),
                                                            child:
                                                                ExpandableNotifier(
                                                              controller: _model
                                                                  .expandableExpandableController3,
                                                              child:
                                                                  ExpandablePanel(
                                                                header: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              2.0),
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
                                                                        () async {
                                                                      _model.res5 =
                                                                          await actions
                                                                              .leadDocRefCopy(
                                                                        '0',
                                                                        FFAppState()
                                                                            .outletId,
                                                                        'completed',
                                                                        functions
                                                                            .last30days(),
                                                                        functions
                                                                            .timestampToMili(getCurrentTimestamp),
                                                                      );
                                                                      FFAppState()
                                                                              .assignedExec =
                                                                          true;
                                                                      FFAppState().allLeads = _model
                                                                          .res5!
                                                                          .toList()
                                                                          .cast<
                                                                              dynamic>();
                                                                      safeSetState(
                                                                          () {});
                                                                      FFAppState()
                                                                              .leadCreateValue =
                                                                          'Completed';
                                                                      FFAppState()
                                                                              .lostLeadIcon =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});
                                                                      FFAppState()
                                                                              .nleads =
                                                                          Colors
                                                                              .transparent;
                                                                      FFAppState()
                                                                              .aleads =
                                                                          Colors
                                                                              .transparent;
                                                                      FFAppState()
                                                                              .cLeads =
                                                                          Color(
                                                                              0xFFF8DB19);
                                                                      FFAppState()
                                                                              .lleads =
                                                                          Colors
                                                                              .transparent;
                                                                      safeSetState(
                                                                          () {});
                                                                      FFAppState()
                                                                              .searchHide =
                                                                          true;
                                                                      safeSetState(
                                                                          () {});
                                                                      FFAppState()
                                                                              .isSearching =
                                                                          false;
                                                                      safeSetState(
                                                                          () {});

                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            20.0,
                                                                            15.0,
                                                                            10.0,
                                                                            10.0),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                children: [
                                                                                  Text(
                                                                                    'Completed',
                                                                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      containerCount.toString(),
                                                                                      style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).success,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            StyledDivider(
                                                                              thickness: 1.5,
                                                                              color: Color(0xFF40BE1B),
                                                                              lineStyle: DividerLineStyle.dashed,
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
                                                                    Builder(
                                                                  builder:
                                                                      (context) {
                                                                    final cList = functions
                                                                        .demoListLastObjCopy(FFAppState()
                                                                            .completedLeadCount
                                                                            .toList())
                                                                        .toList();

                                                                    return Column(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: List.generate(
                                                                          cList
                                                                              .length,
                                                                          (cListIndex) {
                                                                        final cListItem =
                                                                            cList[cListIndex];
                                                                        return Container(
                                                                          width:
                                                                              double.infinity,
                                                                          height:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                20.0,
                                                                                5.0,
                                                                                20.0,
                                                                                15.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                        getJsonField(
                                                                                          cListItem,
                                                                                          r'''$.indiamart''',
                                                                                        ).toString(),
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
                                                                                        getJsonField(
                                                                                          cListItem,
                                                                                          r'''$.justdail''',
                                                                                        ).toString(),
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
                                                                                        getJsonField(
                                                                                          cListItem,
                                                                                          r'''$.facebook''',
                                                                                        ).toString(),
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
                                                                                        getJsonField(
                                                                                          cListItem,
                                                                                          r'''$.quicklead''',
                                                                                        ).toString(),
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
                                                                        );
                                                                      }),
                                                                    );
                                                                  },
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
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: FutureBuilder<int>(
                                                  future:
                                                      queryLeadsManagementRecordCount(
                                                    parent:
                                                        FFAppState().outletRef,
                                                    queryBuilder:
                                                        (leadsManagementRecord) =>
                                                            leadsManagementRecord
                                                                .where(
                                                                  'stage',
                                                                  isEqualTo:
                                                                      'lost',
                                                                )
                                                                .where(
                                                                  'updatedDate',
                                                                  isGreaterThanOrEqualTo:
                                                                      functions
                                                                          .currentMonth(
                                                                              'first'),
                                                                )
                                                                .where(
                                                                  'updatedDate',
                                                                  isLessThan: functions
                                                                      .currentMonth(
                                                                          'last'),
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
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    int containerCount =
                                                        snapshot.data!;

                                                    return ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                      child: Container(
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
                                                            color: FFAppState()
                                                                .lleads,
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
                                                                .expandableExpandableController4,
                                                            child:
                                                                ExpandablePanel(
                                                              header: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            2.0),
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
                                                                      () async {
                                                                    _model.resLost =
                                                                        await actions
                                                                            .leadDocRefCopy(
                                                                      '0',
                                                                      FFAppState()
                                                                          .outletId,
                                                                      'lost',
                                                                      functions
                                                                          .last30days(),
                                                                      functions
                                                                          .timestampToMili(
                                                                              getCurrentTimestamp),
                                                                    );
                                                                    FFAppState()
                                                                            .assignedExec =
                                                                        true;
                                                                    FFAppState().allLeads = _model
                                                                        .resLost!
                                                                        .toList()
                                                                        .cast<
                                                                            dynamic>();
                                                                    safeSetState(
                                                                        () {});
                                                                    FFAppState()
                                                                            .leadCreateValue =
                                                                        'Lost';
                                                                    FFAppState()
                                                                            .lostLeadIcon =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    FFAppState()
                                                                            .nleads =
                                                                        Colors
                                                                            .transparent;
                                                                    FFAppState()
                                                                            .aleads =
                                                                        Colors
                                                                            .transparent;
                                                                    FFAppState()
                                                                            .cLeads =
                                                                        Colors
                                                                            .transparent;
                                                                    FFAppState()
                                                                            .lleads =
                                                                        Color(
                                                                            0xFF059747);
                                                                    safeSetState(
                                                                        () {});
                                                                    FFAppState()
                                                                            .searchHide =
                                                                        true;
                                                                    safeSetState(
                                                                        () {});
                                                                    FFAppState()
                                                                            .isSearching =
                                                                        false;
                                                                    safeSetState(
                                                                        () {});

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
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          20.0,
                                                                          15.0,
                                                                          10.0,
                                                                          10.0),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Text(
                                                                                  'Lost',
                                                                                  style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                  child: Text(
                                                                                    containerCount.toString(),
                                                                                    style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          StyledDivider(
                                                                            thickness:
                                                                                1.5,
                                                                            color:
                                                                                Color(0xFF16DDD0),
                                                                            lineStyle:
                                                                                DividerLineStyle.dashed,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              collapsed:
                                                                  Container(),
                                                              expanded: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final lostList = functions
                                                                      .demoListLastObjCopy(FFAppState()
                                                                          .lostLeadCount
                                                                          .toList())
                                                                      .toList();

                                                                  return Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: List.generate(
                                                                        lostList
                                                                            .length,
                                                                        (lostListIndex) {
                                                                      final lostListItem =
                                                                          lostList[
                                                                              lostListIndex];
                                                                      return Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              20.0,
                                                                              5.0,
                                                                              20.0,
                                                                              15.0),
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
                                                                                      getJsonField(
                                                                                        lostListItem,
                                                                                        r'''$.indiamart''',
                                                                                      ).toString(),
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
                                                                                      getJsonField(
                                                                                        lostListItem,
                                                                                        r'''$.justdail''',
                                                                                      ).toString(),
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
                                                                                      getJsonField(
                                                                                        lostListItem,
                                                                                        r'''$.facebook''',
                                                                                      ).toString(),
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
                                                                                      getJsonField(
                                                                                        lostListItem,
                                                                                        r'''$.quicklead''',
                                                                                      ).toString(),
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
                                                                      );
                                                                    }),
                                                                  );
                                                                },
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
                                                    );
                                                  },
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 5.0, 0.0),
                                                  child: FutureBuilder<int>(
                                                    future:
                                                        queryLeadActivitiesRecordCount(
                                                      parent: FFAppState()
                                                          .outletRef,
                                                      queryBuilder:
                                                          (leadActivitiesRecord) =>
                                                              leadActivitiesRecord
                                                                  .where(
                                                                    'scheduledDate',
                                                                    isLessThan:
                                                                        functions
                                                                            .tommarow(),
                                                                  )
                                                                  .where(
                                                                    'status',
                                                                    isEqualTo:
                                                                        'PENDING',
                                                                  )
                                                                  .where(
                                                                    'type',
                                                                    isEqualTo:
                                                                        'Follow Up',
                                                                  ),
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
                                                      int containerCount =
                                                          snapshot.data!;

                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              FollowUpsWidget
                                                                  .routeName);
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
                                                                        20.0,
                                                                        15.0,
                                                                        20.0,
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
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Follow up',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          containerCount
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).info,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                StyledDivider(
                                                                  thickness:
                                                                      1.5,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  lineStyle:
                                                                      DividerLineStyle
                                                                          .dashed,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 5.0, 0.0),
                                                  child: FutureBuilder<int>(
                                                    future:
                                                        queryLeadActivitiesRecordCount(
                                                      parent: FFAppState()
                                                          .outletRef,
                                                      queryBuilder:
                                                          (leadActivitiesRecord) =>
                                                              leadActivitiesRecord
                                                                  .where(
                                                                    'scheduledDate',
                                                                    isLessThan:
                                                                        functions
                                                                            .tommarow(),
                                                                  )
                                                                  .where(
                                                                    'status',
                                                                    isEqualTo:
                                                                        'PENDING',
                                                                  )
                                                                  .where(
                                                                    'type',
                                                                    isEqualTo:
                                                                        'Demo',
                                                                  ),
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
                                                      int containerCount =
                                                          snapshot.data!;

                                                      return InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          context.pushNamed(
                                                              DemosWidget
                                                                  .routeName);
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
                                                                        20.0,
                                                                        15.0,
                                                                        20.0,
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
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        'Demo',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .headlineMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Text(
                                                                          containerCount
                                                                              .toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .headlineMedium
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                color: FlutterFlowTheme.of(context).warning,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).headlineMediumIsCustom,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                StyledDivider(
                                                                  thickness:
                                                                      1.5,
                                                                  color: Color(
                                                                      0xFFA467FA),
                                                                  lineStyle:
                                                                      DividerLineStyle
                                                                          .dashed,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
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
                              if (FFAppState().searchHide &&
                                  responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                  ))
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Container(
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.06,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 6,
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: Stack(
                                              alignment: AlignmentDirectional(
                                                  1.0, 0.0),
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: FFButtonWidget(
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
                                                          iconColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .lineColor,
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
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleSmallIsCustom,
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
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          5.0, 0.0, 0.0, 0.0),
                                                  child: Container(
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        1.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 16.0,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .customColor1,
                                                          offset: Offset(
                                                            -6.0,
                                                            5.0,
                                                          ),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -0.25, 0.0),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(5.0),
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
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                              width: 0.5,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                10.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(),
                                                                                      child: StreamBuilder<List<UserProfileRecord>>(
                                                                                        stream: queryUserProfileRecord(
                                                                                          queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                            'outlets',
                                                                                            arrayContains: FFAppState().outletId != '' ? FFAppState().outletId : null,
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
                                                                                          List<UserProfileRecord> dropDownAssignedToUserProfileRecordList = snapshot.data!;

                                                                                          return FlutterFlowDropDown<String>(
                                                                                            controller: _model.dropDownAssignedToValueController ??= FormFieldController<String>(
                                                                                              _model.dropDownAssignedToValue ??= '',
                                                                                            ),
                                                                                            options: List<String>.from(dropDownAssignedToUserProfileRecordList.where((e) => e.permissionList.where((e) => (e.title == 'Leads') && (e.value != 0)).toList().isNotEmpty).toList().map((e) => e.id).toList()),
                                                                                            optionLabels: dropDownAssignedToUserProfileRecordList.where((e) => e.permissionList.where((e) => (e.title == 'Leads') && (e.value != 0)).toList().isNotEmpty).toList().map((e) => e.name).toList(),
                                                                                            onChanged: (val) async {
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
                                                                                              if (_model.dropDownSourceValue != null && _model.dropDownSourceValue != '') {
                                                                                                if (_model.dropDownStatusSValue != null && _model.dropDownStatusSValue != '') {
                                                                                                  _model.allLeadSearchRess1 = await actions.leadDocToLeadJson(
                                                                                                    _model.resAssignedTo!.where((e) => (e.source == _model.dropDownSourceValue) && (e.status == _model.dropDownStatusSValue)).toList(),
                                                                                                  );
                                                                                                  FFAppState().allLeads = _model.allLeadSearchRess1!.toList().cast<dynamic>();
                                                                                                  safeSetState(() {});
                                                                                                } else {
                                                                                                  _model.allLeadSearchRess2 = await actions.leadDocToLeadJson(
                                                                                                    _model.resAssignedTo!.where((e) => e.source == _model.dropDownSourceValue).toList(),
                                                                                                  );
                                                                                                  FFAppState().allLeads = _model.allLeadSearchRess2!.toList().cast<dynamic>();
                                                                                                  safeSetState(() {});
                                                                                                }
                                                                                              } else {
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
                                                                                              }

                                                                                              FFAppState().isSearching = true;
                                                                                              safeSetState(() {});

                                                                                              safeSetState(() {});
                                                                                            },
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
                                                                                            hintText: '                 AssignedTo',
                                                                                            searchHintText: 'Search for an item...',
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_arrow_down_rounded,
                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                              size: 24.0,
                                                                                            ),
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 2.0,
                                                                                            borderColor: Colors.transparent,
                                                                                            borderWidth: 2.0,
                                                                                            borderRadius: 8.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                                            hidesUnderline: true,
                                                                                            isOverButton: true,
                                                                                            isSearchable: true,
                                                                                            isMultiSelect: false,
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                              width: 0.5,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                FlutterFlowDropDown<String>(
                                                                              controller: _model.dropDownSourceValueController ??= FormFieldController<String>(null),
                                                                              options: [
                                                                                'Facebook',
                                                                                'Indiamart',
                                                                                'JustDail',
                                                                                'Exhibition',
                                                                                'WalkIn',
                                                                                'Self Generated',
                                                                                'Other'
                                                                              ],
                                                                              onChanged: (val) async {
                                                                                safeSetState(() => _model.dropDownSourceValue = val);
                                                                                safeSetState(() {
                                                                                  _model.textFieldMobileTextController?.clear();
                                                                                  _model.textFieldCityTextController?.clear();
                                                                                });
                                                                                _model.resSourc2 = await queryLeadsManagementRecordOnce(
                                                                                  parent: FFAppState().outletRef,
                                                                                  queryBuilder: (leadsManagementRecord) => leadsManagementRecord
                                                                                      .where(
                                                                                        'source',
                                                                                        isEqualTo: _model.dropDownSourceValue,
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
                                                                                  if (_model.dropDownAssignedToValue != null && _model.dropDownAssignedToValue != '') {
                                                                                    _model.allLeadSearchRess5 = await actions.leadDocToLeadJson(
                                                                                      _model.resSourc2!.where((e) => (e.assignedTo == _model.dropDownAssignedToValue) && (e.status == _model.dropDownStatusSValue)).toList(),
                                                                                    );
                                                                                    FFAppState().allLeads = _model.allLeadSearchRess5!.toList().cast<dynamic>();
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    _model.allLeadSearchRess6 = await actions.leadDocToLeadJson(
                                                                                      _model.resSourc2!.where((e) => e.status == _model.dropDownStatusSValue).toList(),
                                                                                    );
                                                                                    FFAppState().allLeads = _model.allLeadSearchRess6!.toList().cast<dynamic>();
                                                                                    safeSetState(() {});
                                                                                  }

                                                                                  FFAppState().isSearching = true;
                                                                                  safeSetState(() {});
                                                                                } else {
                                                                                  if (_model.dropDownAssignedToValue != null && _model.dropDownAssignedToValue != '') {
                                                                                    _model.allLeadSearchRess7 = await actions.leadDocToLeadJson(
                                                                                      _model.resSourc2!.where((e) => e.assignedTo == _model.dropDownAssignedToValue).toList(),
                                                                                    );
                                                                                    FFAppState().allLeads = _model.allLeadSearchRess7!.toList().cast<dynamic>();
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    _model.allLeadSearchRess8 = await actions.leadDocToLeadJson(
                                                                                      _model.resSourc2!.toList(),
                                                                                    );
                                                                                    FFAppState().allLeads = _model.allLeadSearchRess8!.toList().cast<dynamic>();
                                                                                    safeSetState(() {});
                                                                                  }

                                                                                  FFAppState().isSearching = true;
                                                                                  safeSetState(() {});
                                                                                }

                                                                                safeSetState(() {});
                                                                              },
                                                                              width: 250.0,
                                                                              height: 50.0,
                                                                              searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
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
                                                                              hintText: '                   Source',
                                                                              searchHintText: 'Search for an item...',
                                                                              icon: Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: Colors.transparent,
                                                                              borderWidth: 0.0,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isOverButton: true,
                                                                              isSearchable: true,
                                                                              isMultiSelect: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                              width: 0.5,
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
                                                                                FlutterFlowDropDown<String>(
                                                                              controller: _model.dropDownStatusSValueController ??= FormFieldController<String>(null),
                                                                              options: [
                                                                                'ASSIGNED',
                                                                                'FOLLOWUP',
                                                                                'completed',
                                                                                'lost',
                                                                                'CALL BACK',
                                                                                'CALL PENDING',
                                                                                'RINGING'
                                                                              ],
                                                                              onChanged: (val) async {
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
                                                                                  if (_model.dropDownSourceValue != null && _model.dropDownSourceValue != '') {
                                                                                    _model.allLeadSearch11 = await actions.leadDocToLeadJson(
                                                                                      _model.resSource3!.where((e) => (e.assignedTo == _model.dropDownAssignedToValue) && (e.source == _model.dropDownSourceValue)).toList(),
                                                                                    );
                                                                                    FFAppState().allLeads = _model.allLeadSearch11!.toList().cast<dynamic>();
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    _model.allLeadSearch12 = await actions.leadDocToLeadJson(
                                                                                      _model.resSource3!.where((e) => e.assignedTo == _model.dropDownAssignedToValue).toList(),
                                                                                    );
                                                                                    FFAppState().allLeads = _model.allLeadSearch12!.toList().cast<dynamic>();
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                } else {
                                                                                  if (_model.dropDownSourceValue != null && _model.dropDownSourceValue != '') {
                                                                                    _model.allLeadSearchRess13 = await actions.leadDocToLeadJson(
                                                                                      _model.resSource3!.where((e) => e.source == _model.dropDownSourceValue).toList(),
                                                                                    );
                                                                                    FFAppState().allLeads = _model.allLeadSearchRess13!.toList().cast<dynamic>();
                                                                                    safeSetState(() {});
                                                                                  } else {
                                                                                    _model.allLeadSearchRess14 = await actions.leadDocToLeadJson(
                                                                                      _model.resSource3!.toList(),
                                                                                    );
                                                                                    FFAppState().allLeads = _model.allLeadSearchRess14!.toList().cast<dynamic>();
                                                                                    safeSetState(() {});
                                                                                  }
                                                                                }

                                                                                FFAppState().isSearching = true;
                                                                                safeSetState(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              height: 50.0,
                                                                              searchHintTextStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
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
                                                                              hintText: '                 Status',
                                                                              searchHintText: 'Search for an item...',
                                                                              icon: Icon(
                                                                                Icons.keyboard_arrow_down_rounded,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 24.0,
                                                                              ),
                                                                              fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                              elevation: 2.0,
                                                                              borderColor: Colors.transparent,
                                                                              borderWidth: 0.0,
                                                                              borderRadius: 8.0,
                                                                              margin: EdgeInsetsDirectional.fromSTEB(16.0, 4.0, 16.0, 4.0),
                                                                              hidesUnderline: true,
                                                                              isOverButton: true,
                                                                              isSearchable: true,
                                                                              isMultiSelect: false,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                              width: 0.5,
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
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Expanded(
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                    child: TextFormField(
                                                                                      controller: _model.textFieldCityTextController,
                                                                                      focusNode: _model.textFieldCityFocusNode,
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
                                                                                        labelText: '                 City',
                                                                                        labelStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                        hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              fontSize: 13.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                            ),
                                                                                        enabledBorder: InputBorder.none,
                                                                                        focusedBorder: InputBorder.none,
                                                                                        errorBorder: InputBorder.none,
                                                                                        focusedErrorBorder: InputBorder.none,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                      validator: _model.textFieldCityTextControllerValidator.asValidator(context),
                                                                                    ),
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
                                                                                      _model.dropDownAssignedToValue = null;
                                                                                      _model.dropDownSourceValueController?.reset();
                                                                                      _model.dropDownSourceValue = null;
                                                                                      _model.dropDownStatusSValueController?.reset();
                                                                                      _model.dropDownStatusSValue = null;
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
                                                                    ),
                                                                    Expanded(
                                                                      flex: 2,
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).customColor1,
                                                                              width: 0.5,
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
                                                                              mainAxisSize: MainAxisSize.max,
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
                                                                                      labelText: '          ',
                                                                                      labelStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                          ),
                                                                                      hintText: ' Mobile',
                                                                                      hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                                          ),
                                                                                      enabledBorder: InputBorder.none,
                                                                                      focusedBorder: InputBorder.none,
                                                                                      errorBorder: InputBorder.none,
                                                                                      focusedErrorBorder: InputBorder.none,
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).info,
                                                                                          fontSize: 13.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                    textAlign: TextAlign.center,
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
                                                                                      _model.dropDownAssignedToValue = null;
                                                                                      _model.dropDownSourceValueController?.reset();
                                                                                      _model.dropDownSourceValue = null;
                                                                                      _model.dropDownStatusSValueController?.reset();
                                                                                      _model.dropDownStatusSValue = null;
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
                                                                    ),
                                                                    Builder(
                                                                      builder:
                                                                          (context) =>
                                                                              FFButtonWidget(
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
                                                                        text:
                                                                            '',
                                                                        icon:
                                                                            Icon(
                                                                          Icons
                                                                              .calendar_month,
                                                                          size:
                                                                              24.0,
                                                                        ),
                                                                        options:
                                                                            FFButtonOptions(
                                                                          width:
                                                                              50.0,
                                                                          height:
                                                                              double.infinity,
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                              4.0,
                                                                              0.0,
                                                                              0.0,
                                                                              0.0),
                                                                          iconColor:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryBackground,
                                                                          textStyle: FlutterFlowTheme.of(context)
                                                                              .titleSmall
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                color: Colors.white,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                              ),
                                                                          elevation:
                                                                              2.0,
                                                                          borderSide:
                                                                              BorderSide(
                                                                            color:
                                                                                Colors.transparent,
                                                                            width:
                                                                                1.0,
                                                                          ),
                                                                          borderRadius:
                                                                              BorderRadius.circular(8.0),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          FFButtonWidget(
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
                                                                _model.dropDownAssignedToValue =
                                                                    null;
                                                                _model
                                                                    .dropDownSourceValueController
                                                                    ?.reset();
                                                                _model.dropDownSourceValue =
                                                                    null;
                                                                _model
                                                                    .dropDownStatusSValueController
                                                                    ?.reset();
                                                                _model.dropDownStatusSValue =
                                                                    null;
                                                              });
                                                              FFAppState()
                                                                      .isSearching =
                                                                  false;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text: '',
                                                            icon: Icon(
                                                              Icons.close,
                                                              size: 18.0,
                                                            ),
                                                            options:
                                                                FFButtonOptions(
                                                              width: 40.0,
                                                              height: double
                                                                  .infinity,
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
                                                                          4.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              iconColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleSmallFamily,
                                                                        color: Colors
                                                                            .white,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleSmallIsCustom,
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
                                                                          8.0),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ).animateOnActionTrigger(
                                                      animationsMap[
                                                          'containerOnActionTriggerAnimation1']!,
                                                      hasBeenTriggered:
                                                          hasContainerTriggered1),
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
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 15.0),
                                  child: Container(
                                    width: double.infinity,
                                    height:
                                        MediaQuery.sizeOf(context).height * 0.6,
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 3.0),
                                          child: Container(
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .accent3,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.all(1.0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    flex: 2,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  1.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          7.0,
                                                                          5.0,
                                                                          7.0),
                                                              child: Text(
                                                                'Source',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          11.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 18,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  1.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                        ),
                                                        child: Column(
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
                                                                          15.0,
                                                                          7.0,
                                                                          5.0,
                                                                          7.0),
                                                              child: Text(
                                                                'Customer\'s Details & Requairment',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          11.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  1.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          7.0,
                                                                          5.0,
                                                                          7.0),
                                                              child: Text(
                                                                'Executive',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          11.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  1.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          7.0,
                                                                          5.0,
                                                                          7.0),
                                                              child: Text(
                                                                'Date',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          11.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 4,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  1.0,
                                                                  0.0),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          7.0,
                                                                          5.0,
                                                                          7.0),
                                                              child: Text(
                                                                'Status',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          11.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  if (FFAppState().assignedExec)
                                                    Expanded(
                                                      flex: 3,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .accent4,
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5.0,
                                                                          7.0,
                                                                          5.0,
                                                                          7.0),
                                                              child: Text(
                                                                'Call & Follow Up',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      fontSize:
                                                                          10.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
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
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 5.0, 0.0, 0.0),
                                            child: Builder(
                                              builder: (context) {
                                                final leadList = FFAppState()
                                                    .allLeads
                                                    .toList();
                                                if (leadList.isEmpty) {
                                                  return ListViewMsgWidget();
                                                }

                                                return ListView.builder(
                                                  padding: EdgeInsets.zero,
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: leadList.length,
                                                  itemBuilder:
                                                      (context, leadListIndex) {
                                                    final leadListItem =
                                                        leadList[leadListIndex];
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
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {},
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10.0),
                                                          child: Container(
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
                                                            ),
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      -1.0,
                                                                      1.0),
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.0,
                                                                          0.0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            2.0,
                                                                            10.0,
                                                                            2.0,
                                                                            10.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .spaceBetween,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .center,
                                                                      children: [
                                                                        Expanded(
                                                                          flex:
                                                                              2,
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: Stack(
                                                                                  children: [
                                                                                    if (getJsonField(
                                                                                          leadListItem,
                                                                                          r'''$.priority''',
                                                                                        ) ==
                                                                                        'hot')
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
                                                                                    if (getJsonField(
                                                                                          leadListItem,
                                                                                          r'''$.priority''',
                                                                                        ) ==
                                                                                        'cold')
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
                                                                              Stack(
                                                                                children: [
                                                                                  if (functions.returnStr(getJsonField(
                                                                                        leadListItem,
                                                                                        r'''$.source''',
                                                                                      )) ==
                                                                                      'Reference')
                                                                                    Image.asset(
                                                                                      'assets/images/oie_5zbZfOBU0qjG.png',
                                                                                      width: 30.0,
                                                                                      height: 25.0,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  if (getJsonField(
                                                                                        leadListItem,
                                                                                        r'''$.source''',
                                                                                      ) ==
                                                                                      'Other')
                                                                                    Align(
                                                                                      alignment: AlignmentDirectional(0.0, 0.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/oie_UzeNLLv9VG1T.png',
                                                                                        width: 30.0,
                                                                                        height: 30.0,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                  if (getJsonField(
                                                                                        leadListItem,
                                                                                        r'''$.source''',
                                                                                      ) ==
                                                                                      'WalkIn')
                                                                                    Image.asset(
                                                                                      'assets/images/oie_nD4zy5Fy6lde.png',
                                                                                      width: 30.0,
                                                                                      height: 30.0,
                                                                                      fit: BoxFit.contain,
                                                                                    ),
                                                                                  if (getJsonField(
                                                                                        leadListItem,
                                                                                        r'''$.source''',
                                                                                      ) ==
                                                                                      'Facebook')
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/facebook.png',
                                                                                        width: 30.0,
                                                                                        height: 30.0,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                  if (getJsonField(
                                                                                        leadListItem,
                                                                                        r'''$.source''',
                                                                                      ) ==
                                                                                      'Indiamart')
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/INDIAMART.NS-ecf147e0.png',
                                                                                        width: 30.0,
                                                                                        height: 30.0,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                  if (getJsonField(
                                                                                        leadListItem,
                                                                                        r'''$.source''',
                                                                                      ) ==
                                                                                      'JustDail')
                                                                                    ClipRRect(
                                                                                      borderRadius: BorderRadius.circular(8.0),
                                                                                      child: Image.asset(
                                                                                        'assets/images/JustDial.png',
                                                                                        width: 30.0,
                                                                                        height: 30.0,
                                                                                        fit: BoxFit.contain,
                                                                                      ),
                                                                                    ),
                                                                                  if (functions.returnStr(getJsonField(
                                                                                        leadListItem,
                                                                                        r'''$.source''',
                                                                                      )) ==
                                                                                      'Website')
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
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              18,
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
                                                                              if (getJsonField(
                                                                                    leadListItem,
                                                                                    r'''$.status''',
                                                                                  ) ==
                                                                                  'Unread') {
                                                                                return;
                                                                              }

                                                                              context.pushNamed(
                                                                                LeadLogWidget.routeName,
                                                                                queryParameters: {
                                                                                  'id': serializeParam(
                                                                                    getJsonField(
                                                                                      leadListItem,
                                                                                      r'''$.id''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'username': serializeParam(
                                                                                    getJsonField(
                                                                                      leadListItem,
                                                                                      r'''$.username''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'mobile': serializeParam(
                                                                                    getJsonField(
                                                                                      leadListItem,
                                                                                      r'''$.mobile''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'state': serializeParam(
                                                                                    getJsonField(
                                                                                      leadListItem,
                                                                                      r'''$.state''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'source': serializeParam(
                                                                                    getJsonField(
                                                                                      leadListItem,
                                                                                      r'''$.source''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'requirement': serializeParam(
                                                                                    getJsonField(
                                                                                      leadListItem,
                                                                                      r'''$.requirement''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'area': serializeParam(
                                                                                    getJsonField(
                                                                                      leadListItem,
                                                                                      r'''$.area''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'city': serializeParam(
                                                                                    getJsonField(
                                                                                      leadListItem,
                                                                                      r'''$.city''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                  'leadRefId': serializeParam(
                                                                                    getJsonField(
                                                                                      leadListItem,
                                                                                      r'''$.id''',
                                                                                    ).toString(),
                                                                                    ParamType.String,
                                                                                  ),
                                                                                }.withoutNulls,
                                                                              );
                                                                            },
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 7.0),
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
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
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
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(6.0, 9.0, 6.0, 9.0),
                                                                                                    child: StreamBuilder<List<BusinessTypeRecord>>(
                                                                                                      stream: queryBusinessTypeRecord(
                                                                                                        queryBuilder: (businessTypeRecord) => businessTypeRecord.where(
                                                                                                          'id',
                                                                                                          isEqualTo: valueOrDefault<String>(
                                                                                                                    getJsonField(
                                                                                                                      leadListItem,
                                                                                                                      r'''$.businessType''',
                                                                                                                    )?.toString(),
                                                                                                                    '#',
                                                                                                                  ) !=
                                                                                                                  ''
                                                                                                              ? valueOrDefault<String>(
                                                                                                                  getJsonField(
                                                                                                                    leadListItem,
                                                                                                                    r'''$.businessType''',
                                                                                                                  )?.toString(),
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
                                                                                                                valueOrDefault<String>(
                                                                                                                  getJsonField(
                                                                                                                    leadListItem,
                                                                                                                    r'''$.businessName''',
                                                                                                                  )?.toString(),
                                                                                                                  '#',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                                                      fontSize: 14.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ),
                                                                                                            Text(
                                                                                                              valueOrDefault<String>(
                                                                                                                rowBusinessTypeRecord?.name == null || rowBusinessTypeRecord?.name == '' ? '#' : rowBusinessTypeRecord?.name,
                                                                                                                '#',
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                    fontSize: 12.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
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
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 4.0, 0.0),
                                                                                              child: Container(
                                                                                                constraints: BoxConstraints(
                                                                                                  maxWidth: MediaQuery.sizeOf(context).width * 0.12,
                                                                                                ),
                                                                                                decoration: BoxDecoration(
                                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.username''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 16.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                      ),
                                                                                                ),
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
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
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
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                      ),
                                                                                                )),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Align(
                                                                                                alignment: AlignmentDirectional(0.0, 0.0),
                                                                                                child: Text(
                                                                                                  getJsonField(
                                                                                                    leadListItem,
                                                                                                    r'''$.city''',
                                                                                                  ).toString(),
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                                                Container(
                                                                                  width: MediaQuery.sizeOf(context).width * 0.33,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                                                                                    child: SelectionArea(
                                                                                        child: Text(
                                                                                      valueOrDefault<String>(
                                                                                        functions.leadsReq(getJsonField(
                                                                                          leadListItem,
                                                                                          r'''$.requirement''',
                                                                                        ).toString()),
                                                                                        'Requirement not specified',
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                            color: Color(0xFF5283EB),
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                          ),
                                                                                    )),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              4,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Stack(
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                  child: Column(
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
                                                                                                      child: AssignLeadDealerWidget(
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
                                                                                      ),
                                                                                      if (!FFAppState().assignedExec)
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                          child: InkWell(
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
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                if (FFAppState().assignedExec)
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
                                                                                                            child: AssignLeadDealerWidget(
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
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              4,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                3.0,
                                                                                0.0,
                                                                                3.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                Column(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                      child: Text(
                                                                                        'Created on : ',
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              fontSize: 9.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                                                      children: [
                                                                                        Text(
                                                                                          getJsonField(
                                                                                            leadListItem,
                                                                                            r'''$.date''',
                                                                                          ).toString(),
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
                                                                                            getJsonField(
                                                                                              leadListItem,
                                                                                              r'''$.time''',
                                                                                            ).toString(),
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
                                                                                  ],
                                                                                ),
                                                                                Divider(
                                                                                  height: 10.0,
                                                                                  thickness: 1.0,
                                                                                  color: FlutterFlowTheme.of(context).accent4,
                                                                                ),
                                                                                if (FFAppState().assignedExec)
                                                                                  Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                        child: Text(
                                                                                          'Last activity : ',
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                fontSize: 9.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                        children: [
                                                                                          Text(
                                                                                            dateTimeFormat(
                                                                                                "d/M/y",
                                                                                                DateTime.fromMillisecondsSinceEpoch(getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.updatedDate''',
                                                                                                ))),
                                                                                            style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  fontSize: 10.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                          Text(
                                                                                            dateTimeFormat(
                                                                                                "jm",
                                                                                                DateTime.fromMillisecondsSinceEpoch(getJsonField(
                                                                                                  leadListItem,
                                                                                                  r'''$.updatedDate''',
                                                                                                ))),
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
                                                                                    ],
                                                                                  ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              4,
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5.0,
                                                                                0.0,
                                                                                5.0,
                                                                                0.0),
                                                                            child:
                                                                                Column(
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
                                                                                            Container(
                                                                                              height: MediaQuery.sizeOf(context).height * 0.045,
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  if (FFAppState().newLead)
                                                                                                    FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderWidth: 1.0,
                                                                                                      buttonSize: 26.0,
                                                                                                      icon: Icon(
                                                                                                        Icons.stars,
                                                                                                        color: Color(0xFFF7B34C),
                                                                                                        size: 12.0,
                                                                                                      ),
                                                                                                      onPressed: () {
                                                                                                        print('IconButton pressed ...');
                                                                                                      },
                                                                                                    ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      getJsonField(
                                                                                                        leadListItem,
                                                                                                        r'''$.status''',
                                                                                                      ).toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            fontSize: 12.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                        if (FFAppState().assignedExec)
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
                                                                                                          key: Key('Key08p_${leadListIndex}_of_${leadList.length}'),
                                                                                                          ref: leadListItem,
                                                                                                          flag: 0,
                                                                                                          isSearching: FFAppState().isSearching,
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
                                                                                Expanded(
                                                                                  child: Align(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                                leadListItem,
                                                                                                r'''$.leadCampaign''',
                                                                                              ) !=
                                                                                              null
                                                                                          ? getJsonField(
                                                                                              leadListItem,
                                                                                              r'''$.leadCampaign''',
                                                                                            ).toString()
                                                                                          : 'NA',
                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                            fontSize: 13.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Expanded(
                                                                          flex:
                                                                              3,
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                            ),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                                  children: [
                                                                                    if (FFAppState().assignedExec)
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                        child: FlutterFlowIconButton(
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
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    if (FFAppState().hide &&
                                                                                        responsiveVisibility(
                                                                                          context: context,
                                                                                          phone: false,
                                                                                          tablet: false,
                                                                                          tabletLandscape: false,
                                                                                        ))
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                        child: FlutterFlowIconButton(
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
                                                                                      ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                      child: FlutterFlowIconButton(
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
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          45.0,
                                                                          0.0,
                                                                          0.0,
                                                                          5.0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            15.0),
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        boxShadow: [
                                                                          BoxShadow(
                                                                            blurRadius:
                                                                                7.0,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor3,
                                                                            offset:
                                                                                Offset(
                                                                              3.0,
                                                                              5.0,
                                                                            ),
                                                                          )
                                                                        ],
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).backgroundComponants,
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
                                                                              MainAxisSize.min,
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
                                                                              animationsMap['containerOnActionTriggerAnimation3']!,
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
                                                                              animationsMap['containerOnActionTriggerAnimation4']!,
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
                                                                              animationsMap['containerOnActionTriggerAnimation5']!,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ).animateOnActionTrigger(
                                                                    animationsMap[
                                                                        'containerOnActionTriggerAnimation2']!,
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
                if (_model.showMore)
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
                                            'containerOnActionTriggerAnimation6'] !=
                                        null) {
                                      await animationsMap[
                                              'containerOnActionTriggerAnimation6']!
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
                      ).animateOnActionTrigger(
                        animationsMap['containerOnActionTriggerAnimation6']!,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ));
  }
}
