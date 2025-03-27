import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/add_new_demo/add_new_demo_widget.dart';
import '/pages/components/add_tag/add_tag_widget.dart';
import '/pages/components/admin_header/admin_header_widget.dart';
import '/pages/components/call_details/call_details_widget.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import '/pages/components/schedule/schedule_widget.dart';
import 'dart:math';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:expandable/expandable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'lead_log_model.dart';
export 'lead_log_model.dart';

class LeadLogWidget extends StatefulWidget {
  const LeadLogWidget({
    super.key,
    this.id,
    this.username,
    this.mobile,
    this.state,
    this.source,
    this.priority,
    this.requirement,
    this.area,
    this.city,
    this.leadRefId,
  });

  final String? id;
  final String? username;
  final String? mobile;
  final String? state;
  final String? source;
  final String? priority;
  final String? requirement;
  final String? area;
  final String? city;
  final String? leadRefId;

  static String routeName = 'LeadLog';
  static String routePath = 'leadLog';

  @override
  State<LeadLogWidget> createState() => _LeadLogWidgetState();
}

class _LeadLogWidgetState extends State<LeadLogWidget>
    with TickerProviderStateMixin {
  late LeadLogModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  final animationsMap = <String, AnimationInfo>{};

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LeadLogModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().tagSearch = false;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.textFieldunameFocusNode ??= FocusNode();

    _model.textFieldFocusNode1 ??= FocusNode();

    _model.textFieldFocusNode2 ??= FocusNode();

    _model.textFieldFocusNode3 ??= FocusNode();

    _model.textFieldtagTextController ??= TextEditingController();

    animationsMap.addAll({
      'containerOnActionTriggerAnimation': AnimationInfo(
        trigger: AnimationTrigger.onActionTrigger,
        applyInitialState: true,
        effectsBuilder: () => [
          MoveEffect(
            curve: Curves.easeInOut,
            delay: 0.0.ms,
            duration: 900.0.ms,
            begin: Offset(1000.0, 0.0),
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
        title: 'LeadLog',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 9,
                  child: Container(
                    width: 100.0,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 15.0,
                          color: FlutterFlowTheme.of(context).customColor1,
                          offset: Offset(-5.0, 0.0),
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  width: MediaQuery.sizeOf(context).width * 0.2,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context).primary,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 30.0,
                                        borderWidth: 1.0,
                                        buttonSize: 60.0,
                                        icon: Icon(
                                          Icons.chevron_left,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryBtnText,
                                          size: 30.0,
                                        ),
                                        onPressed: () async {
                                          context.pop();
                                        },
                                      ),
                                      Text(
                                        'Lead Log',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineMediumFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryBtnText,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(FlutterFlowTheme
                                                          .of(context)
                                                      .headlineMediumFamily),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 6,
                                child: wrapWithModel(
                                  model: _model.adminHeaderModel,
                                  updateCallback: () => safeSetState(() {}),
                                  child: AdminHeaderWidget(),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 11,
                          child: Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: StreamBuilder<
                                        List<LeadsManagementRecord>>(
                                      stream: queryLeadsManagementRecord(
                                        parent: FFAppState().outletRef,
                                        queryBuilder: (leadsManagementRecord) =>
                                            leadsManagementRecord.where(
                                          'id',
                                          isEqualTo: widget!.id != ''
                                              ? widget!.id
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<LeadsManagementRecord>
                                            containerLeadsManagementRecordList =
                                            snapshot.data!;
                                        final containerLeadsManagementRecord =
                                            containerLeadsManagementRecordList
                                                    .isNotEmpty
                                                ? containerLeadsManagementRecordList
                                                    .first
                                                : null;

                                        return Container(
                                          width: double.infinity,
                                          decoration: BoxDecoration(),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 6,
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 20.0, 0.0),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.0),
                                                      border: Border.all(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .accent2,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.all(10.0),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0.0,
                                                                        0.0,
                                                                        0.0,
                                                                        10.0),
                                                            child: Row(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .secondaryBackground,
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        blurRadius:
                                                                            4.0,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .customColor1,
                                                                        offset:
                                                                            Offset(
                                                                          0.0,
                                                                          2.0,
                                                                        ),
                                                                      )
                                                                    ],
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10.0),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            20.0,
                                                                            10.0,
                                                                            20.0,
                                                                            10.0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              10.0,
                                                                              0.0),
                                                                          child:
                                                                              Text(
                                                                            valueOrDefault<String>(
                                                                              containerLeadsManagementRecord?.username,
                                                                              '0',
                                                                            ),
                                                                            style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        SelectionArea(
                                                                            child:
                                                                                Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            containerLeadsManagementRecord?.mobile,
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .labelLarge
                                                                              .override(
                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                letterSpacing: 0.0,
                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                              ),
                                                                        )),
                                                                      ],
                                                                    ),
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
                                                                        10.0,
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
                                                                  'Follow Up Details',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                      ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(),
                                                              child: StreamBuilder<
                                                                  List<
                                                                      LeadFollowUpRecord>>(
                                                                stream:
                                                                    queryLeadFollowUpRecord(
                                                                  parent: FFAppState()
                                                                      .outletRef,
                                                                  queryBuilder:
                                                                      (leadFollowUpRecord) =>
                                                                          leadFollowUpRecord
                                                                              .where(
                                                                    'leadMRefId',
                                                                    isEqualTo: widget!.id !=
                                                                            ''
                                                                        ? widget!
                                                                            .id
                                                                        : null,
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
                                                                  List<LeadFollowUpRecord>
                                                                      listViewLeadFollowUpRecordList =
                                                                      snapshot
                                                                          .data!;
                                                                  if (listViewLeadFollowUpRecordList
                                                                      .isEmpty) {
                                                                    return ListViewMsgWidget();
                                                                  }

                                                                  return ListView
                                                                      .builder(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .zero,
                                                                    shrinkWrap:
                                                                        true,
                                                                    scrollDirection:
                                                                        Axis.vertical,
                                                                    itemCount:
                                                                        listViewLeadFollowUpRecordList
                                                                            .length,
                                                                    itemBuilder:
                                                                        (context,
                                                                            listViewIndex) {
                                                                      final listViewLeadFollowUpRecord =
                                                                          listViewLeadFollowUpRecordList[
                                                                              listViewIndex];
                                                                      return Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            7.0),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              100.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            boxShadow: [
                                                                              BoxShadow(
                                                                                blurRadius: 4.0,
                                                                                color: FlutterFlowTheme.of(context).customColor1,
                                                                                offset: Offset(
                                                                                  0.0,
                                                                                  2.0,
                                                                                ),
                                                                              )
                                                                            ],
                                                                            borderRadius:
                                                                                BorderRadius.circular(10.0),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(8.0),
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                  child: StreamBuilder<List<UserProfileRecord>>(
                                                                                    stream: queryUserProfileRecord(
                                                                                      queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                        'id',
                                                                                        isEqualTo: listViewLeadFollowUpRecord.assignedTo != '' ? listViewLeadFollowUpRecord.assignedTo : null,
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
                                                                                      List<UserProfileRecord> rowUserProfileRecordList = snapshot.data!;
                                                                                      final rowUserProfileRecord = rowUserProfileRecordList.isNotEmpty ? rowUserProfileRecordList.first : null;

                                                                                      return Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'Date :',
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                    child: Text(
                                                                                                      functions.milisecToTimestamp(listViewLeadFollowUpRecord.date),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'Time :',
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                    child: Text(
                                                                                                      functions.dateToTime(listViewLeadFollowUpRecord.time),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                  child: Text(
                                                                                                    'Assigned To :',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 20.0, 0.0),
                                                                                                  child: Text(
                                                                                                    valueOrDefault<String>(
                                                                                                      rowUserProfileRecord?.name,
                                                                                                      '0',
                                                                                                    ),
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                                Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 4.0),
                                                                                        child: Text(
                                                                                          'Description',
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 5.0, 4.0),
                                                                                        child: Text(
                                                                                          ':',
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 5.0, 0.0, 4.0),
                                                                                          child: Text(
                                                                                            listViewLeadFollowUpRecord.discription,
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelSmallFamily),
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
                                                                        ),
                                                                      );
                                                                    },
                                                                  );
                                                                },
                                                              ),
                                                            ),
                                                          ),
                                                          Stack(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            5.0,
                                                                            5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    FlutterFlowIconButton(
                                                                      borderColor:
                                                                          Colors
                                                                              .transparent,
                                                                      borderRadius:
                                                                          30.0,
                                                                      borderWidth:
                                                                          1.0,
                                                                      buttonSize:
                                                                          60.0,
                                                                      fillColor:
                                                                          FlutterFlowTheme.of(context)
                                                                              .tertiary,
                                                                      icon:
                                                                          Icon(
                                                                        Icons
                                                                            .add,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                        size:
                                                                            30.0,
                                                                      ),
                                                                      onPressed:
                                                                          () async {
                                                                        await showModalBottomSheet(
                                                                          isScrollControlled:
                                                                              true,
                                                                          backgroundColor:
                                                                              Colors.transparent,
                                                                          enableDrag:
                                                                              false,
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (context) {
                                                                            return WebViewAware(
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(context).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: Padding(
                                                                                  padding: MediaQuery.viewInsetsOf(context),
                                                                                  child: ScheduleWidget(
                                                                                    leadMRefid: containerLeadsManagementRecord?.id,
                                                                                    username: containerLeadsManagementRecord?.username,
                                                                                    mobile: containerLeadsManagementRecord?.mobile,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            );
                                                                          },
                                                                        ).then((value) =>
                                                                            safeSetState(() {}));
                                                                      },
                                                                    ),
                                                                  ],
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
                                              Expanded(
                                                flex: 7,
                                                child: Column(
                                                  children: [
                                                    Align(
                                                      alignment:
                                                          Alignment(0.0, 0),
                                                      child: TabBar(
                                                        labelColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primaryText,
                                                        unselectedLabelColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor3,
                                                        labelStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  fontSize:
                                                                      14.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                        unselectedLabelStyle:
                                                            TextStyle(),
                                                        indicatorColor:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .primary,
                                                        tabs: [
                                                          Tab(
                                                            text:
                                                                'Lead Details',
                                                          ),
                                                          Tab(
                                                            text:
                                                                'Call Details',
                                                          ),
                                                        ],
                                                        controller: _model
                                                            .tabBarController,
                                                        onTap: (i) async {
                                                          [
                                                            () async {},
                                                            () async {}
                                                          ][i]();
                                                        },
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: TabBarView(
                                                        controller: _model
                                                            .tabBarController,
                                                        children: [
                                                          StreamBuilder<
                                                              List<
                                                                  LeadsManagementRecord>>(
                                                            stream:
                                                                queryLeadsManagementRecord(
                                                              parent:
                                                                  FFAppState()
                                                                      .outletRef,
                                                              queryBuilder:
                                                                  (leadsManagementRecord) =>
                                                                      leadsManagementRecord
                                                                          .where(
                                                                'id',
                                                                isEqualTo:
                                                                    widget!.id !=
                                                                            ''
                                                                        ? widget!
                                                                            .id
                                                                        : null,
                                                              ),
                                                              singleRecord:
                                                                  true,
                                                            ),
                                                            builder: (context,
                                                                snapshot) {
                                                              // Customize what your widget looks like when it's loading.
                                                              if (!snapshot
                                                                  .hasData) {
                                                                return Center(
                                                                  child:
                                                                      SizedBox(
                                                                    width: 30.0,
                                                                    height:
                                                                        30.0,
                                                                    child:
                                                                        SpinKitRing(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          30.0,
                                                                    ),
                                                                  ),
                                                                );
                                                              }
                                                              List<LeadsManagementRecord>
                                                                  container5LeadsManagementRecordList =
                                                                  snapshot
                                                                      .data!;
                                                              final container5LeadsManagementRecord =
                                                                  container5LeadsManagementRecordList
                                                                          .isNotEmpty
                                                                      ? container5LeadsManagementRecordList
                                                                          .first
                                                                      : null;

                                                              return Container(
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.3,
                                                                height: double
                                                                    .infinity,
                                                                decoration:
                                                                    BoxDecoration(),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          10.0,
                                                                          0.0,
                                                                          0.0),
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
                                                                            3.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Container(
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                ),
                                                                                child: Align(
                                                                                  alignment: AlignmentDirectional(0.0, 1.0),
                                                                                  child: Stack(
                                                                                    alignment: AlignmentDirectional(0.0, 0.0),
                                                                                    children: [
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(-1.0, 0.0),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                          child: Text(
                                                                                            widget!.username!,
                                                                                            style: FlutterFlowTheme.of(context).headlineMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineMediumFamily),
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Align(
                                                                                        alignment: AlignmentDirectional(1.0, 0.0),
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {
                                                                                            if (animationsMap['containerOnActionTriggerAnimation'] != null) {
                                                                                              await animationsMap['containerOnActionTriggerAnimation']!.controller.forward(from: 0.0);
                                                                                            }
                                                                                          },
                                                                                          child: Container(
                                                                                            width: 30.0,
                                                                                            height: 30.0,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(5.0),
                                                                                            ),
                                                                                            child: Icon(
                                                                                              Icons.mode_edit,
                                                                                              color: FlutterFlowTheme.of(context).tertiary,
                                                                                              size: 18.0,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Container(
                                                                                        height: MediaQuery.sizeOf(context).height * 0.05,
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                          border: Border.all(
                                                                                            color: FlutterFlowTheme.of(context).customColor1,
                                                                                          ),
                                                                                        ),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              child: TextFormField(
                                                                                                controller: _model.textFieldunameTextController ??= TextEditingController(
                                                                                                  text: container5LeadsManagementRecord?.username,
                                                                                                ),
                                                                                                focusNode: _model.textFieldunameFocusNode,
                                                                                                autofocus: true,
                                                                                                obscureText: false,
                                                                                                decoration: InputDecoration(
                                                                                                  isDense: true,
                                                                                                  hintText: 'Change Customer Name',
                                                                                                  hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                      ),
                                                                                                  enabledBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  focusedBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  errorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  focusedErrorBorder: OutlineInputBorder(
                                                                                                    borderSide: BorderSide(
                                                                                                      color: Color(0x00000000),
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                    borderRadius: BorderRadius.circular(10.0),
                                                                                                  ),
                                                                                                  filled: true,
                                                                                                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                ),
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                    ),
                                                                                                validator: _model.textFieldunameTextControllerValidator.asValidator(context),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                              child: FFButtonWidget(
                                                                                                onPressed: () async {
                                                                                                  if (animationsMap['containerOnActionTriggerAnimation'] != null) {
                                                                                                    animationsMap['containerOnActionTriggerAnimation']!.controller.reset();
                                                                                                  }
                                                                                                },
                                                                                                text: '',
                                                                                                icon: Icon(
                                                                                                  Icons.close,
                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                  size: 18.0,
                                                                                                ),
                                                                                                options: FFButtonOptions(
                                                                                                  width: 40.0,
                                                                                                  height: 40.0,
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                  color: FlutterFlowTheme.of(context).customColor1,
                                                                                                  textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                        color: Colors.white,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
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
                                                                                      ).animateOnActionTrigger(
                                                                                        animationsMap['containerOnActionTriggerAnimation']!,
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
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                    child: Text(
                                                                                      container5LeadsManagementRecord!.mobile,
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(15.0, 0.0, 0.0, 0.0),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Text(
                                                                                    container5LeadsManagementRecord!.email,
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
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
                                                                            4.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                    child: Text(
                                                                                      'Area',
                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                            fontSize: 10.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                    child: TextFormField(
                                                                                      controller: _model.textController2 ??= TextEditingController(
                                                                                        text: container5LeadsManagementRecord?.area,
                                                                                      ),
                                                                                      focusNode: _model.textFieldFocusNode1,
                                                                                      autofocus: true,
                                                                                      obscureText: false,
                                                                                      decoration: InputDecoration(
                                                                                        isDense: true,
                                                                                        hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                            ),
                                                                                        enabledBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).customColor1,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        focusedBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        errorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                          borderSide: BorderSide(
                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                            width: 1.0,
                                                                                          ),
                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                        ),
                                                                                        filled: true,
                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            fontSize: 14.0,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                          ),
                                                                                      validator: _model.textController2Validator.asValidator(context),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                        child: Text(
                                                                                          'State :',
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                    child: StreamBuilder<List<StateRecord>>(
                                                                                      stream: queryStateRecord(),
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
                                                                                        List<StateRecord> dropDownStateStateRecordList = snapshot.data!;

                                                                                        return FlutterFlowDropDown<String>(
                                                                                          controller: _model.dropDownStateValueController ??= FormFieldController<String>(
                                                                                            _model.dropDownStateValue ??= container5LeadsManagementRecord?.state,
                                                                                          ),
                                                                                          options: dropDownStateStateRecordList.map((e) => e.name).toList(),
                                                                                          onChanged: (val) => safeSetState(() => _model.dropDownStateValue = val),
                                                                                          width: double.infinity,
                                                                                          height: 36.0,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                              ),
                                                                                          icon: Icon(
                                                                                            Icons.keyboard_arrow_down,
                                                                                            color: FlutterFlowTheme.of(context).customColor3,
                                                                                            size: 15.0,
                                                                                          ),
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          elevation: 2.0,
                                                                                          borderColor: FlutterFlowTheme.of(context).customColor1,
                                                                                          borderWidth: 0.0,
                                                                                          borderRadius: 10.0,
                                                                                          margin: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          hidesUnderline: true,
                                                                                          isSearchable: false,
                                                                                          isMultiSelect: false,
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                        child: Text(
                                                                                          'City :',
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                    child: StreamBuilder<List<CitiesRecord>>(
                                                                                      stream: queryCitiesRecord(
                                                                                        queryBuilder: (citiesRecord) => citiesRecord.where(
                                                                                          'state',
                                                                                          isEqualTo: _model.dropDownStateValue,
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
                                                                                        List<CitiesRecord> dropDownCityCitiesRecordList = snapshot.data!;

                                                                                        return FlutterFlowDropDown<String>(
                                                                                          controller: _model.dropDownCityValueController ??= FormFieldController<String>(
                                                                                            _model.dropDownCityValue ??= container5LeadsManagementRecord?.city,
                                                                                          ),
                                                                                          options: dropDownCityCitiesRecordList.map((e) => e.cityName).toList(),
                                                                                          onChanged: (val) => safeSetState(() => _model.dropDownCityValue = val),
                                                                                          width: double.infinity,
                                                                                          height: 36.0,
                                                                                          textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                fontSize: 14.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                              ),
                                                                                          icon: Icon(
                                                                                            Icons.keyboard_arrow_down,
                                                                                            color: FlutterFlowTheme.of(context).customColor3,
                                                                                            size: 15.0,
                                                                                          ),
                                                                                          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          elevation: 2.0,
                                                                                          borderColor: FlutterFlowTheme.of(context).customColor1,
                                                                                          borderWidth: 0.0,
                                                                                          borderRadius: 10.0,
                                                                                          margin: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                          hidesUnderline: true,
                                                                                          isSearchable: false,
                                                                                          isMultiSelect: false,
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
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: [
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                      child: Text(
                                                                                        'Source :',
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          container5LeadsManagementRecord?.source == 'JustDail' ? 'JustDial' : container5LeadsManagementRecord?.source,
                                                                                          'source',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                              color: FlutterFlowTheme.of(context).info,
                                                                                              fontSize: 14.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                  child: FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropDownSourceValueController ??= FormFieldController<String>(
                                                                                      _model.dropDownSourceValue ??= container5LeadsManagementRecord?.source,
                                                                                    ),
                                                                                    options: [
                                                                                      'Walk-in',
                                                                                      'Reference',
                                                                                      'Facebook',
                                                                                      'Other',
                                                                                      'JustDial',
                                                                                      'Indiamart'
                                                                                    ],
                                                                                    onChanged: (val) => safeSetState(() => _model.dropDownSourceValue = val),
                                                                                    width: double.infinity,
                                                                                    height: 36.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                        ),
                                                                                    icon: Icon(
                                                                                      Icons.keyboard_arrow_down,
                                                                                      color: FlutterFlowTheme.of(context).customColor3,
                                                                                      size: 15.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 2.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).customColor1,
                                                                                    borderWidth: 0.0,
                                                                                    borderRadius: 10.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    hidesUnderline: true,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            child:
                                                                                Column(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                              children: [
                                                                                Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                      child: Text(
                                                                                        'Priority :',
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          container5LeadsManagementRecord?.stage,
                                                                                          '-',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                              fontSize: 10.0,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                  child: FlutterFlowDropDown<String>(
                                                                                    controller: _model.dropDownPriorityValueController ??= FormFieldController<String>(
                                                                                      _model.dropDownPriorityValue ??= container5LeadsManagementRecord?.priority,
                                                                                    ),
                                                                                    options: [
                                                                                      'cold',
                                                                                      'hot',
                                                                                      'warm',
                                                                                      'interested'
                                                                                    ],
                                                                                    onChanged: (val) => safeSetState(() => _model.dropDownPriorityValue = val),
                                                                                    width: double.infinity,
                                                                                    height: 36.0,
                                                                                    textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                        ),
                                                                                    icon: Icon(
                                                                                      Icons.keyboard_arrow_down,
                                                                                      color: FlutterFlowTheme.of(context).customColor3,
                                                                                      size: 15.0,
                                                                                    ),
                                                                                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                    elevation: 2.0,
                                                                                    borderColor: FlutterFlowTheme.of(context).customColor1,
                                                                                    borderWidth: 0.0,
                                                                                    borderRadius: 10.0,
                                                                                    margin: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    hidesUnderline: true,
                                                                                    isSearchable: false,
                                                                                    isMultiSelect: false,
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: [
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                        child: Text(
                                                                                          'BusinessName :',
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  TextFormField(
                                                                                    controller: _model.textController3 ??= TextEditingController(
                                                                                      text: container5LeadsManagementRecord?.businessName,
                                                                                    ),
                                                                                    focusNode: _model.textFieldFocusNode2,
                                                                                    autofocus: true,
                                                                                    obscureText: false,
                                                                                    decoration: InputDecoration(
                                                                                      isDense: true,
                                                                                      hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                            letterSpacing: 0.0,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                          ),
                                                                                      enabledBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).customColor1,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      focusedBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      errorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      focusedErrorBorder: OutlineInputBorder(
                                                                                        borderSide: BorderSide(
                                                                                          color: FlutterFlowTheme.of(context).primary,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      filled: true,
                                                                                      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      suffixIcon: Icon(
                                                                                        Icons.edit,
                                                                                        color: Color(0xFF757575),
                                                                                        size: 20.0,
                                                                                      ),
                                                                                    ),
                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                          fontSize: 14.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                        ),
                                                                                    validator: _model.textController3Validator.asValidator(context),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            Expanded(
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                children: [
                                                                                  Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                        child: Text(
                                                                                          'Business Type:',
                                                                                          style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                fontSize: 10.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      StreamBuilder<List<BusinessTypeRecord>>(
                                                                                        stream: queryBusinessTypeRecord(
                                                                                          queryBuilder: (businessTypeRecord) => businessTypeRecord.where(
                                                                                            'id',
                                                                                            isEqualTo: valueOrDefault<String>(
                                                                                                      container5LeadsManagementRecord?.businessType,
                                                                                                      'Business Type',
                                                                                                    ) !=
                                                                                                    ''
                                                                                                ? valueOrDefault<String>(
                                                                                                    container5LeadsManagementRecord?.businessType,
                                                                                                    'Business Type',
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
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                                child: Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    rowBusinessTypeRecord?.name == null || rowBusinessTypeRecord?.name == '' ? '#' : rowBusinessTypeRecord?.name,
                                                                                                    '#',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                        color: FlutterFlowTheme.of(context).info,
                                                                                                        fontSize: 14.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                    child: Container(
                                                                                      width: double.infinity,
                                                                                      height: 40.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                      ),
                                                                                      child: StreamBuilder<List<BusinessTypeRecord>>(
                                                                                        stream: queryBusinessTypeRecord(),
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
                                                                                          List<BusinessTypeRecord> dropDownBTypeBusinessTypeRecordList = snapshot.data!;

                                                                                          return FlutterFlowDropDown<String>(
                                                                                            controller: _model.dropDownBTypeValueController ??= FormFieldController<String>(
                                                                                              _model.dropDownBTypeValue ??= container5LeadsManagementRecord?.businessType,
                                                                                            ),
                                                                                            options: List<String>.from(dropDownBTypeBusinessTypeRecordList.map((e) => e.id).toList()),
                                                                                            optionLabels: dropDownBTypeBusinessTypeRecordList.map((e) => e.name).toList(),
                                                                                            onChanged: (val) => safeSetState(() => _model.dropDownBTypeValue = val),
                                                                                            width: double.infinity,
                                                                                            height: 40.0,
                                                                                            textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                ),
                                                                                            icon: Icon(
                                                                                              Icons.keyboard_arrow_down,
                                                                                              color: FlutterFlowTheme.of(context).customColor3,
                                                                                              size: 15.0,
                                                                                            ),
                                                                                            fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            elevation: 2.0,
                                                                                            borderColor: FlutterFlowTheme.of(context).customColor1,
                                                                                            borderWidth: 0.0,
                                                                                            borderRadius: 10.0,
                                                                                            margin: EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 0.0, 0.0),
                                                                                            hidesUnderline: true,
                                                                                            isSearchable: false,
                                                                                            isMultiSelect: false,
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
                                                                      Expanded(
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              10.0),
                                                                          child:
                                                                              StreamBuilder<List<LeadTagRecord>>(
                                                                            stream:
                                                                                queryLeadTagRecord(
                                                                              parent: FFAppState().outletRef,
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
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<LeadTagRecord> containerLeadTagRecordList = snapshot.data!;

                                                                              return ClipRRect(
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  height: 100.0,
                                                                                  decoration: BoxDecoration(),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 7.0, 0.0, 10.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 6.0),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                                child: Text(
                                                                                                  'Requirements',
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    TextFormField(
                                                                                                      controller: _model.textController4 ??= TextEditingController(
                                                                                                        text: functions.leadsReq(container5LeadsManagementRecord?.requirement),
                                                                                                      ),
                                                                                                      focusNode: _model.textFieldFocusNode3,
                                                                                                      autofocus: true,
                                                                                                      obscureText: false,
                                                                                                      decoration: InputDecoration(
                                                                                                        isDense: true,
                                                                                                        hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                            ),
                                                                                                        enabledBorder: OutlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).customColor1,
                                                                                                            width: 1.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                        ),
                                                                                                        focusedBorder: OutlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                            width: 1.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                        ),
                                                                                                        errorBorder: OutlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 1.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                        ),
                                                                                                        focusedErrorBorder: OutlineInputBorder(
                                                                                                          borderSide: BorderSide(
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            width: 1.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                                                        ),
                                                                                                        filled: true,
                                                                                                        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                            fontSize: 14.0,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                          ),
                                                                                                      maxLines: null,
                                                                                                      validator: _model.textController4Validator.asValidator(context),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 1.0),
                                                                                                child: Text(
                                                                                                  'Tag',
                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                      ),
                                                                                                ),
                                                                                              ),
                                                                                              Container(
                                                                                                width: double.infinity,
                                                                                                height: MediaQuery.sizeOf(context).height * 0.05,
                                                                                                decoration: BoxDecoration(),
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Expanded(
                                                                                                      child: Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                        child: Autocomplete<String>(
                                                                                                          initialValue: TextEditingValue(),
                                                                                                          optionsBuilder: (textEditingValue) {
                                                                                                            if (textEditingValue.text == '') {
                                                                                                              return const Iterable<String>.empty();
                                                                                                            }
                                                                                                            return containerLeadTagRecordList.map((e) => e.leadTagName).toList().where((option) {
                                                                                                              final lowercaseOption = option.toLowerCase();
                                                                                                              return lowercaseOption.contains(textEditingValue.text.toLowerCase());
                                                                                                            });
                                                                                                          },
                                                                                                          optionsViewBuilder: (context, onSelected, options) {
                                                                                                            return AutocompleteOptionsList(
                                                                                                              textFieldKey: _model.textFieldtagKey,
                                                                                                              textController: _model.textFieldtagTextController!,
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
                                                                                                            safeSetState(() => _model.textFieldtagSelectedOption = selection);
                                                                                                            FocusScope.of(context).unfocus();
                                                                                                          },
                                                                                                          fieldViewBuilder: (
                                                                                                            context,
                                                                                                            textEditingController,
                                                                                                            focusNode,
                                                                                                            onEditingComplete,
                                                                                                          ) {
                                                                                                            _model.textFieldtagFocusNode = focusNode;

                                                                                                            _model.textFieldtagTextController = textEditingController;
                                                                                                            return TextFormField(
                                                                                                              key: _model.textFieldtagKey,
                                                                                                              controller: textEditingController,
                                                                                                              focusNode: focusNode,
                                                                                                              onEditingComplete: onEditingComplete,
                                                                                                              onChanged: (_) => EasyDebounce.debounce(
                                                                                                                '_model.textFieldtagTextController',
                                                                                                                Duration(milliseconds: 2000),
                                                                                                                () async {
                                                                                                                  safeSetState(() {
                                                                                                                    _model.simpleSearchResults = TextSearch(
                                                                                                                      containerLeadTagRecordList
                                                                                                                          .map(
                                                                                                                            (record) => TextSearchItem.fromTerms(record, [record.leadTagName!]),
                                                                                                                          )
                                                                                                                          .toList(),
                                                                                                                    ).search(_model.textFieldtagTextController.text).map((r) => r.object).toList();
                                                                                                                    ;
                                                                                                                  });
                                                                                                                  FFAppState().tagSearch = true;
                                                                                                                  safeSetState(() {});
                                                                                                                },
                                                                                                              ),
                                                                                                              autofocus: true,
                                                                                                              obscureText: false,
                                                                                                              decoration: InputDecoration(
                                                                                                                isDense: true,
                                                                                                                hintText: 'Search Tag Here...',
                                                                                                                hintStyle: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                                    ),
                                                                                                                enabledBorder: OutlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                                ),
                                                                                                                focusedBorder: OutlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                                ),
                                                                                                                errorBorder: OutlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                                ),
                                                                                                                focusedErrorBorder: OutlineInputBorder(
                                                                                                                  borderSide: BorderSide(
                                                                                                                    color: FlutterFlowTheme.of(context).primary,
                                                                                                                    width: 1.0,
                                                                                                                  ),
                                                                                                                  borderRadius: BorderRadius.circular(10.0),
                                                                                                                ),
                                                                                                                filled: true,
                                                                                                                fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                              ),
                                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                                  ),
                                                                                                              maxLines: null,
                                                                                                              validator: _model.textFieldtagTextControllerValidator.asValidator(context),
                                                                                                            );
                                                                                                          },
                                                                                                        ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                      child: FlutterFlowIconButton(
                                                                                                        borderColor: FlutterFlowTheme.of(context).customColor1,
                                                                                                        borderRadius: 10.0,
                                                                                                        borderWidth: 1.0,
                                                                                                        buttonSize: 40.0,
                                                                                                        icon: Icon(
                                                                                                          Icons.close,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          size: 22.0,
                                                                                                        ),
                                                                                                        onPressed: () async {
                                                                                                          safeSetState(() {
                                                                                                            _model.textFieldtagTextController?.clear();
                                                                                                          });
                                                                                                          FFAppState().tagSearch = false;
                                                                                                          safeSetState(() {});
                                                                                                        },
                                                                                                      ),
                                                                                                    ),
                                                                                                    FFButtonWidget(
                                                                                                      onPressed: () async {
                                                                                                        _model.tag = await actions.generateTagCode(
                                                                                                          containerLeadTagRecordList.toList(),
                                                                                                        );
                                                                                                        FFAppState().leadtagCode = _model.tag!;
                                                                                                        safeSetState(() {});
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
                                                                                                                  child: AddTagWidget(
                                                                                                                    codLen: FFAppState().leadtagCode,
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          },
                                                                                                        ).then((value) => safeSetState(() {}));

                                                                                                        safeSetState(() {});
                                                                                                      },
                                                                                                      text: 'Add',
                                                                                                      options: FFButtonOptions(
                                                                                                        width: 80.0,
                                                                                                        height: 34.0,
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                        color: FlutterFlowTheme.of(context).secondary,
                                                                                                        textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                              color: FlutterFlowTheme.of(context).lineColor,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                            ),
                                                                                                        elevation: 2.0,
                                                                                                        borderSide: BorderSide(
                                                                                                          color: Colors.transparent,
                                                                                                          width: 1.0,
                                                                                                        ),
                                                                                                        borderRadius: BorderRadius.circular(8.0),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 2,
                                                                                          child: Padding(
                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                                    child: SingleChildScrollView(
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    'Default Tags',
                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                          fontSize: 10.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                            child: Container(
                                                                                                              width: double.infinity,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Stack(
                                                                                                                children: [
                                                                                                                  if (!FFAppState().tagSearch)
                                                                                                                    Builder(
                                                                                                                      builder: (context) {
                                                                                                                        final tagLIstFromDB = containerLeadTagRecordList.map((e) => e).toList();

                                                                                                                        return Wrap(
                                                                                                                          spacing: 0.0,
                                                                                                                          runSpacing: 0.0,
                                                                                                                          alignment: WrapAlignment.start,
                                                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                          direction: Axis.horizontal,
                                                                                                                          runAlignment: WrapAlignment.start,
                                                                                                                          verticalDirection: VerticalDirection.down,
                                                                                                                          clipBehavior: Clip.none,
                                                                                                                          children: List.generate(tagLIstFromDB.length, (tagLIstFromDBIndex) {
                                                                                                                            final tagLIstFromDBItem = tagLIstFromDB[tagLIstFromDBIndex];
                                                                                                                            return Padding(
                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 5.0),
                                                                                                                              child: InkWell(
                                                                                                                                splashColor: Colors.transparent,
                                                                                                                                focusColor: Colors.transparent,
                                                                                                                                hoverColor: Colors.transparent,
                                                                                                                                highlightColor: Colors.transparent,
                                                                                                                                onTap: () async {
                                                                                                                                  _model.resTag1 = await actions.removeDuplicateTagList(
                                                                                                                                    tagLIstFromDBItem,
                                                                                                                                  );

                                                                                                                                  safeSetState(() {});
                                                                                                                                },
                                                                                                                                onDoubleTap: () async {
                                                                                                                                  FFAppState().addToTagList(getJsonField(
                                                                                                                                    functions.generateTaglDetailsJson(tagLIstFromDBItem.leadTagName, tagLIstFromDBItem.code, tagLIstFromDBItem.isDeleted, tagLIstFromDBItem.type),
                                                                                                                                    r'''$''',
                                                                                                                                  ));
                                                                                                                                  safeSetState(() {});
                                                                                                                                },
                                                                                                                                child: Container(
                                                                                                                                  height: MediaQuery.sizeOf(context).height * 0.035,
                                                                                                                                  decoration: BoxDecoration(
                                                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                                                  ),
                                                                                                                                  child: Padding(
                                                                                                                                    padding: EdgeInsets.all(1.0),
                                                                                                                                    child: Row(
                                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                      children: [
                                                                                                                                        if (tagLIstFromDBItem.isDeleted == false)
                                                                                                                                          Padding(
                                                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 5.0, 0.0),
                                                                                                                                            child: Text(
                                                                                                                                              tagLIstFromDBItem.leadTagName,
                                                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                                    fontSize: 11.0,
                                                                                                                                                    letterSpacing: 0.0,
                                                                                                                                                    useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                                  ),
                                                                                                                                            ),
                                                                                                                                          ),
                                                                                                                                      ],
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              ),
                                                                                                                            );
                                                                                                                          }),
                                                                                                                        );
                                                                                                                      },
                                                                                                                    ),
                                                                                                                  if (FFAppState().tagSearch)
                                                                                                                    Padding(
                                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                      child: Builder(
                                                                                                                        builder: (context) {
                                                                                                                          final tagLIst = _model.simpleSearchResults.toList();

                                                                                                                          return Wrap(
                                                                                                                            spacing: 0.0,
                                                                                                                            runSpacing: 0.0,
                                                                                                                            alignment: WrapAlignment.start,
                                                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                            direction: Axis.horizontal,
                                                                                                                            runAlignment: WrapAlignment.start,
                                                                                                                            verticalDirection: VerticalDirection.down,
                                                                                                                            clipBehavior: Clip.none,
                                                                                                                            children: List.generate(tagLIst.length, (tagLIstIndex) {
                                                                                                                              final tagLIstItem = tagLIst[tagLIstIndex];
                                                                                                                              return Visibility(
                                                                                                                                visible: tagLIstItem.isDeleted == false,
                                                                                                                                child: Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 5.0),
                                                                                                                                  child: InkWell(
                                                                                                                                    splashColor: Colors.transparent,
                                                                                                                                    focusColor: Colors.transparent,
                                                                                                                                    hoverColor: Colors.transparent,
                                                                                                                                    highlightColor: Colors.transparent,
                                                                                                                                    onTap: () async {
                                                                                                                                      _model.resTag = await actions.removeDuplicateTagList(
                                                                                                                                        tagLIstItem,
                                                                                                                                      );

                                                                                                                                      safeSetState(() {});
                                                                                                                                    },
                                                                                                                                    onDoubleTap: () async {},
                                                                                                                                    child: Container(
                                                                                                                                      height: MediaQuery.sizeOf(context).height * 0.035,
                                                                                                                                      decoration: BoxDecoration(
                                                                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                                                        borderRadius: BorderRadius.circular(5.0),
                                                                                                                                        border: Border.all(
                                                                                                                                          color: FlutterFlowTheme.of(context).customColor1,
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                      child: Padding(
                                                                                                                                        padding: EdgeInsets.all(1.0),
                                                                                                                                        child: Row(
                                                                                                                                          mainAxisSize: MainAxisSize.min,
                                                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                                          children: [
                                                                                                                                            Padding(
                                                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 5.0, 0.0),
                                                                                                                                              child: Text(
                                                                                                                                                tagLIstItem.leadTagName,
                                                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                                      fontSize: 11.0,
                                                                                                                                                      letterSpacing: 0.0,
                                                                                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                                    ),
                                                                                                                                              ),
                                                                                                                                            ),
                                                                                                                                          ],
                                                                                                                                        ),
                                                                                                                                      ),
                                                                                                                                    ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                              );
                                                                                                                            }),
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
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 0.0, 0.0),
                                                                                                    child: SingleChildScrollView(
                                                                                                      child: Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                            child: Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                                  child: Text(
                                                                                                                    'Selected Tags',
                                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                          fontSize: 10.0,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodySmallFamily),
                                                                                                                        ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ),
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                                            child: Container(
                                                                                                              width: double.infinity,
                                                                                                              decoration: BoxDecoration(),
                                                                                                              child: Builder(
                                                                                                                builder: (context) {
                                                                                                                  final tagL = FFAppState().tagList.toList();

                                                                                                                  return Wrap(
                                                                                                                    spacing: 0.0,
                                                                                                                    runSpacing: 0.0,
                                                                                                                    alignment: WrapAlignment.start,
                                                                                                                    crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                                    direction: Axis.horizontal,
                                                                                                                    runAlignment: WrapAlignment.start,
                                                                                                                    verticalDirection: VerticalDirection.down,
                                                                                                                    clipBehavior: Clip.none,
                                                                                                                    children: List.generate(tagL.length, (tagLIndex) {
                                                                                                                      final tagLItem = tagL[tagLIndex];
                                                                                                                      return Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 5.0),
                                                                                                                        child: Container(
                                                                                                                          decoration: BoxDecoration(
                                                                                                                            color: FlutterFlowTheme.of(context).secondary,
                                                                                                                            borderRadius: BorderRadius.circular(5.0),
                                                                                                                          ),
                                                                                                                          child: Padding(
                                                                                                                            padding: EdgeInsets.all(1.0),
                                                                                                                            child: Row(
                                                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                              children: [
                                                                                                                                Padding(
                                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 5.0, 0.0),
                                                                                                                                  child: Text(
                                                                                                                                    getJsonField(
                                                                                                                                      tagLItem,
                                                                                                                                      r'''$.leadTagName''',
                                                                                                                                    ).toString(),
                                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                          fontSize: 11.0,
                                                                                                                                          letterSpacing: 0.0,
                                                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                        ),
                                                                                                                                  ),
                                                                                                                                ),
                                                                                                                                FlutterFlowIconButton(
                                                                                                                                  borderColor: Colors.transparent,
                                                                                                                                  borderRadius: 5.0,
                                                                                                                                  buttonSize: 22.0,
                                                                                                                                  fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                                  icon: Icon(
                                                                                                                                    Icons.close,
                                                                                                                                    color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                                    size: 7.0,
                                                                                                                                  ),
                                                                                                                                  onPressed: () async {
                                                                                                                                    FFAppState().removeFromTagList(tagLItem);
                                                                                                                                    safeSetState(() {});
                                                                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                                                                      SnackBar(
                                                                                                                                        content: Text(
                                                                                                                                          'Removed from List..!',
                                                                                                                                          style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                                                                                fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                                                                                color: Color(0x00000000),
                                                                                                                                                letterSpacing: 0.0,
                                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).headlineSmallFamily),
                                                                                                                                              ),
                                                                                                                                        ),
                                                                                                                                        duration: Duration(milliseconds: 4000),
                                                                                                                                        backgroundColor: FlutterFlowTheme.of(context).alternate,
                                                                                                                                      ),
                                                                                                                                    );
                                                                                                                                  },
                                                                                                                                ),
                                                                                                                              ],
                                                                                                                            ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                      );
                                                                                                                    }),
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
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Container(
                                                                                            width: double.infinity,
                                                                                            decoration: BoxDecoration(
                                                                                              color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                              borderRadius: BorderRadius.circular(10.0),
                                                                                            ),
                                                                                            child: Padding(
                                                                                              padding: EdgeInsets.all(10.0),
                                                                                              child: SingleChildScrollView(
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Builder(
                                                                                                      builder: (context) {
                                                                                                        final tagL = container5LeadsManagementRecord?.leadTag?.toList() ?? [];

                                                                                                        return Wrap(
                                                                                                          spacing: 0.0,
                                                                                                          runSpacing: 0.0,
                                                                                                          alignment: WrapAlignment.start,
                                                                                                          crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                          direction: Axis.horizontal,
                                                                                                          runAlignment: WrapAlignment.start,
                                                                                                          verticalDirection: VerticalDirection.down,
                                                                                                          clipBehavior: Clip.antiAlias,
                                                                                                          children: List.generate(tagL.length, (tagLIndex) {
                                                                                                            final tagLItem = tagL[tagLIndex];
                                                                                                            return Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 5.0),
                                                                                                              child: Container(
                                                                                                                height: MediaQuery.sizeOf(context).height * 0.035,
                                                                                                                decoration: BoxDecoration(
                                                                                                                  color: FlutterFlowTheme.of(context).secondary,
                                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                                ),
                                                                                                                child: Padding(
                                                                                                                  padding: EdgeInsets.all(1.0),
                                                                                                                  child: Row(
                                                                                                                    mainAxisSize: MainAxisSize.min,
                                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                    children: [
                                                                                                                      Padding(
                                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 5.0, 0.0),
                                                                                                                        child: Text(
                                                                                                                          tagLItem.leadTagName,
                                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                fontSize: 11.0,
                                                                                                                                letterSpacing: 0.0,
                                                                                                                                useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                              ),
                                                                                                                        ),
                                                                                                                      ),
                                                                                                                      if (FFAppState().hide)
                                                                                                                        FlutterFlowIconButton(
                                                                                                                          borderColor: Colors.transparent,
                                                                                                                          borderRadius: 5.0,
                                                                                                                          buttonSize: 22.0,
                                                                                                                          fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                          icon: Icon(
                                                                                                                            Icons.close,
                                                                                                                            color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                            size: 7.0,
                                                                                                                          ),
                                                                                                                          onPressed: () async {
                                                                                                                            var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                  context: context,
                                                                                                                                  builder: (alertDialogContext) {
                                                                                                                                    return WebViewAware(
                                                                                                                                      child: AlertDialog(
                                                                                                                                        title: Text('Delete Item...?'),
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
                                                                                                                              await FirebaseStorage.instance.refFromURL(container5LeadsManagementRecord!.leadTag.length.toString()).delete();
                                                                                                                            } else {
                                                                                                                              context.pushNamed(LeadLogWidget.routeName);

                                                                                                                              return;
                                                                                                                            }
                                                                                                                          },
                                                                                                                        ),
                                                                                                                    ],
                                                                                                                  ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            );
                                                                                                          }),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                    if (FFAppState().hide)
                                                                                                      Builder(
                                                                                                        builder: (context) {
                                                                                                          final tagL = container5LeadsManagementRecord?.leadTag?.toList() ?? [];

                                                                                                          return Wrap(
                                                                                                            spacing: 0.0,
                                                                                                            runSpacing: 0.0,
                                                                                                            alignment: WrapAlignment.start,
                                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                            direction: Axis.horizontal,
                                                                                                            runAlignment: WrapAlignment.start,
                                                                                                            verticalDirection: VerticalDirection.down,
                                                                                                            clipBehavior: Clip.antiAlias,
                                                                                                            children: List.generate(tagL.length, (tagLIndex) {
                                                                                                              final tagLItem = tagL[tagLIndex];
                                                                                                              return Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 5.0),
                                                                                                                child: Container(
                                                                                                                  height: MediaQuery.sizeOf(context).height * 0.035,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsets.all(1.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 5.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            tagLItem.leadTagName,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                  fontSize: 11.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        if (FFAppState().hide)
                                                                                                                          FlutterFlowIconButton(
                                                                                                                            borderColor: Colors.transparent,
                                                                                                                            borderRadius: 5.0,
                                                                                                                            buttonSize: 22.0,
                                                                                                                            fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                            icon: Icon(
                                                                                                                              Icons.close,
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              size: 7.0,
                                                                                                                            ),
                                                                                                                            onPressed: () async {
                                                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                    context: context,
                                                                                                                                    builder: (alertDialogContext) {
                                                                                                                                      return WebViewAware(
                                                                                                                                        child: AlertDialog(
                                                                                                                                          title: Text('Delete Item...?'),
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
                                                                                                                                await FirebaseStorage.instance.refFromURL(container5LeadsManagementRecord!.leadTag.length.toString()).delete();
                                                                                                                              } else {
                                                                                                                                context.pushNamed(LeadLogWidget.routeName);

                                                                                                                                return;
                                                                                                                              }
                                                                                                                            },
                                                                                                                          ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }),
                                                                                                          );
                                                                                                        },
                                                                                                      ),
                                                                                                    if (FFAppState().hide)
                                                                                                      Builder(
                                                                                                        builder: (context) {
                                                                                                          final tagL = container5LeadsManagementRecord?.leadTag?.toList() ?? [];

                                                                                                          return Wrap(
                                                                                                            spacing: 0.0,
                                                                                                            runSpacing: 0.0,
                                                                                                            alignment: WrapAlignment.start,
                                                                                                            crossAxisAlignment: WrapCrossAlignment.start,
                                                                                                            direction: Axis.horizontal,
                                                                                                            runAlignment: WrapAlignment.start,
                                                                                                            verticalDirection: VerticalDirection.down,
                                                                                                            clipBehavior: Clip.antiAlias,
                                                                                                            children: List.generate(tagL.length, (tagLIndex) {
                                                                                                              final tagLItem = tagL[tagLIndex];
                                                                                                              return Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 5.0),
                                                                                                                child: Container(
                                                                                                                  height: MediaQuery.sizeOf(context).height * 0.035,
                                                                                                                  decoration: BoxDecoration(
                                                                                                                    color: FlutterFlowTheme.of(context).secondary,
                                                                                                                    borderRadius: BorderRadius.circular(5.0),
                                                                                                                  ),
                                                                                                                  child: Padding(
                                                                                                                    padding: EdgeInsets.all(1.0),
                                                                                                                    child: Row(
                                                                                                                      mainAxisSize: MainAxisSize.min,
                                                                                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                                      children: [
                                                                                                                        Padding(
                                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 5.0, 0.0),
                                                                                                                          child: Text(
                                                                                                                            tagLItem.leadTagName,
                                                                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                                  fontSize: 11.0,
                                                                                                                                  letterSpacing: 0.0,
                                                                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                                                                ),
                                                                                                                          ),
                                                                                                                        ),
                                                                                                                        if (FFAppState().hide)
                                                                                                                          FlutterFlowIconButton(
                                                                                                                            borderColor: Colors.transparent,
                                                                                                                            borderRadius: 5.0,
                                                                                                                            buttonSize: 22.0,
                                                                                                                            fillColor: FlutterFlowTheme.of(context).primaryBackground,
                                                                                                                            icon: Icon(
                                                                                                                              Icons.close,
                                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                              size: 7.0,
                                                                                                                            ),
                                                                                                                            onPressed: () async {
                                                                                                                              var confirmDialogResponse = await showDialog<bool>(
                                                                                                                                    context: context,
                                                                                                                                    builder: (alertDialogContext) {
                                                                                                                                      return WebViewAware(
                                                                                                                                        child: AlertDialog(
                                                                                                                                          title: Text('Delete Item...?'),
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
                                                                                                                                await FirebaseStorage.instance.refFromURL(container5LeadsManagementRecord!.leadTag.length.toString()).delete();
                                                                                                                              } else {
                                                                                                                                context.pushNamed(LeadLogWidget.routeName);

                                                                                                                                return;
                                                                                                                              }
                                                                                                                            },
                                                                                                                          ),
                                                                                                                      ],
                                                                                                                    ),
                                                                                                                  ),
                                                                                                                ),
                                                                                                              );
                                                                                                            }),
                                                                                                          );
                                                                                                        },
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
                                                                                ),
                                                                              );
                                                                            },
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceAround,
                                                                        children: [
                                                                          Text(
                                                                            'Duplicate',
                                                                            style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                          ),
                                                                          Theme(
                                                                            data:
                                                                                ThemeData(
                                                                              checkboxTheme: CheckboxThemeData(
                                                                                visualDensity: VisualDensity.compact,
                                                                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                                                                shape: RoundedRectangleBorder(
                                                                                  borderRadius: BorderRadius.circular(4.0),
                                                                                ),
                                                                              ),
                                                                              unselectedWidgetColor: FlutterFlowTheme.of(context).alternate,
                                                                            ),
                                                                            child:
                                                                                Checkbox(
                                                                              value: _model.checkboxduplicateValue ??= container5LeadsManagementRecord!.isDuplicate,
                                                                              onChanged: (newValue) async {
                                                                                safeSetState(() => _model.checkboxduplicateValue = newValue!);
                                                                              },
                                                                              side: BorderSide(
                                                                                width: 2,
                                                                                color: FlutterFlowTheme.of(context).alternate,
                                                                              ),
                                                                              activeColor: FlutterFlowTheme.of(context).primary,
                                                                              checkColor: FlutterFlowTheme.of(context).info,
                                                                            ),
                                                                          ),
                                                                          if (FFAppState()
                                                                              .hide)
                                                                            FFButtonWidget(
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
                                                                                          child: AddNewDemoWidget(
                                                                                            id: container5LeadsManagementRecord!.id,
                                                                                            ref: container5LeadsManagementRecord!.reference,
                                                                                            leadManagementDoc: container5LeadsManagementRecord!,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                    );
                                                                                  },
                                                                                ).then((value) => safeSetState(() {}));
                                                                              },
                                                                              text: 'Demo Check-In/ Check-Out',
                                                                              options: FFButtonOptions(
                                                                                width: 241.0,
                                                                                height: 40.0,
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                color: FlutterFlowTheme.of(context).primary,
                                                                                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                      color: Colors.white,
                                                                                      letterSpacing: 0.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                    ),
                                                                                borderSide: BorderSide(
                                                                                  color: Colors.transparent,
                                                                                  width: 1.0,
                                                                                ),
                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                              ),
                                                                            ),
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.center,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<String>(
                                                                                  container5LeadsManagementRecord?.stage,
                                                                                  '-',
                                                                                ),
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                      letterSpacing: 0.0,
                                                                                      useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                    ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          FlutterFlowDropDown<
                                                                              String>(
                                                                            controller: _model.dropDownValueController ??=
                                                                                FormFieldController<String>(
                                                                              _model.dropDownValue ??= container5LeadsManagementRecord?.status,
                                                                            ),
                                                                            options: [
                                                                              'DEMO DONE',
                                                                              'DEMO SCHEDULED',
                                                                              'COMPLETED',
                                                                              'LOST'
                                                                            ],
                                                                            onChanged: (val) =>
                                                                                safeSetState(() => _model.dropDownValue = val),
                                                                            width:
                                                                                200.0,
                                                                            height:
                                                                                40.0,
                                                                            textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).bodyMediumFamily),
                                                                                ),
                                                                            icon:
                                                                                Icon(
                                                                              Icons.keyboard_arrow_down_rounded,
                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                              size: 24.0,
                                                                            ),
                                                                            fillColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            elevation:
                                                                                2.0,
                                                                            borderColor:
                                                                                FlutterFlowTheme.of(context).alternate,
                                                                            borderWidth:
                                                                                2.0,
                                                                            borderRadius:
                                                                                8.0,
                                                                            margin: EdgeInsetsDirectional.fromSTEB(
                                                                                16.0,
                                                                                4.0,
                                                                                16.0,
                                                                                4.0),
                                                                            hidesUnderline:
                                                                                true,
                                                                            isOverButton:
                                                                                false,
                                                                            isSearchable:
                                                                                false,
                                                                            isMultiSelect:
                                                                                false,
                                                                          ),
                                                                          StreamBuilder<
                                                                              List<OutletLeadsRecord>>(
                                                                            stream:
                                                                                queryOutletLeadsRecord(
                                                                              parent: FFAppState().outletRef,
                                                                              queryBuilder: (outletLeadsRecord) => outletLeadsRecord.where(
                                                                                'mobile',
                                                                                isEqualTo: widget!.mobile != '' ? widget!.mobile : null,
                                                                              ),
                                                                              singleRecord: true,
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
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      size: 30.0,
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              }
                                                                              List<OutletLeadsRecord> rowOutletLeadsRecordList = snapshot.data!;
                                                                              final rowOutletLeadsRecord = rowOutletLeadsRecordList.isNotEmpty ? rowOutletLeadsRecordList.first : null;

                                                                              return Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FFButtonWidget(
                                                                                    onPressed: () async {
                                                                                      _model.taglist = await actions.leadTagLIst(
                                                                                        FFAppState().tagList.toList(),
                                                                                      );

                                                                                      await container5LeadsManagementRecord!.reference.update({
                                                                                        ...createLeadsManagementRecordData(
                                                                                          username: _model.textFieldunameTextController.text,
                                                                                          businessName: _model.textController3.text,
                                                                                          businessType: _model.dropDownBTypeValue == null || _model.dropDownBTypeValue == ''
                                                                                              ? valueOrDefault<String>(
                                                                                                  '',
                                                                                                  '#',
                                                                                                )
                                                                                              : _model.dropDownBTypeValue,
                                                                                          city: _model.dropDownCityValue,
                                                                                          state: _model.dropDownStateValue,
                                                                                          priority: _model.dropDownPriorityValue,
                                                                                          updatedDate: functions.timestampToMili(getCurrentTimestamp),
                                                                                          status: _model.dropDownValue,
                                                                                          stage: functions.statusForStage(_model.dropDownValue!),
                                                                                          source: _model.dropDownSourceValue,
                                                                                          area: _model.textController2.text,
                                                                                          isDuplicate: _model.checkboxduplicateValue,
                                                                                        ),
                                                                                        ...mapToFirestore(
                                                                                          {
                                                                                            'leadTag': getLeadTagListListFirestoreData(
                                                                                              _model.taglist?.length.toString() == '0' ? container5LeadsManagementRecord?.leadTag : _model.taglist,
                                                                                            ),
                                                                                          },
                                                                                        ),
                                                                                      });
                                                                                      await showDialog(
                                                                                        context: context,
                                                                                        builder: (alertDialogContext) {
                                                                                          return WebViewAware(
                                                                                            child: AlertDialog(
                                                                                              title: Text('Update Successfully...!'),
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

                                                                                      await rowOutletLeadsRecord!.reference.update(createOutletLeadsRecordData(
                                                                                        city: _model.dropDownCityValue == null || _model.dropDownCityValue == '' ? '' : _model.dropDownCityValue,
                                                                                        state: _model.dropDownStateValue,
                                                                                        businessName: _model.textController3.text,
                                                                                        businessType: _model.dropDownBTypeValue == null || _model.dropDownBTypeValue == '' ? '' : _model.dropDownBTypeValue,
                                                                                        priority: _model.dropDownPriorityValue == null || _model.dropDownPriorityValue == '' ? '' : _model.dropDownPriorityValue,
                                                                                        area: _model.textController2.text,
                                                                                        isDuplicate: _model.checkboxduplicateValue,
                                                                                      ));
                                                                                      await Future.delayed(const Duration(milliseconds: 2000));
                                                                                      FFAppState().tagList = [];
                                                                                      safeSetState(() {});

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    text: 'Update',
                                                                                    icon: Icon(
                                                                                      Icons.done,
                                                                                      size: 20.0,
                                                                                    ),
                                                                                    options: FFButtonOptions(
                                                                                      width: 130.0,
                                                                                      height: 40.0,
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                      color: FlutterFlowTheme.of(context).primary,
                                                                                      textStyle: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                            fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                            color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                            fontSize: 16.0,
                                                                                            letterSpacing: 0.0,
                                                                                            fontWeight: FontWeight.w600,
                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                          ),
                                                                                      elevation: 2.0,
                                                                                      borderSide: BorderSide(
                                                                                        color: FlutterFlowTheme.of(context).customColor1,
                                                                                        width: 1.0,
                                                                                      ),
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              );
                                                                            },
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              );
                                                            },
                                                          ),
                                                          Stack(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0.95, 0.0),
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            10.0,
                                                                            0.0,
                                                                            0.0),
                                                                child: StreamBuilder<
                                                                    List<
                                                                        LeadCallLogsRecord>>(
                                                                  stream:
                                                                      queryLeadCallLogsRecord(
                                                                    parent: FFAppState()
                                                                        .outletRef,
                                                                    queryBuilder:
                                                                        (leadCallLogsRecord) =>
                                                                            leadCallLogsRecord.where(
                                                                      'leadMId',
                                                                      isEqualTo: widget!.id !=
                                                                              ''
                                                                          ? widget!
                                                                              .id
                                                                          : null,
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
                                                                    List<LeadCallLogsRecord>
                                                                        listViewLeadCallLogsRecordList =
                                                                        snapshot
                                                                            .data!;
                                                                    if (listViewLeadCallLogsRecordList
                                                                        .isEmpty) {
                                                                      return ListViewMsgWidget();
                                                                    }

                                                                    return ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      scrollDirection:
                                                                          Axis.vertical,
                                                                      itemCount:
                                                                          listViewLeadCallLogsRecordList
                                                                              .length,
                                                                      itemBuilder:
                                                                          (context,
                                                                              listViewIndex) {
                                                                        final listViewLeadCallLogsRecord =
                                                                            listViewLeadCallLogsRecordList[listViewIndex];
                                                                        return Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              0.0,
                                                                              5.0),
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
                                                                                header: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: Container(
                                                                                    width: 100.0,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      borderRadius: BorderRadius.circular(10.0),
                                                                                    ),
                                                                                    child: Padding(
                                                                                      padding: EdgeInsets.all(12.0),
                                                                                      child: Column(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                            children: [
                                                                                              Expanded(
                                                                                                child: Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                      child: Text(
                                                                                                        functions.milisecToTimestamp(listViewLeadCallLogsRecord.date),
                                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                      child: Text(
                                                                                                        functions.dateToTime(listViewLeadCallLogsRecord.time),
                                                                                                        style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleMediumFamily),
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                              Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                    child: Text(
                                                                                                      listViewLeadCallLogsRecord.minute.toString(),
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'min',
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    ':',
                                                                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                        ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      listViewLeadCallLogsRecord.sec.toString(),
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                          ),
                                                                                                    ),
                                                                                                  ),
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                                                                                                    child: Text(
                                                                                                      'sec',
                                                                                                      style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                                          ),
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
                                                                                ),
                                                                                collapsed: Container(),
                                                                                expanded: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 12.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Text(
                                                                                        listViewLeadCallLogsRecord.callNote,
                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: GoogleFonts.asMap().containsKey(FlutterFlowTheme.of(context).titleSmallFamily),
                                                                                            ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                theme: ExpandableThemeData(
                                                                                  tapHeaderToExpand: true,
                                                                                  tapBodyToExpand: false,
                                                                                  tapBodyToCollapse: false,
                                                                                  headerAlignment: ExpandablePanelHeaderAlignment.top,
                                                                                  hasIcon: true,
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
                                                              Stack(
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            25.0),
                                                                        child:
                                                                            FlutterFlowIconButton(
                                                                          borderColor:
                                                                              Colors.transparent,
                                                                          borderRadius:
                                                                              30.0,
                                                                          borderWidth:
                                                                              1.0,
                                                                          buttonSize:
                                                                              60.0,
                                                                          fillColor:
                                                                              FlutterFlowTheme.of(context).tertiary,
                                                                          icon:
                                                                              Icon(
                                                                            Icons.call,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                24.0,
                                                                          ),
                                                                          onPressed:
                                                                              () async {
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
                                                                                        id: widget!.id,
                                                                                        username: widget!.username,
                                                                                        mobile: widget!.mobile,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                );
                                                                              },
                                                                            ).then((value) =>
                                                                                safeSetState(() {}));
                                                                          },
                                                                        ),
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
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
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
        ));
  }
}
