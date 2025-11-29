import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/send_email_widget.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/call_details/call_details_widget.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'deye_dashboard_support_model.dart';
export 'deye_dashboard_support_model.dart';

class DeyeDashboardSupportWidget extends StatefulWidget {
  const DeyeDashboardSupportWidget({super.key});

  static String routeName = 'DeyeDashboardSupport';
  static String routePath = 'DeyeDashboardSupport';

  @override
  State<DeyeDashboardSupportWidget> createState() =>
      _DeyeDashboardSupportWidgetState();
}

class _DeyeDashboardSupportWidgetState extends State<DeyeDashboardSupportWidget>
    with TickerProviderStateMixin {
  late DeyeDashboardSupportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeyeDashboardSupportModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.showMore = false;
      _model.isSearched = false;
      safeSetState(() {});
      FFAppState().startDate = functions.lastDays(2);
      FFAppState().endDate = functions.tommarow();
      FFAppState().leadCreateValue = 'completed';
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

    return StreamBuilder<List<OutletRecord>>(
      stream: queryOutletRecord(
        queryBuilder: (outletRecord) => outletRecord.where(
          'id',
          isEqualTo: FFAppState().outletRef?.id,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).back2nd,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
              ),
            ),
          );
        }
        List<OutletRecord> deyeDashboardSupportOutletRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final deyeDashboardSupportOutletRecord =
            deyeDashboardSupportOutletRecordList.isNotEmpty
                ? deyeDashboardSupportOutletRecordList.first
                : null;

        return Title(
            title: 'DeyeDashboardSupport',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).back2nd,
              drawer: Container(
                width: MediaQuery.sizeOf(context).width * 0.2,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 20.0,
                                    ),
                                    onPressed: () async {
                                      if (scaffoldKey
                                              .currentState!.isDrawerOpen ||
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
                        child: wrapWithModel(
                          model: _model.deyeHeaderModel,
                          updateCallback: () => safeSetState(() {}),
                          child: DeyeHeaderWidget(),
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
                                containerLeadsManagementRecordList =
                                snapshot.data!;

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
                                            width: double.infinity,
                                            height: 60.0,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10.0),
                                            ),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: StreamBuilder<
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
                                                          listViewLeadStagesRecordList =
                                                          snapshot.data!;

                                                      return ListView.separated(
                                                        padding:
                                                            EdgeInsets.zero,
                                                        scrollDirection:
                                                            Axis.horizontal,
                                                        itemCount:
                                                            listViewLeadStagesRecordList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) => SizedBox(
                                                                width: 10.0),
                                                        itemBuilder: (context,
                                                            listViewIndex) {
                                                          final listViewLeadStagesRecord =
                                                              listViewLeadStagesRecordList[
                                                                  listViewIndex];
                                                          return Visibility(
                                                            visible: functions
                                                                .getStagePermission(
                                                                    listViewLeadStagesRecord
                                                                        .id,
                                                                    FFAppState()
                                                                        .stageListPermissionState
                                                                        .toList()),
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10.0),
                                                                border:
                                                                    Border.all(
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
                                                                    EdgeInsets
                                                                        .all(
                                                                            3.0),
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
                                                                    FFAppState()
                                                                            .leadCreateValue =
                                                                        listViewLeadStagesRecord
                                                                            .name;
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width:
                                                                        220.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color:
                                                                          () {
                                                                        if (listViewLeadStagesRecord.name ==
                                                                            'assigned') {
                                                                          return Color(
                                                                              0xFFE3AB0F);
                                                                        } else if (listViewLeadStagesRecord.name ==
                                                                            'pending') {
                                                                          return Color(
                                                                              0xFFFC590C);
                                                                        } else if (listViewLeadStagesRecord.name ==
                                                                            'completed') {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .tertiary;
                                                                        } else if (listViewLeadStagesRecord.name ==
                                                                            'REOPENED') {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .customColor5;
                                                                        } else {
                                                                          return FlutterFlowTheme.of(context)
                                                                              .tertiary;
                                                                        }
                                                                      }(),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          15.0,
                                                                          10.0,
                                                                          15.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children:
                                                                                [
                                                                              Stack(
                                                                                children: [
                                                                                  if (listViewLeadStagesRecord.name == 'completed')
                                                                                    Icon(
                                                                                      Icons.check_box_rounded,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                  if (listViewLeadStagesRecord.name == 'pending')
                                                                                    Icon(
                                                                                      Icons.watch_later_sharp,
                                                                                      color: FlutterFlowTheme.of(context).primaryBackground,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                  if (listViewLeadStagesRecord.name == 'assigned')
                                                                                    Icon(
                                                                                      Icons.location_history,
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                  if (listViewLeadStagesRecord.name == 'reopened')
                                                                                    Icon(
                                                                                      Icons.repeat,
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                ],
                                                                              ),
                                                                              Text(
                                                                                listViewLeadStagesRecord.display,
                                                                                style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                      color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                      fontSize: 17.0,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.normal,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ].divide(SizedBox(width: 5.0)),
                                                                          ),
                                                                        ],
                                                                      ),
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
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              width: double.infinity,
                                              height: 300.0,
                                              decoration: BoxDecoration(),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
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
                                                                parent:
                                                                    FFAppState()
                                                                        .outletRef,
                                                                queryBuilder:
                                                                    (teamTreeRecord) =>
                                                                        teamTreeRecord
                                                                            .where(
                                                                  'roleInZone',
                                                                  isEqualTo:
                                                                      'admin',
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<TeamTreeRecord>
                                                                    dropDownZoneAllTeamTreeRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return FlutterFlowDropDown<
                                                                    String>(
                                                                  controller: _model
                                                                          .dropDownZoneAllValueController ??=
                                                                      FormFieldController<
                                                                          String>(
                                                                    _model.dropDownZoneAllValue ??=
                                                                        '',
                                                                  ),
                                                                  options: List<
                                                                      String>.from([
                                                                    'GHIcpvPS3AR6oRBBJ140q1oR5Kz2',
                                                                    'OII8LWubmUQtA93bgZdmfL3NZwg1'
                                                                  ]),
                                                                  optionLabels: [
                                                                    'MAHAMAD MAHAGONDE',
                                                                    'TANAJI JADHAV'
                                                                  ],
                                                                  onChanged:
                                                                      (val) async {
                                                                    safeSetState(() =>
                                                                        _model.dropDownZoneAllValue =
                                                                            val);
                                                                    _model.selectedZone = dropDownZoneAllTeamTreeRecordList
                                                                        .where((e) =>
                                                                            e.userProfileId ==
                                                                            _model
                                                                                .dropDownZoneAllValue)
                                                                        .toList()
                                                                        .firstOrNull!
                                                                        .zoneList
                                                                        .toList()
                                                                        .cast<
                                                                            String>();
                                                                    safeSetState(
                                                                        () {});
                                                                  },
                                                                  width: 200.0,
                                                                  height: 40.0,
                                                                  searchHintTextStyle: FlutterFlowTheme.of(
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
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                                  searchTextStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                  textStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmall
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                      ),
                                                                  hintText:
                                                                      'Executive',
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
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                  elevation:
                                                                      2.0,
                                                                  borderColor:
                                                                      Colors
                                                                          .transparent,
                                                                  borderWidth:
                                                                      1.0,
                                                                  borderRadius:
                                                                      8.0,
                                                                  margin: EdgeInsetsDirectional
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
                                                                      .dropDownRemarkAllValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
                                                              options: [
                                                                'Verified',
                                                                'Not Verified',
                                                                'Not Responded',
                                                                'Not Applicable',
                                                                '#'
                                                              ],
                                                              onChanged: (val) =>
                                                                  safeSetState(() =>
                                                                      _model.dropDownRemarkAllValue =
                                                                          val),
                                                              width: 150.0,
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
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
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
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                                            !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                      ),
                                                              hintText:
                                                                  'Remark',
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
                                                              borderWidth: 1.0,
                                                              borderRadius: 8.0,
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
                                                            ),
                                                            FlutterFlowDropDown<
                                                                String>(
                                                              controller: _model
                                                                      .dropDownValueController ??=
                                                                  FormFieldController<
                                                                          String>(
                                                                      null),
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
                                                                            FlutterFlowTheme.of(context).labelSmallFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                      ),
                                                              hintText:
                                                                  'Select Filter',
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
                                                                  false,
                                                              isMultiSelect:
                                                                  false,
                                                            ),
                                                            Container(
                                                              width: 150.0,
                                                              child:
                                                                  TextFormField(
                                                                controller: _model
                                                                    .textController,
                                                                focusNode: _model
                                                                    .textFieldFocusNode,
                                                                autofocus:
                                                                    false,
                                                                obscureText:
                                                                    false,
                                                                decoration:
                                                                    InputDecoration(
                                                                  isDense: true,
                                                                  labelStyle: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                                  hintStyle: FlutterFlowTheme.of(
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
                                                                            !FlutterFlowTheme.of(context).labelMediumIsCustom,
                                                                      ),
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: Color(
                                                                          0x00000000),
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderSide:
                                                                        BorderSide(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .error,
                                                                      width:
                                                                          1.0,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  filled: true,
                                                                  fillColor: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelSmallFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelSmallIsCustom,
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
                                                              borderRadius:
                                                                  10.0,
                                                              buttonSize: 35.0,
                                                              fillColor: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor5,
                                                              icon: Icon(
                                                                Icons
                                                                    .done_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                size: 16.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                _model.isSearched =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                            ),
                                                            FlutterFlowIconButton(
                                                              borderRadius:
                                                                  10.0,
                                                              buttonSize: 35.0,
                                                              fillColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .text2nd,
                                                              icon: Icon(
                                                                Icons.close,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBtnText,
                                                                size: 16.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                _model.isSearched =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .textController
                                                                      ?.clear();
                                                                });
                                                                safeSetState(
                                                                    () {
                                                                  _model
                                                                      .dropDownValueController
                                                                      ?.reset();
                                                                  _model.dropDownValue =
                                                                      null;
                                                                  _model
                                                                      .dropDownZoneAllValueController
                                                                      ?.reset();
                                                                  _model.dropDownZoneAllValue =
                                                                      null;
                                                                  _model
                                                                      .dropDownRemarkAllValueController
                                                                      ?.reset();
                                                                  _model.dropDownRemarkAllValue =
                                                                      null;
                                                                });
                                                              },
                                                            ),
                                                            Builder(
                                                              builder:
                                                                  (context) =>
                                                                      InkWell(
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
                                                                  FFAppState()
                                                                          .emailForReport =
                                                                      currentUserEmail;
                                                                  safeSetState(
                                                                      () {});
                                                                  await showDialog(
                                                                    context:
                                                                        context,
                                                                    builder:
                                                                        (dialogContext) {
                                                                      return Dialog(
                                                                        elevation:
                                                                            0,
                                                                        insetPadding:
                                                                            EdgeInsets.zero,
                                                                        backgroundColor:
                                                                            Colors.transparent,
                                                                        alignment:
                                                                            AlignmentDirectional(0.0, 0.0).resolve(Directionality.of(context)),
                                                                        child:
                                                                            WebViewAware(
                                                                          child:
                                                                              SendEmailWidget(),
                                                                        ),
                                                                      );
                                                                    },
                                                                  );

                                                                  _model.base64Link232 =
                                                                      await actions
                                                                          .genExcelForComplaintReport(
                                                                    context,
                                                                    FFAppState()
                                                                        .filterDate,
                                                                    deyeDashboardSupportOutletRecord
                                                                        ?.name,
                                                                    (_model.isSearched
                                                                            ? functions.filteredComplaintsForReports(
                                                                                containerLeadsManagementRecordList.toList(),
                                                                                '',
                                                                                _model.textController.text == null || _model.textController.text == '' ? '' : _model.textController.text,
                                                                                _model.dropDownValue == null || _model.dropDownValue == '' ? '' : _model.dropDownValue,
                                                                                _model.dropDownRemarkAllValue == null || _model.dropDownRemarkAllValue == '' ? '' : _model.dropDownRemarkAllValue,
                                                                                _model.dropDownZoneAllValue == null || _model.dropDownZoneAllValue == '' ? '' : _model.dropDownZoneAllValue,
                                                                                '',
                                                                                _model.selectedZone.toList(),
                                                                                '')
                                                                            : containerLeadsManagementRecordList)
                                                                        .toList(),
                                                                  );
                                                                  _model.apiResult88g =
                                                                      await SendMailCall
                                                                          .call(
                                                                    mobileNo:
                                                                        FFAppState()
                                                                            .currentMobile,
                                                                    outletName:
                                                                        deyeDashboardSupportOutletRecord
                                                                            ?.name,
                                                                    file: _model
                                                                        .base64Link232,
                                                                    fileName:
                                                                        'CustomerComplaintReport',
                                                                    toEmail:
                                                                        FFAppState()
                                                                            .emailForReport,
                                                                    branchName:
                                                                        deyeDashboardSupportOutletRecord
                                                                            ?.branch,
                                                                    username: valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.name,
                                                                        ''),
                                                                    reportType:
                                                                        'Customer Complaint Report',
                                                                    roll: FFAppState()
                                                                        .currentUserRole,
                                                                  );

                                                                  if ((_model
                                                                          .apiResult88g
                                                                          ?.succeeded ??
                                                                      true)) {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            content:
                                                                                Text('Email Sent Successfully. Wait 5-8 Minutes..'),
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
                                                                  } else {
                                                                    await showDialog(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (alertDialogContext) {
                                                                        return WebViewAware(
                                                                          child:
                                                                              AlertDialog(
                                                                            content:
                                                                                Text('Email Not Sent ! Try Again'),
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

                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child: Icon(
                                                                  Icons.mail,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .customColor5,
                                                                  size: 40.0,
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(SizedBox(
                                                              width: 5.0)),
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          if (false)
                                                            FFButtonWidget(
                                                              onPressed:
                                                                  () async {
                                                                _model.showToday =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                                FFAppState()
                                                                        .startDate =
                                                                    getCurrentTimestamp
                                                                        .millisecondsSinceEpoch;
                                                                FFAppState()
                                                                        .endDate =
                                                                    getCurrentTimestamp
                                                                        .millisecondsSinceEpoch;
                                                                FFAppState()
                                                                        .filterDate =
                                                                    dateTimeFormat(
                                                                        "yMMMd",
                                                                        getCurrentTimestamp);
                                                                safeSetState(
                                                                    () {});
                                                              },
                                                              text:
                                                                  'Today\'s  Task',
                                                              options:
                                                                  FFButtonOptions(
                                                                width: 93.0,
                                                                height: 30.0,
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                iconPadding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            0.0),
                                                                color: _model
                                                                        .showToday
                                                                    ? FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor5
                                                                    : FlutterFlowTheme.of(
                                                                            context)
                                                                        .alternate,
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleSmall
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleSmallFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .secondaryBackground,
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
                                                                  color: _model
                                                                          .showToday
                                                                      ? FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary
                                                                      : Color(
                                                                          0x00000000),
                                                                  width: 1.0,
                                                                ),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            8.0),
                                                              ),
                                                              showLoadingIndicator:
                                                                  false,
                                                            ),
                                                          FlutterFlowRadioButton(
                                                            options: [
                                                              'Created Date',
                                                              'Closed Date'
                                                            ].toList(),
                                                            onChanged:
                                                                (val) async {
                                                              safeSetState(
                                                                  () {});
                                                              if (_model
                                                                      .radioButtonValue ==
                                                                  'Created Date') {
                                                                _model.showToday =
                                                                    false;
                                                                safeSetState(
                                                                    () {});
                                                              } else {
                                                                _model.showToday =
                                                                    true;
                                                                safeSetState(
                                                                    () {});
                                                              }
                                                            },
                                                            controller: _model
                                                                    .radioButtonValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    'Created Date'),
                                                            optionHeight: 30.0,
                                                            textStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .labelMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .labelMediumIsCustom,
                                                                    ),
                                                            selectedTextStyle:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .bodyMediumIsCustom,
                                                                    ),
                                                            buttonPosition:
                                                                RadioButtonPosition
                                                                    .left,
                                                            direction:
                                                                Axis.horizontal,
                                                            radioButtonColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor5,
                                                            inactiveRadioButtonColor:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .text2nd,
                                                            toggleable: false,
                                                            horizontalAlignment:
                                                                WrapAlignment
                                                                    .start,
                                                            verticalAlignment:
                                                                WrapCrossAlignment
                                                                    .start,
                                                          ),
                                                          Builder(
                                                            builder: (context) =>
                                                                FlutterFlowIconButton(
                                                              borderColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .text2nd,
                                                              borderRadius:
                                                                  10.0,
                                                              borderWidth: 0.5,
                                                              buttonSize: 40.0,
                                                              icon: Icon(
                                                                Icons
                                                                    .calendar_month,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .customColor5,
                                                                size: 20.0,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                await showDialog(
                                                                  context:
                                                                      context,
                                                                  builder:
                                                                      (dialogContext) {
                                                                    return Dialog(
                                                                      elevation:
                                                                          0,
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
                                                                              Directionality.of(context)),
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
                                                          Text(
                                                            dateTimeFormat(
                                                                "yMMMd",
                                                                DateTime.fromMillisecondsSinceEpoch(
                                                                    FFAppState()
                                                                        .startDate)),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmallIsCustom,
                                                                ),
                                                          ),
                                                          Text(
                                                            'to',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmallIsCustom,
                                                                ),
                                                          ),
                                                          Text(
                                                            FFAppState()
                                                                .filterDate,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelSmallFamily,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmallIsCustom,
                                                                ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ],
                                                  ),
                                                  Container(
                                                    height: 35.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0xFFA5A8B1),
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        bottomLeft:
                                                            Radius.circular(
                                                                0.0),
                                                        bottomRight:
                                                            Radius.circular(
                                                                0.0),
                                                        topLeft:
                                                            Radius.circular(
                                                                10.0),
                                                        topRight:
                                                            Radius.circular(
                                                                10.0),
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  10.0,
                                                                  0.0,
                                                                  0.0,
                                                                  0.0),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Expanded(
                                                            child: Text(
                                                              'SR. NO.',
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 3,
                                                            child: Text(
                                                              'TICKET',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 8,
                                                            child: Text(
                                                              'CUSTOMER',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 4,
                                                            child: Text(
                                                              'MOBILE',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 4,
                                                            child: Text(
                                                              'REMARK',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 24,
                                                            child: Text(
                                                              'COMMENTS',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyLarge
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyLargeFamily,
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBtnText,
                                                                    fontSize:
                                                                        12.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontStyle:
                                                                        FontStyle
                                                                            .italic,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .bodyLargeIsCustom,
                                                                  ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            flex: 7,
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderRadius:
                                                                        8.0,
                                                                    buttonSize:
                                                                        30.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .arrow_back,
                                                                      color: Colors
                                                                          .transparent,
                                                                      size:
                                                                          10.0,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          0.0),
                                                                  child:
                                                                      FlutterFlowIconButton(
                                                                    borderRadius:
                                                                        8.0,
                                                                    buttonSize:
                                                                        30.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .arrow_back,
                                                                      color: Colors
                                                                          .transparent,
                                                                      size:
                                                                          10.0,
                                                                    ),
                                                                    onPressed:
                                                                        () {
                                                                      print(
                                                                          'IconButton pressed ...');
                                                                    },
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        10.0,
                                                                        0.0),
                                                            child: Icon(
                                                              Icons.arrow_back,
                                                              color: Color(
                                                                  0x000D0801),
                                                              size: 24.0,
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            width: 10.0)),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                      width: double.infinity,
                                                      decoration:
                                                          BoxDecoration(),
                                                      child: Stack(
                                                        children: [
                                                          if (_model
                                                                  .showToday ==
                                                              false)
                                                            Align(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      0.0, 0.0),
                                                              child: Builder(
                                                                builder:
                                                                    (context) {
                                                                  final containerVar = (_model
                                                                              .isSearched
                                                                          ? functions.filteredComplaintsForReports(
                                                                              containerLeadsManagementRecordList.toList(),
                                                                              '',
                                                                              _model.textController.text == null || _model.textController.text == '' ? '' : _model.textController.text,
                                                                              _model.dropDownValue == null || _model.dropDownValue == '' ? '' : _model.dropDownValue,
                                                                              _model.dropDownRemarkAllValue == null || _model.dropDownRemarkAllValue == '' ? '' : _model.dropDownRemarkAllValue,
                                                                              _model.dropDownZoneAllValue == null || _model.dropDownZoneAllValue == '' ? '' : _model.dropDownZoneAllValue,
                                                                              '',
                                                                              _model.selectedZone.toList(),
                                                                              '')
                                                                          : containerLeadsManagementRecordList)
                                                                      .toList();
                                                                  if (containerVar
                                                                      .isEmpty) {
                                                                    return Center(
                                                                      child:
                                                                          Container(
                                                                        width: double
                                                                            .infinity,
                                                                        height:
                                                                            double.infinity,
                                                                        child:
                                                                            ListViewMsgWidget(),
                                                                      ),
                                                                    );
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
                                                                                2.0),
                                                                    itemBuilder:
                                                                        (context,
                                                                            containerVarIndex) {
                                                                      final containerVarItem =
                                                                          containerVar[
                                                                              containerVarIndex];
                                                                      return ClipRRect(
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Container(
                                                                            width:
                                                                                double.infinity,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            child:
                                                                                ExpandableNotifier(
                                                                              initialExpanded: false,
                                                                              child: ExpandablePanel(
                                                                                header: Container(
                                                                                  width: 100.0,
                                                                                  decoration: BoxDecoration(
                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 5.0),
                                                                                    child: Row(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      children: [
                                                                                        Expanded(
                                                                                          child: Text(
                                                                                            '${(containerVarIndex + 1).toString()}.',
                                                                                            textAlign: TextAlign.center,
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                  fontSize: 12.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 3,
                                                                                          child: SelectionArea(
                                                                                              child: Text(
                                                                                            containerVarItem.ticket,
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).info,
                                                                                                  fontSize: 14.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                ),
                                                                                          )),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 8,
                                                                                          child: Text(
                                                                                            containerVarItem.username,
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 4,
                                                                                          child: SelectionArea(
                                                                                              child: AutoSizeText(
                                                                                            containerVarItem.mobile,
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                ),
                                                                                          )),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 4,
                                                                                          child: Text(
                                                                                            containerVarItem.remarks,
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 24,
                                                                                          child: Text(
                                                                                            containerVarItem.comments,
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  fontSize: 13.0,
                                                                                                  letterSpacing: 0.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  fontStyle: FontStyle.italic,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 7,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.end,
                                                                                            children: [
                                                                                              FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 30.0,
                                                                                                borderWidth: 1.0,
                                                                                                buttonSize: 30.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                icon: Icon(
                                                                                                  Icons.mail,
                                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                                  size: 10.0,
                                                                                                ),
                                                                                                onPressed: () async {
                                                                                                  context.pushNamed(
                                                                                                    DeyeFeedbackForm2Widget.routeName,
                                                                                                    queryParameters: {
                                                                                                      'leadDoc': serializeParam(
                                                                                                        containerVarItem,
                                                                                                        ParamType.Document,
                                                                                                      ),
                                                                                                    }.withoutNulls,
                                                                                                    extra: <String, dynamic>{
                                                                                                      'leadDoc': containerVarItem,
                                                                                                    },
                                                                                                  );
                                                                                                },
                                                                                              ),
                                                                                              FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 30.0,
                                                                                                borderWidth: 1.0,
                                                                                                buttonSize: 30.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                icon: Icon(
                                                                                                  Icons.call,
                                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                                  size: 10.0,
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
                                                                                              if (responsiveVisibility(
                                                                                                context: context,
                                                                                                phone: false,
                                                                                                tablet: false,
                                                                                                tabletLandscape: false,
                                                                                              ))
                                                                                                FlutterFlowIconButton(
                                                                                                  borderColor: Colors.transparent,
                                                                                                  borderRadius: 30.0,
                                                                                                  buttonSize: 30.0,
                                                                                                  fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                  icon: Icon(
                                                                                                    Icons.edit_square,
                                                                                                    color: FlutterFlowTheme.of(context).lineColor,
                                                                                                    size: 12.0,
                                                                                                  ),
                                                                                                  onPressed: () async {
                                                                                                    context.pushNamed(
                                                                                                      DeyeComplaintDetailViewWidget.routeName,
                                                                                                      queryParameters: {
                                                                                                        'leadManagementDocId': serializeParam(
                                                                                                          containerVarItem.id,
                                                                                                          ParamType.String,
                                                                                                        ),
                                                                                                        'leadManagementDoc': serializeParam(
                                                                                                          containerVarItem,
                                                                                                          ParamType.Document,
                                                                                                        ),
                                                                                                      }.withoutNulls,
                                                                                                      extra: <String, dynamic>{
                                                                                                        'leadManagementDoc': containerVarItem,
                                                                                                      },
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(containerVarItem.createdDate)),
                                                                                                    textAlign: TextAlign.end,
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          color: FlutterFlowTheme.of(context).customColor5,
                                                                                                          fontSize: 10.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(height: 5.0)),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 5.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(width: 10.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                collapsed: Container(),
                                                                                expanded: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFEAF2FF),
                                                                                    borderRadius: BorderRadius.circular(3.0),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(10.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 2,
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
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
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
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      ));
                                                                                                    },
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 2,
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
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
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
                                                                                                            width: 30.0,
                                                                                                            height: 30.0,
                                                                                                            child: SpinKitRing(
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              size: 30.0,
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
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      ));
                                                                                                    },
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 4,
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
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    containerVarItem.customFields.purchasedFrom,
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 2,
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
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
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
                                                                                                          '--',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                              color: FlutterFlowTheme.of(context).customColor4,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'City',
                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    containerVarItem.city,
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 4,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Serial No.',
                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    containerVarItem.customFields.serial,
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.end,
                                                                                          children: [
                                                                                            Expanded(
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
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                    ),
                                                                                              )),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                theme: ExpandableThemeData(
                                                                                  tapHeaderToExpand: true,
                                                                                  tapBodyToExpand: false,
                                                                                  tapBodyToCollapse: false,
                                                                                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                  hasIcon: true,
                                                                                  iconSize: 24.0,
                                                                                  iconColor: FlutterFlowTheme.of(context).customColor4,
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
                                                          if (_model
                                                                  .showToday ==
                                                              true)
                                                            StreamBuilder<
                                                                List<
                                                                    LeadsManagementRecord>>(
                                                              stream:
                                                                  queryLeadsManagementRecord(
                                                                parent:
                                                                    FFAppState()
                                                                        .outletRef,
                                                                queryBuilder: (leadsManagementRecord) =>
                                                                    leadsManagementRecord
                                                                        .where(
                                                                          'status',
                                                                          isEqualTo:
                                                                              FFAppState().leadCreateValue,
                                                                        )
                                                                        .where(
                                                                          'closeDateMili',
                                                                          isGreaterThanOrEqualTo:
                                                                              FFAppState().startDate,
                                                                        )
                                                                        .where(
                                                                          'closeDateMili',
                                                                          isLessThanOrEqualTo:
                                                                              FFAppState().endDate,
                                                                        )
                                                                        .orderBy(
                                                                            'closeDateMili',
                                                                            descending:
                                                                                true),
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
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                    ),
                                                                  );
                                                                }
                                                                List<LeadsManagementRecord>
                                                                    containerTodayLeadsManagementRecordList =
                                                                    snapshot
                                                                        .data!;

                                                                return Container(
                                                                  decoration:
                                                                      BoxDecoration(),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final containerVar = (_model.isSearched
                                                                              ? functions.filteredComplaintsForReports(containerTodayLeadsManagementRecordList.toList(), '', _model.textController.text == null || _model.textController.text == '' ? '' : _model.textController.text, _model.dropDownValue == null || _model.dropDownValue == '' ? '' : _model.dropDownValue, _model.dropDownRemarkAllValue == null || _model.dropDownRemarkAllValue == '' ? '' : _model.dropDownRemarkAllValue, _model.dropDownZoneAllValue == null || _model.dropDownZoneAllValue == '' ? '' : _model.dropDownZoneAllValue, '', _model.selectedZone.toList(), '')
                                                                              : containerTodayLeadsManagementRecordList)
                                                                          .toList();
                                                                      if (containerVar
                                                                          .isEmpty) {
                                                                        return ListViewMsgWidget();
                                                                      }

                                                                      return ListView
                                                                          .separated(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            containerVar.length,
                                                                        separatorBuilder:
                                                                            (_, __) =>
                                                                                SizedBox(height: 2.0),
                                                                        itemBuilder:
                                                                            (context,
                                                                                containerVarIndex) {
                                                                          final containerVarItem =
                                                                              containerVar[containerVarIndex];
                                                                          return ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                            child:
                                                                                Container(
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
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 5.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                '${(containerVarIndex + 1).toString()}.',
                                                                                                textAlign: TextAlign.center,
                                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 3,
                                                                                              child: SelectionArea(
                                                                                                  child: Text(
                                                                                                containerVarItem.ticket,
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                      color: FlutterFlowTheme.of(context).info,
                                                                                                      fontSize: 14.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                    ),
                                                                                              )),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 8,
                                                                                              child: Text(
                                                                                                containerVarItem.username,
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 4,
                                                                                              child: SelectionArea(
                                                                                                  child: AutoSizeText(
                                                                                                containerVarItem.mobile,
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                    ),
                                                                                              )),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 4,
                                                                                              child: Text(
                                                                                                containerVarItem.remarks,
                                                                                                textAlign: TextAlign.start,
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 24,
                                                                                              child: Text(
                                                                                                containerVarItem.comments,
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      fontWeight: FontWeight.w600,
                                                                                                      fontStyle: FontStyle.italic,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 7,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.end,
                                                                                                children: [
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 30.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                    icon: Icon(
                                                                                                      Icons.mail,
                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                      size: 10.0,
                                                                                                    ),
                                                                                                    onPressed: () async {
                                                                                                      var confirmDialogResponse = await showDialog<bool>(
                                                                                                            context: context,
                                                                                                            builder: (alertDialogContext) {
                                                                                                              return WebViewAware(
                                                                                                                child: AlertDialog(
                                                                                                                  title: Text('Confirm'),
                                                                                                                  content: Text('Are you sure you want to send mail?'),
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
                                                                                                        await showDialog(
                                                                                                          context: context,
                                                                                                          builder: (alertDialogContext) {
                                                                                                            return WebViewAware(
                                                                                                              child: AlertDialog(
                                                                                                                content: Text('done'),
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
                                                                                                  ),
                                                                                                  FlutterFlowIconButton(
                                                                                                    borderColor: Colors.transparent,
                                                                                                    borderRadius: 30.0,
                                                                                                    borderWidth: 1.0,
                                                                                                    buttonSize: 30.0,
                                                                                                    fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                    icon: Icon(
                                                                                                      Icons.call,
                                                                                                      color: FlutterFlowTheme.of(context).lineColor,
                                                                                                      size: 10.0,
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
                                                                                                  if (responsiveVisibility(
                                                                                                    context: context,
                                                                                                    phone: false,
                                                                                                    tablet: false,
                                                                                                    tabletLandscape: false,
                                                                                                  ))
                                                                                                    FlutterFlowIconButton(
                                                                                                      borderColor: Colors.transparent,
                                                                                                      borderRadius: 30.0,
                                                                                                      buttonSize: 30.0,
                                                                                                      fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                      icon: Icon(
                                                                                                        Icons.edit_square,
                                                                                                        color: FlutterFlowTheme.of(context).lineColor,
                                                                                                        size: 12.0,
                                                                                                      ),
                                                                                                      onPressed: () async {
                                                                                                        context.pushNamed(
                                                                                                          DeyeComplaintDetailViewWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'leadManagementDocId': serializeParam(
                                                                                                              containerVarItem.id,
                                                                                                              ParamType.String,
                                                                                                            ),
                                                                                                            'leadManagementDoc': serializeParam(
                                                                                                              containerVarItem,
                                                                                                              ParamType.Document,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                          extra: <String, dynamic>{
                                                                                                            'leadManagementDoc': containerVarItem,
                                                                                                          },
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(containerVarItem.createdDate)),
                                                                                                        textAlign: TextAlign.end,
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                              color: FlutterFlowTheme.of(context).accent1,
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(containerVarItem.closeDateMili)),
                                                                                                        textAlign: TextAlign.end,
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                              color: FlutterFlowTheme.of(context).customColor5,
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 5.0)),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    collapsed: Container(),
                                                                                    expanded: Container(
                                                                                      width: double.infinity,
                                                                                      decoration: BoxDecoration(
                                                                                        color: Color(0xFFEAF2FF),
                                                                                        borderRadius: BorderRadius.circular(3.0),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(10.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  flex: 2,
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
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
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
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                                ),
                                                                                                          ));
                                                                                                        },
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  flex: 2,
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
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
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
                                                                                                                width: 30.0,
                                                                                                                height: 30.0,
                                                                                                                child: SpinKitRing(
                                                                                                                  color: FlutterFlowTheme.of(context).primary,
                                                                                                                  size: 30.0,
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
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                                ),
                                                                                                          ));
                                                                                                        },
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  flex: 4,
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
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        containerVarItem.customFields.purchasedFrom,
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 10.0)),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  flex: 2,
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
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
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
                                                                                                              '--',
                                                                                                            ),
                                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).customColor4,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  fontWeight: FontWeight.w600,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                                ),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  flex: 2,
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'City',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              color: FlutterFlowTheme.of(context).text2nd,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        containerVarItem.city,
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  flex: 4,
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        'Serial No.',
                                                                                                        style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                              color: FlutterFlowTheme.of(context).text2nd,
                                                                                                              fontSize: 12.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      SelectionArea(
                                                                                                          child: Text(
                                                                                                        containerVarItem.customFields.serial,
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ].divide(SizedBox(width: 5.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 10.0)),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.end,
                                                                                              children: [
                                                                                                Expanded(
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
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 10.0)),
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 6.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                    theme: ExpandableThemeData(
                                                                                      tapHeaderToExpand: true,
                                                                                      tapBodyToExpand: false,
                                                                                      tapBodyToCollapse: false,
                                                                                      headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                      hasIcon: true,
                                                                                      iconSize: 24.0,
                                                                                      iconColor: FlutterFlowTheme.of(context).customColor4,
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
                                                                );
                                                              },
                                                            ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(SizedBox(height: 5.0)),
                                              ),
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
                        padding: EdgeInsetsDirectional.fromSTEB(
                            0.0, 50.0, 30.0, 0.0),
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
                            padding: EdgeInsets.all(10.0),
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
                                      itemCount: listViewNotificationsRecordList
                                          .length,
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
                                            padding: EdgeInsets.all(10.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 5.0),
                                                  child: Text(
                                                    listViewNotificationsRecord
                                                        .title,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .labelSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .labelSmallFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .labelSmallIsCustom,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  'Msg',
                                                  style:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
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
                              ].divide(SizedBox(height: 5.0)),
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
      },
    );
  }
}
