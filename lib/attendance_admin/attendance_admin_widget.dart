import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/components/send_email_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/deye_c_r_m/deye_no_data/deye_no_data_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pages/components/c_header/c_header_widget.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'attendance_admin_model.dart';
export 'attendance_admin_model.dart';

class AttendanceAdminWidget extends StatefulWidget {
  const AttendanceAdminWidget({super.key});

  static String routeName = 'AttendanceAdmin';
  static String routePath = 'attendanceAdmin';

  @override
  State<AttendanceAdminWidget> createState() => _AttendanceAdminWidgetState();
}

class _AttendanceAdminWidgetState extends State<AttendanceAdminWidget> {
  late AttendanceAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AttendanceAdminModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.attendanceDayId = functions.selectedDayId(getCurrentTimestamp);
      _model.selectedDate = getCurrentTimestamp;
      _model.selectedUserZoneList =
          FFAppState().currentUserZoneList.toList().cast<String>();
      safeSetState(() {});
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

    return StreamBuilder<List<LeaveApplicationRecord>>(
      stream: queryLeaveApplicationRecord(
        parent: FFAppState().outletRef,
        queryBuilder: (leaveApplicationRecord) => leaveApplicationRecord
            .where(
              'fromDate',
              isLessThanOrEqualTo:
                  functions.getTodayDateInMili(_model.selectedDate!),
            )
            .where(
              'status',
              isEqualTo: 'APPROVED',
            ),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
        List<LeaveApplicationRecord> attendanceAdminLeaveApplicationRecordList =
            snapshot.data!;

        return Title(
            title: 'AttendanceAdmin',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 20.0,
                                      ),
                                      onPressed: () async {
                                        if (scaffoldKey
                                                .currentState!.isDrawerOpen ||
                                            scaffoldKey.currentState!
                                                .isEndDrawerOpen) {
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
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: wrapWithModel(
                        model: _model.cHeaderModel,
                        updateCallback: () => safeSetState(() {}),
                        child: CHeaderWidget(),
                      ),
                    ),
                    Expanded(
                      flex: 35,
                      child: StreamBuilder<List<TeamTreeRecord>>(
                        stream: queryTeamTreeRecord(
                          parent: FFAppState().outletRef,
                          queryBuilder: (teamTreeRecord) => teamTreeRecord
                              .where(
                                'isActive',
                                isEqualTo: true,
                              )
                              .whereArrayContainsAny(
                                  'zoneList', _model.selectedUserZoneList)
                              .where(
                                'onRole',
                                isEqualTo: true,
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
                          List<TeamTreeRecord> containerTeamTreeRecordList =
                              snapshot.data!;

                          return Container(
                            width: double.infinity,
                            height: 100.0,
                            decoration: BoxDecoration(),
                            child: Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child:
                                        StreamBuilder<List<AttendanceRecord>>(
                                      stream: queryAttendanceRecord(
                                        parent: FFAppState().outletRef,
                                        queryBuilder: (attendanceRecord) =>
                                            attendanceRecord.where(
                                          'dayId',
                                          isEqualTo: _model.attendanceDayId,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                size: 30.0,
                                              ),
                                            ),
                                          );
                                        }
                                        List<AttendanceRecord>
                                            containerAttendanceRecordList =
                                            snapshot.data!;

                                        return Container(
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                          ),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 5.0, 0.0, 0.0),
                                                child: Text(
                                                  'Attendance Admin View',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .customColor6,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .titleMediumIsCustom,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        5.0, 0.0, 0.0, 0.0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          width: 200.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFEECB9),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Total Emp',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    containerTeamTreeRecordList
                                                                        .length
                                                                        .toString(),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        fontSize:
                                                                            22.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        lineHeight:
                                                                            1.5,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 200.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFC7FACA),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Present',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions
                                                                        .getZonewise(
                                                                            attendanceAdminLeaveApplicationRecordList.where((e) => e.toDate == functions.getTodayDateInMili(getCurrentTimestamp)).toList(),
                                                                            containerAttendanceRecordList.where((e) => e.checkInTime > 0).toList(),
                                                                            'Attendance',
                                                                            containerTeamTreeRecordList.toList())
                                                                        .toString(),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0xFF069126),
                                                                        fontSize:
                                                                            22.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        lineHeight:
                                                                            1.5,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 200.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFFFDFDF),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Absent',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions.checkAbsentCount(
                                                                        containerTeamTreeRecordList
                                                                            .toList(),
                                                                        containerAttendanceRecordList
                                                                            .where((e) =>
                                                                                e.checkInTime >
                                                                                0)
                                                                            .toList(),
                                                                        attendanceAdminLeaveApplicationRecordList
                                                                            .where((e) =>
                                                                                e.toDate ==
                                                                                functions.getTodayDateInMili(getCurrentTimestamp))
                                                                            .toList()),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0xFFFE0303),
                                                                        fontSize:
                                                                            22.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        lineHeight:
                                                                            1.5,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 200.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xFFCDDDFC),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5.0),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    20.0),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Text(
                                                                  'Leave',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .labelLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).labelLargeFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                      ),
                                                                ),
                                                                Text(
                                                                  valueOrDefault<
                                                                      String>(
                                                                    functions
                                                                        .getZonewise(
                                                                            attendanceAdminLeaveApplicationRecordList.where((e) => e.toDate == functions.getTodayDateInMili(getCurrentTimestamp)).toList(),
                                                                            containerAttendanceRecordList.where((e) => e.checkInTime > 0).toList(),
                                                                            'Leave',
                                                                            containerTeamTreeRecordList.toList())
                                                                        .toString(),
                                                                    '0',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                        color: Color(
                                                                            0xFF2D68DA),
                                                                        fontSize:
                                                                            22.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        lineHeight:
                                                                            1.5,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                      ),
                                                                ),
                                                              ].divide(SizedBox(
                                                                  height: 5.0)),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(SizedBox(
                                                          width: 20.0)),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Text(
                                                                    dateTimeFormat(
                                                                        "MMMMEEEEd",
                                                                        _model
                                                                            .selectedDate),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor5,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.w600,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                        ),
                                                                  ),
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        30.0,
                                                                    buttonSize:
                                                                        40.0,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .calendar_month,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .info,
                                                                      size:
                                                                          24.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      final _datePickedDate =
                                                                          await showDatePicker(
                                                                        context:
                                                                            context,
                                                                        initialDate:
                                                                            getCurrentTimestamp,
                                                                        firstDate:
                                                                            DateTime(1900),
                                                                        lastDate:
                                                                            getCurrentTimestamp,
                                                                        builder:
                                                                            (context,
                                                                                child) {
                                                                          return wrapInMaterialDatePickerTheme(
                                                                            context,
                                                                            child!,
                                                                            headerBackgroundColor:
                                                                                FlutterFlowTheme.of(context).primary,
                                                                            headerForegroundColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            headerTextStyle: FlutterFlowTheme.of(context).headlineLarge.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineLargeFamily,
                                                                                  fontSize: 32.0,
                                                                                  letterSpacing: 0.0,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                                                                                ),
                                                                            pickerBackgroundColor:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            pickerForegroundColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            selectedDateTimeBackgroundColor:
                                                                                FlutterFlowTheme.of(context).primaryBackground,
                                                                            selectedDateTimeForegroundColor:
                                                                                FlutterFlowTheme.of(context).info,
                                                                            actionButtonForegroundColor:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            iconSize:
                                                                                24.0,
                                                                          );
                                                                        },
                                                                      );

                                                                      if (_datePickedDate !=
                                                                          null) {
                                                                        safeSetState(
                                                                            () {
                                                                          _model.datePicked =
                                                                              DateTime(
                                                                            _datePickedDate.year,
                                                                            _datePickedDate.month,
                                                                            _datePickedDate.day,
                                                                          );
                                                                        });
                                                                      } else if (_model
                                                                              .datePicked !=
                                                                          null) {
                                                                        safeSetState(
                                                                            () {
                                                                          _model.datePicked =
                                                                              getCurrentTimestamp;
                                                                        });
                                                                      }
                                                                      _model.attendanceDayId =
                                                                          functions
                                                                              .selectedDayId(_model.datePicked!);
                                                                      _model.selectedDate =
                                                                          _model
                                                                              .datePicked;
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                width: 150.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEAF8EC),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) =>
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
                                                                      _model.allAttendenceCurrent =
                                                                          await queryAttendanceRecordOnce(
                                                                        parent:
                                                                            FFAppState().outletRef,
                                                                        queryBuilder:
                                                                            (attendanceRecord) =>
                                                                                attendanceRecord.where(
                                                                          'monthId',
                                                                          isEqualTo:
                                                                              functions.getMonthFormatDayId('month'),
                                                                        ),
                                                                      );
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
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: SendEmailWidget(),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );

                                                                      _model.base64Link232Current =
                                                                          await actions
                                                                              .downloadAttendence(
                                                                        _model
                                                                            .allAttendenceCurrent!
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .outletRef!
                                                                            .id,
                                                                      );
                                                                      _model.apiResult88gCurrent =
                                                                          await SendMailCall
                                                                              .call(
                                                                        mobileNo:
                                                                            FFAppState().currentMobile,
                                                                        outletName:
                                                                            '',
                                                                        file: _model
                                                                            .base64Link232Current,
                                                                        fileName:
                                                                            'AttendanceReport',
                                                                        toEmail:
                                                                            FFAppState().emailForReport,
                                                                        branchName:
                                                                            '',
                                                                        username: valueOrDefault(
                                                                            currentUserDocument?.name,
                                                                            ''),
                                                                        reportType:
                                                                            'Attendance Report',
                                                                        roll: FFAppState()
                                                                            .currentUserRole,
                                                                      );

                                                                      if ((_model
                                                                              .apiResult88gCurrent
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                content: Text('Email Sent Successfully. Wait 5-8 Minutes..'),
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
                                                                              child: AlertDialog(
                                                                                content: Text('Email Not Sent ! Try Again'),
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
                                                                    child: Text(
                                                                      'Current Month',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor5,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 150.0,
                                                                height: 20.0,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFEAF8EC),
                                                                ),
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.0,
                                                                        0.0),
                                                                child: Builder(
                                                                  builder:
                                                                      (context) =>
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
                                                                      _model.allAttendenceLast =
                                                                          await queryAttendanceRecordOnce(
                                                                        parent:
                                                                            FFAppState().outletRef,
                                                                        queryBuilder:
                                                                            (attendanceRecord) =>
                                                                                attendanceRecord.where(
                                                                          'monthId',
                                                                          isEqualTo:
                                                                              functions.getCustmMonthId(getCurrentTimestamp),
                                                                        ),
                                                                      );
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
                                                                              child: GestureDetector(
                                                                                onTap: () {
                                                                                  FocusScope.of(dialogContext).unfocus();
                                                                                  FocusManager.instance.primaryFocus?.unfocus();
                                                                                },
                                                                                child: SendEmailWidget(),
                                                                              ),
                                                                            ),
                                                                          );
                                                                        },
                                                                      );

                                                                      _model.base64Link232Last =
                                                                          await actions
                                                                              .downloadAttendence(
                                                                        _model
                                                                            .allAttendenceLast!
                                                                            .toList(),
                                                                        FFAppState()
                                                                            .outletRef!
                                                                            .id,
                                                                      );
                                                                      _model.apiResult88gLast =
                                                                          await SendMailCall
                                                                              .call(
                                                                        mobileNo:
                                                                            FFAppState().currentMobile,
                                                                        outletName:
                                                                            '',
                                                                        file: _model
                                                                            .base64Link232Last,
                                                                        fileName:
                                                                            'AttendanceReport',
                                                                        toEmail:
                                                                            FFAppState().emailForReport,
                                                                        branchName:
                                                                            '',
                                                                        username: valueOrDefault(
                                                                            currentUserDocument?.name,
                                                                            ''),
                                                                        reportType:
                                                                            'Attendance Report',
                                                                        roll: FFAppState()
                                                                            .currentUserRole,
                                                                      );

                                                                      if ((_model
                                                                              .apiResult88gLast
                                                                              ?.succeeded ??
                                                                          true)) {
                                                                        await showDialog(
                                                                          context:
                                                                              context,
                                                                          builder:
                                                                              (alertDialogContext) {
                                                                            return WebViewAware(
                                                                              child: AlertDialog(
                                                                                content: Text('Email Sent Successfully. Wait 5-8 Minutes..'),
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
                                                                              child: AlertDialog(
                                                                                content: Text('Email Not Sent ! Try Again'),
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
                                                                    child: Text(
                                                                      'Last Month',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor5,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Builder(
                                                                builder:
                                                                    (context) =>
                                                                        InkWell(
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
                                                                                GestureDetector(
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

                                                                    _model.allAttendence1 =
                                                                        await queryAttendanceRecordOnce(
                                                                      parent: FFAppState()
                                                                          .outletRef,
                                                                      queryBuilder: (attendanceRecord) => attendanceRecord
                                                                          .where(
                                                                            'createdDate',
                                                                            isGreaterThanOrEqualTo: functions.geStartEndDateTimeFromMilisec(
                                                                                FFAppState().startDate,
                                                                                FFAppState().endDateForAtt!.millisecondsSinceEpoch,
                                                                                'start'),
                                                                          )
                                                                          .where(
                                                                            'createdDate',
                                                                            isLessThan: functions.geStartEndDateTimeFromMilisec(
                                                                                FFAppState().startDate,
                                                                                FFAppState().endDateForAtt!.millisecondsSinceEpoch,
                                                                                'end'),
                                                                          ),
                                                                    );
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
                                                                                GestureDetector(
                                                                              onTap: () {
                                                                                FocusScope.of(dialogContext).unfocus();
                                                                                FocusManager.instance.primaryFocus?.unfocus();
                                                                              },
                                                                              child: SendEmailWidget(),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
                                                                    );

                                                                    _model.base64Link2321 =
                                                                        await actions
                                                                            .downloadAttendence(
                                                                      _model
                                                                          .allAttendence1!
                                                                          .toList(),
                                                                      FFAppState()
                                                                          .outletRef!
                                                                          .id,
                                                                    );
                                                                    _model.apiResult88g1 =
                                                                        await SendMailCall
                                                                            .call(
                                                                      mobileNo:
                                                                          FFAppState()
                                                                              .currentMobile,
                                                                      outletName:
                                                                          '',
                                                                      file: _model
                                                                          .base64Link2321,
                                                                      fileName:
                                                                          'AttendanceReport',
                                                                      toEmail:
                                                                          FFAppState()
                                                                              .emailForReport,
                                                                      branchName:
                                                                          '',
                                                                      username: valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.name,
                                                                          ''),
                                                                      reportType:
                                                                          'Attendance Report',
                                                                      roll: FFAppState()
                                                                          .currentUserRole,
                                                                    );

                                                                    if ((_model
                                                                            .apiResult88g1
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
                                                                              content: Text('Email Sent Successfully. Wait 5-8 Minutes..'),
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
                                                                              content: Text('Email Not Sent ! Try Again'),
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
                                                                    size: 25.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            children: [
                                                              FlutterFlowDropDown<
                                                                  String>(
                                                                multiSelectController: _model
                                                                        .dropDownSuperAdminValueController ??=
                                                                    FormListFieldController<
                                                                            String>(
                                                                        null),
                                                                options:
                                                                    FFAppConstants
                                                                        .DefualtZones,
                                                                width: MediaQuery.sizeOf(
                                                                            context)
                                                                        .width *
                                                                    0.2,
                                                                height: 40.0,
                                                                searchHintTextStyle:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .titleMedium
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).titleMediumFamily,
                                                                          fontSize:
                                                                              11.0,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).titleMediumIsCustom,
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
                                                                textStyle: FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily,
                                                                      fontSize:
                                                                          11.0,
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      useGoogleFonts:
                                                                          !FlutterFlowTheme.of(context)
                                                                              .titleMediumIsCustom,
                                                                    ),
                                                                hintText:
                                                                    'Select Zone',
                                                                searchHintText:
                                                                    'Select Executive',
                                                                icon: Icon(
                                                                  Icons
                                                                      .place_outlined,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  size: 24.0,
                                                                ),
                                                                fillColor: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                elevation: 2.0,
                                                                borderColor:
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .customColor1,
                                                                borderWidth:
                                                                    1.0,
                                                                borderRadius:
                                                                    8.0,
                                                                margin: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        16.0,
                                                                        4.0,
                                                                        16.0,
                                                                        4.0),
                                                                hidesUnderline:
                                                                    true,
                                                                isOverButton:
                                                                    false,
                                                                isSearchable:
                                                                    true,
                                                                isMultiSelect:
                                                                    true,
                                                                onMultiSelectChanged:
                                                                    (val) async {
                                                                  safeSetState(() =>
                                                                      _model.dropDownSuperAdminValue =
                                                                          val);
                                                                  _model.selectedUserZoneList = _model
                                                                      .dropDownSuperAdminValue!
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                              ),
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
                                                                  safeSetState(
                                                                      () {
                                                                    _model
                                                                        .dropDownSuperAdminValueController
                                                                        ?.reset();
                                                                  });
                                                                  _model.selectedUserZoneList = FFAppState()
                                                                      .currentUserZoneList
                                                                      .toList()
                                                                      .cast<
                                                                          String>();
                                                                  safeSetState(
                                                                      () {});
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 40.0,
                                                                  height: 40.0,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            8.0),
                                                                    border:
                                                                        Border
                                                                            .all(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      width:
                                                                          0.5,
                                                                    ),
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding:
                                                                        EdgeInsets.all(
                                                                            5.0),
                                                                    child: Icon(
                                                                      Icons
                                                                          .clear_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primary,
                                                                      size:
                                                                          20.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 20.0)),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 15.0)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                      flex: 4,
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
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Container(
                                                              width: double
                                                                  .infinity,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: Color(
                                                                    0xFFEAF8EC),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5.0),
                                                              ),
                                                              child: Padding(
                                                                padding: EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        20.0,
                                                                        7.0,
                                                                        20.0,
                                                                        7.0),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'Attendees',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .labelSmall
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).labelSmallFamily,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).customColor6,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final presentList = functions
                                                                    .getZonewiseAtt(
                                                                        containerAttendanceRecordList
                                                                            .where((e) =>
                                                                                e.checkInTime >
                                                                                0)
                                                                            .toList()
                                                                            .sortedList(
                                                                                keyOf: (e) => e.checkInTime,
                                                                                desc: true)
                                                                            .toList(),
                                                                        containerTeamTreeRecordList.toList())
                                                                    .toList();
                                                                if (presentList
                                                                    .isEmpty) {
                                                                  return Container(
                                                                    width: double
                                                                        .infinity,
                                                                    height: double
                                                                        .infinity,
                                                                    child:
                                                                        DeyeNoDataWidget(
                                                                      message:
                                                                          'No check- in today',
                                                                    ),
                                                                  );
                                                                }

                                                                return GridView
                                                                    .builder(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  gridDelegate:
                                                                      SliverGridDelegateWithFixedCrossAxisCount(
                                                                    crossAxisCount:
                                                                        4,
                                                                    crossAxisSpacing:
                                                                        10.0,
                                                                    mainAxisSpacing:
                                                                        12.0,
                                                                    childAspectRatio:
                                                                        1.1,
                                                                  ),
                                                                  shrinkWrap:
                                                                      true,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      presentList
                                                                          .length,
                                                                  itemBuilder:
                                                                      (context,
                                                                          presentListIndex) {
                                                                    final presentListItem =
                                                                        presentList[
                                                                            presentListIndex];
                                                                    return Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          5.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                                      child:
                                                                          Container(
                                                                        width:
                                                                            100.0,
                                                                        height:
                                                                            100.0,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          borderRadius:
                                                                              BorderRadius.circular(5.0),
                                                                          border:
                                                                              Border.all(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).success,
                                                                            width:
                                                                                0.5,
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding:
                                                                              EdgeInsets.all(7.0),
                                                                          child:
                                                                              Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.spaceEvenly,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children:
                                                                                [
                                                                              Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  FlutterFlowIconButton(
                                                                                    borderColor: Colors.transparent,
                                                                                    borderRadius: 8.0,
                                                                                    borderWidth: 1.0,
                                                                                    buttonSize: 30.0,
                                                                                    fillColor: FlutterFlowTheme.of(context).customColor5,
                                                                                    icon: Icon(
                                                                                      Icons.person,
                                                                                      color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                      size: 14.0,
                                                                                    ),
                                                                                    onPressed: () {
                                                                                      print('IconButton pressed ...');
                                                                                    },
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: StreamBuilder<List<UserProfileRecord>>(
                                                                                      stream: queryUserProfileRecord(
                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                          'id',
                                                                                          isEqualTo: presentListItem.userId,
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
                                                                                            containerTeamTreeRecordList.where((e) => e.userProfileId == presentListItem.userId).toList().firstOrNull?.userName,
                                                                                            '-',
                                                                                          ),
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                letterSpacing: 1.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                              ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.done_outline_rounded,
                                                                                    color: FlutterFlowTheme.of(context).success,
                                                                                    size: 20.0,
                                                                                  ),
                                                                                ].divide(SizedBox(width: 10.0)),
                                                                              ),
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                        borderRadius: BorderRadius.circular(10.0),
                                                                                        border: Border.all(
                                                                                          color: FlutterFlowTheme.of(context).customColor1,
                                                                                          width: 1.0,
                                                                                        ),
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(5.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Text(
                                                                                              'Check in',
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    color: FlutterFlowTheme.of(context).info,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Align(
                                                                                                  alignment: AlignmentDirectional(1.0, 1.0),
                                                                                                  child: Text(
                                                                                                    'Time : ',
                                                                                                    style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                          color: FlutterFlowTheme.of(context).primaryText,
                                                                                                          fontSize: 13.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          lineHeight: 1.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ),
                                                                                                Text(
                                                                                                  valueOrDefault<String>(
                                                                                                    functions.attendanceTime(presentListItem.checkInTime),
                                                                                                    '0',
                                                                                                  ),
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 13.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        lineHeight: 1.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Place : ',
                                                                                                  style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                                        fontSize: 13.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        fontWeight: FontWeight.w600,
                                                                                                        lineHeight: 1.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                Expanded(
                                                                                                  child: Column(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                    children: [
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          presentListItem.checkInLocationDetails.street,
                                                                                                          '-',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 13.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              lineHeight: 1.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                      Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          presentListItem.checkInLocationDetails.subLocality,
                                                                                                          '-',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                                                              fontSize: 13.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ].divide(SizedBox(height: 3.0)),
                                                                                                  ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ].divide(SizedBox(height: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                  Expanded(
                                                                                    child: Container(
                                                                                      height: 100.0,
                                                                                      child: Stack(
                                                                                        children: [
                                                                                          if (presentListItem.checkOutTime > 0)
                                                                                            Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).customColor1,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(5.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Check out',
                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Time : ',
                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 13.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                lineHeight: 1.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            functions.attendanceTime(presentListItem.checkOutTime),
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                fontSize: 13.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                lineHeight: 1.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                    Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Text(
                                                                                                          'Place : ',
                                                                                                          style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                fontSize: 13.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                lineHeight: 1.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                              ),
                                                                                                        ),
                                                                                                        Expanded(
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  presentListItem.checkOutLocationDetails.street,
                                                                                                                  '-',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      lineHeight: 1.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              Text(
                                                                                                                valueOrDefault<String>(
                                                                                                                  presentListItem.checkOutLocationDetails.subLocality,
                                                                                                                  '-',
                                                                                                                ),
                                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                            ].divide(SizedBox(height: 3.0)),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 5.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                          if (presentListItem.checkOutTime == 0)
                                                                                            Container(
                                                                                              decoration: BoxDecoration(
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                borderRadius: BorderRadius.circular(10.0),
                                                                                                border: Border.all(
                                                                                                  color: FlutterFlowTheme.of(context).customColor1,
                                                                                                  width: 1.0,
                                                                                                ),
                                                                                              ),
                                                                                              child: Padding(
                                                                                                padding: EdgeInsets.all(5.0),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Check out',
                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                            color: FlutterFlowTheme.of(context).info,
                                                                                                            letterSpacing: 0.0,
                                                                                                            fontWeight: FontWeight.w600,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                                                                                                      child: Row(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Text(
                                                                                                            'Check-out is yet to be logged ',
                                                                                                            style: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                  color: FlutterFlowTheme.of(context).primaryText,
                                                                                                                  fontSize: 13.0,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  lineHeight: 1.0,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                                ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ),
                                                                                                  ].divide(SizedBox(height: 5.0)),
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ].divide(SizedBox(height: 5.0)),
                                                                              ),
                                                                            ].divide(SizedBox(height: 4.0)),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xFFFAEFEF),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(7.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Text(
                                                                    'Absent',
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .labelSmall
                                                                        .override(
                                                                          fontFamily:
                                                                              FlutterFlowTheme.of(context).labelSmallFamily,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primary,
                                                                          letterSpacing:
                                                                              0.0,
                                                                          useGoogleFonts:
                                                                              !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                        ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final absentList = functions
                                                                    .returnAbsentUserList(
                                                                        containerTeamTreeRecordList
                                                                            .toList(),
                                                                        containerAttendanceRecordList
                                                                            .toList())
                                                                    .toList();

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
                                                                      absentList
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          height:
                                                                              12.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          absentListIndex) {
                                                                    final absentListItem =
                                                                        absentList[
                                                                            absentListIndex];
                                                                    return Container(
                                                                      width:
                                                                          100.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).customColor4,
                                                                          width:
                                                                              0.5,
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
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.start,
                                                                          children:
                                                                              [
                                                                            FlutterFlowIconButton(
                                                                              borderColor: Colors.transparent,
                                                                              borderRadius: 8.0,
                                                                              borderWidth: 1.0,
                                                                              buttonSize: 30.0,
                                                                              fillColor: FlutterFlowTheme.of(context).customColor3,
                                                                              icon: Icon(
                                                                                Icons.person,
                                                                                color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                                size: 14.0,
                                                                              ),
                                                                              onPressed: () {
                                                                                print('IconButton pressed ...');
                                                                              },
                                                                            ),
                                                                            InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {},
                                                                              child: Text(
                                                                                absentListItem.userName,
                                                                                style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                      fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                      letterSpacing: 1.0,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                    ),
                                                                              ),
                                                                            ),
                                                                          ].divide(SizedBox(width: 10.0)),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ].divide(SizedBox(
                                                            height: 10.0)),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 35.0)),
                                                ),
                                              ),
                                            ].divide(SizedBox(height: 25.0)),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(SizedBox(height: 25.0)),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
