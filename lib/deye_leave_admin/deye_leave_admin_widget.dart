import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/components/deye_leave_remark_widget.dart';
import '/components/deye_subscription_popup_widget.dart';
import '/components/popup_success_copy_widget.dart';
import '/components/popup_warning_widget.dart';
import '/deye_c_r_m/deye_header_h_r/deye_header_h_r_widget.dart';
import '/deye_c_r_m/deye_menu/deye_menu_widget.dart';
import '/deye_c_r_m/deye_no_data/deye_no_data_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
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
import 'deye_leave_admin_model.dart';
export 'deye_leave_admin_model.dart';

class DeyeLeaveAdminWidget extends StatefulWidget {
  const DeyeLeaveAdminWidget({super.key});

  static String routeName = 'DeyeLeaveAdmin';
  static String routePath = 'deyeLeaveAdmin';

  @override
  State<DeyeLeaveAdminWidget> createState() => _DeyeLeaveAdminWidgetState();
}

class _DeyeLeaveAdminWidgetState extends State<DeyeLeaveAdminWidget>
    with TickerProviderStateMixin {
  late DeyeLeaveAdminModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeyeLeaveAdminModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.attendanceDayId = functions.selectedDayId(getCurrentTimestamp);
      _model.selectedDate = getCurrentTimestamp;
      safeSetState(() {});
      _model.moduleDoc = await queryModuleSubscriptionRecordOnce(
        parent: FFAppState().outletRef,
        queryBuilder: (moduleSubscriptionRecord) =>
            moduleSubscriptionRecord.where(
          'name',
          isEqualTo: SubscriptionModules.Attendance.serialize(),
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (functions.subscriptionDays(
              getCurrentTimestamp, _model.moduleDoc?.renewalDate) <=
          30) {
        await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: WebViewAware(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(dialogContext).unfocus();
                    FocusManager.instance.primaryFocus?.unfocus();
                  },
                  child: DeyeSubscriptionPopupWidget(
                    moduleName: SubscriptionModules.Attendance,
                  ),
                ),
              ),
            );
          },
        );
      }
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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

    return Builder(
      builder: (context) => StreamBuilder<List<LeaveApplicationRecord>>(
        stream: queryLeaveApplicationRecord(
          parent: FFAppState().outletRef,
          queryBuilder: (leaveApplicationRecord) =>
              leaveApplicationRecord.where(
            'toDate',
            isGreaterThanOrEqualTo: functions.lastDays(15),
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
          List<LeaveApplicationRecord>
              deyeLeaveAdminLeaveApplicationRecordList = snapshot.data!;

          return Title(
              title: 'DeyeLeaveAdmin',
              color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).unfocus();
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Scaffold(
                  key: scaffoldKey,
                  backgroundColor:
                      FlutterFlowTheme.of(context).primaryBackground,
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
                          model: _model.deyeHeaderHRModel,
                          updateCallback: () => safeSetState(() {}),
                          child: DeyeHeaderHRWidget(),
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
                                .whereArrayContainsAny('zoneList',
                                    FFAppState().currentUserZoneList)
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
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
                                            decoration: BoxDecoration(),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Leave Admin View',
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
                                                Row(
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
                                                                            deyeLeaveAdminLeaveApplicationRecordList.where((e) => (e.fromDate <= functions.getTodayDateInMili(_model.selectedDate!)) && (e.status == 'APPROVED') && (e.toDate == functions.getTodayDateInMili(getCurrentTimestamp))).toList(),
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
                                                                        deyeLeaveAdminLeaveApplicationRecordList
                                                                            .where((e) =>
                                                                                (e.fromDate <= functions.getTodayDateInMili(_model.selectedDate!)) &&
                                                                                (e.status == 'APPROVED') &&
                                                                                (e.toDate == functions.getTodayDateInMili(getCurrentTimestamp)))
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
                                                                            deyeLeaveAdminLeaveApplicationRecordList.where((e) => (e.fromDate <= functions.getTodayDateInMili(_model.selectedDate!)) && (e.status == 'APPROVED') && (e.toDate == functions.getTodayDateInMili(getCurrentTimestamp))).toList(),
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
                                                                    .end,
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
                                                                          FlutterFlowTheme.of(context)
                                                                              .bodyMediumFamily,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .customColor5,
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
                                                              if (false)
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
                                                                    size: 24.0,
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
                                                                          DateTime(
                                                                              1900),
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
                                                                          headerTextStyle: FlutterFlowTheme.of(context)
                                                                              .headlineLarge
                                                                              .override(
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
                                                                          _datePickedDate
                                                                              .year,
                                                                          _datePickedDate
                                                                              .month,
                                                                          _datePickedDate
                                                                              .day,
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
                                                            ].divide(SizedBox(
                                                                width: 5.0)),
                                                          ),
                                                          if (false)
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
                                                                  searchHintTextStyle: FlutterFlowTheme.of(
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
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        fontSize:
                                                                            11.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleMediumIsCustom,
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
                                                                  elevation:
                                                                      2.0,
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
                                                                    safeSetState(
                                                                        () {
                                                                      _model
                                                                          .dropDownSuperAdminValueController
                                                                          ?.reset();
                                                                      _model.dropDownSuperAdminValue =
                                                                          null;
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
                                                                    height:
                                                                        40.0,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              8.0),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: FlutterFlowTheme.of(context)
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
                                                                      child:
                                                                          Icon(
                                                                        Icons
                                                                            .clear_rounded,
                                                                        color: FlutterFlowTheme.of(context)
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
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            Alignment(0.0, 0),
                                                        child: TabBar(
                                                          labelColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .primary,
                                                          unselectedLabelColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .backgroundComponants,
                                                          labelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleMediumIsCustom,
                                                                  ),
                                                          unselectedLabelStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts:
                                                                        !FlutterFlowTheme.of(context)
                                                                            .titleMediumIsCustom,
                                                                  ),
                                                          indicatorColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .customColor5,
                                                          tabs: [
                                                            Tab(
                                                              text:
                                                                  'Requested Leaves',
                                                            ),
                                                            Tab(
                                                              text:
                                                                  'Approved Leaves',
                                                            ),
                                                            Tab(
                                                              text: 'Rejected',
                                                            ),
                                                          ],
                                                          controller: _model
                                                              .tabBarController,
                                                          onTap: (i) async {
                                                            [
                                                              () async {},
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
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .back2nd,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          7.0,
                                                                          10.0,
                                                                          7.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            flex:
                                                                                14,
                                                                            child:
                                                                                Text(
                                                                              'Employee Name',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                7,
                                                                            child:
                                                                                Text(
                                                                              'Leave Type',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                13,
                                                                            child:
                                                                                Text(
                                                                              'Period',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                4,
                                                                            child:
                                                                                Text(
                                                                              'Duration',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                8,
                                                                            child:
                                                                                Text(
                                                                              'Applied on',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                14,
                                                                            child:
                                                                                Text(
                                                                              'Note',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                12,
                                                                            child:
                                                                                Text(
                                                                              'Actions',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final requestedList = functions
                                                                            .getZonewiseLeave(deyeLeaveAdminLeaveApplicationRecordList.where((e) => e.status == 'REQUESTED').toList(),
                                                                                containerTeamTreeRecordList.toList())
                                                                            .sortedList(keyOf: (e) => e.fromDate, desc: true)
                                                                            .toList();
                                                                        if (requestedList
                                                                            .isEmpty) {
                                                                          return Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            child:
                                                                                DeyeNoDataWidget(
                                                                              message: 'No leave request today',
                                                                            ),
                                                                          );
                                                                        }

                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              requestedList.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              SizedBox(height: 5.0),
                                                                          itemBuilder:
                                                                              (context, requestedListIndex) {
                                                                            final requestedListItem =
                                                                                requestedList[requestedListIndex];
                                                                            return Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 10.0, 7.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 14,
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          containerTeamTreeRecordList.where((e) => e.userProfileId == requestedListItem.userProfileId).toList().firstOrNull?.userName,
                                                                                          '-',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 7,
                                                                                      child: Text(
                                                                                        requestedListItem.leaveType,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 13,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '${'${dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(requestedListItem.fromDate))} - ${dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(requestedListItem.toDate))}'}',
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).customColor6,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 4,
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          requestedListItem.noDays.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 8,
                                                                                      child: Text(
                                                                                        dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(requestedListItem.createdDate)),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 14,
                                                                                      child: Text(
                                                                                        requestedListItem.leaveNote,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 12,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                                        children: [
                                                                                          if (false)
                                                                                            FFButtonWidget(
                                                                                              onPressed: () {
                                                                                                print('Button pressed ...');
                                                                                              },
                                                                                              text: 'View',
                                                                                              options: FFButtonOptions(
                                                                                                height: 30.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderSide: BorderSide(
                                                                                                  color: FlutterFlowTheme.of(context).accent1,
                                                                                                  width: 0.5,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          Builder(
                                                                                            builder: (context) => FFButtonWidget(
                                                                                              onPressed: () async {
                                                                                                await requestedListItem.reference.update(createLeaveApplicationRecordData(
                                                                                                  status: 'APPROVED',
                                                                                                  updateddate: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                                  actionTakenBy: FFAppState().currentLoggedInUserId,
                                                                                                ));
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
                                                                                                          child: PopupSuccessCopyWidget(
                                                                                                            title: 'Leave',
                                                                                                            message: 'Leave Approved',
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );
                                                                                              },
                                                                                              text: 'Approve',
                                                                                              options: FFButtonOptions(
                                                                                                height: 30.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: FlutterFlowTheme.of(context).tertiary,
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                          Builder(
                                                                                            builder: (context) => FFButtonWidget(
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
                                                                                                          child: DeyeLeaveRemarkWidget(
                                                                                                            leaveDoc: requestedListItem,
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                );

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
                                                                                                          child: PopupWarningWidget(
                                                                                                            title: 'Are you sure you want to reject?',
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ).then((value) => safeSetState(() => _model.result1 = value));

                                                                                                if (_model.result1!) {
                                                                                                  await requestedListItem.reference.update(createLeaveApplicationRecordData(
                                                                                                    status: 'REJECTED',
                                                                                                    updateddate: getCurrentTimestamp.millisecondsSinceEpoch,
                                                                                                    actionTakenBy: FFAppState().currentLoggedInUserId,
                                                                                                  ));
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
                                                                                                            child: PopupSuccessCopyWidget(
                                                                                                              title: 'Leave',
                                                                                                              message: 'Leave Rejected!',
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  );
                                                                                                }

                                                                                                safeSetState(() {});
                                                                                              },
                                                                                              text: 'Reject',
                                                                                              options: FFButtonOptions(
                                                                                                height: 30.0,
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 8.0, 0.0),
                                                                                                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                color: Color(0xFFFF9CAA),
                                                                                                textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                                elevation: 0.0,
                                                                                                borderRadius: BorderRadius.circular(8.0),
                                                                                              ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 5.0)),
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
                                                                    height:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .back2nd,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          7.0,
                                                                          10.0,
                                                                          7.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            flex:
                                                                                14,
                                                                            child:
                                                                                Text(
                                                                              'Employee Name',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                7,
                                                                            child:
                                                                                Text(
                                                                              'Leave Type',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                13,
                                                                            child:
                                                                                Text(
                                                                              'Period',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                4,
                                                                            child:
                                                                                Text(
                                                                              'Duration',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                8,
                                                                            child:
                                                                                Text(
                                                                              'Applied on',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                12,
                                                                            child:
                                                                                Text(
                                                                              'Note',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                10,
                                                                            child:
                                                                                Text(
                                                                              'Approved By',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final approvedList = functions
                                                                            .getZonewiseLeave(deyeLeaveAdminLeaveApplicationRecordList.where((e) => e.status == 'APPROVED').toList(),
                                                                                containerTeamTreeRecordList.toList())
                                                                            .sortedList(keyOf: (e) => e.fromDate, desc: true)
                                                                            .toList();
                                                                        if (approvedList
                                                                            .isEmpty) {
                                                                          return Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            child:
                                                                                DeyeNoDataWidget(
                                                                              message: 'No leave approved today',
                                                                            ),
                                                                          );
                                                                        }

                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              approvedList.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              SizedBox(height: 5.0),
                                                                          itemBuilder:
                                                                              (context, approvedListIndex) {
                                                                            final approvedListItem =
                                                                                approvedList[approvedListIndex];
                                                                            return Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: Color(0xFFFAEFEF),
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 14,
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          containerTeamTreeRecordList.where((e) => e.userProfileId == approvedListItem.userProfileId).toList().firstOrNull?.userName,
                                                                                          '-',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 7,
                                                                                      child: Text(
                                                                                        approvedListItem.leaveType,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 13,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '${dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(approvedListItem.fromDate))} - ${dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(approvedListItem.toDate))}',
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).customColor6,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 7.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 4,
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          approvedListItem.noDays.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 8,
                                                                                      child: Text(
                                                                                        dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(approvedListItem.createdDate)),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 12,
                                                                                      child: Text(
                                                                                        approvedListItem.leaveNote,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 10,
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          containerTeamTreeRecordList.where((e) => e.userProfileId == approvedListItem.actionTakenBy).toList().firstOrNull?.userName,
                                                                                          '-',
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
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
                                                                    height:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          15.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    width: double
                                                                        .infinity,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .back2nd,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5.0),
                                                                    ),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          10.0,
                                                                          7.0,
                                                                          10.0,
                                                                          7.0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children:
                                                                            [
                                                                          Expanded(
                                                                            flex:
                                                                                12,
                                                                            child:
                                                                                Text(
                                                                              'Employee Name',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                7,
                                                                            child:
                                                                                Text(
                                                                              'Leave Type',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                10,
                                                                            child:
                                                                                Text(
                                                                              'Period',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                4,
                                                                            child:
                                                                                Text(
                                                                              'Duration',
                                                                              textAlign: TextAlign.center,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                8,
                                                                            child:
                                                                                Text(
                                                                              'Applied on',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                12,
                                                                            child:
                                                                                Text(
                                                                              'Note',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                10,
                                                                            child:
                                                                                Text(
                                                                              'Remarks',
                                                                              textAlign: TextAlign.start,
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                          Expanded(
                                                                            flex:
                                                                                5,
                                                                            child:
                                                                                Text(
                                                                              'Rejected By',
                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                    letterSpacing: 0.0,
                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ].divide(SizedBox(width: 10.0)),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Expanded(
                                                                    child:
                                                                        Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final rejectedList = functions
                                                                            .getZonewiseLeave(deyeLeaveAdminLeaveApplicationRecordList.where((e) => e.status == 'REJECTED').toList(),
                                                                                containerTeamTreeRecordList.toList())
                                                                            .sortedList(keyOf: (e) => e.fromDate, desc: true)
                                                                            .toList();
                                                                        if (rejectedList
                                                                            .isEmpty) {
                                                                          return Container(
                                                                            width:
                                                                                double.infinity,
                                                                            height:
                                                                                double.infinity,
                                                                            child:
                                                                                DeyeNoDataWidget(
                                                                              message: 'No leave rejected today',
                                                                            ),
                                                                          );
                                                                        }

                                                                        return ListView
                                                                            .separated(
                                                                          padding:
                                                                              EdgeInsets.zero,
                                                                          shrinkWrap:
                                                                              true,
                                                                          scrollDirection:
                                                                              Axis.vertical,
                                                                          itemCount:
                                                                              rejectedList.length,
                                                                          separatorBuilder: (_, __) =>
                                                                              SizedBox(height: 5.0),
                                                                          itemBuilder:
                                                                              (context, rejectedListIndex) {
                                                                            final rejectedListItem =
                                                                                rejectedList[rejectedListIndex];
                                                                            return Container(
                                                                              width: double.infinity,
                                                                              decoration: BoxDecoration(
                                                                                color: FlutterFlowTheme.of(context).customColor1,
                                                                                borderRadius: BorderRadius.circular(5.0),
                                                                              ),
                                                                              child: Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10.0, 10.0, 10.0, 10.0),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Expanded(
                                                                                      flex: 12,
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          containerTeamTreeRecordList.where((e) => e.userProfileId == rejectedListItem.userProfileId).toList().firstOrNull?.userName,
                                                                                          '-',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              fontWeight: FontWeight.w600,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 7,
                                                                                      child: Text(
                                                                                        rejectedListItem.leaveType,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 10,
                                                                                      child: Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Text(
                                                                                            '${'${dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(rejectedListItem.fromDate))} - ${dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(rejectedListItem.toDate))}'}',
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).customColor6,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 7.0)),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 4,
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          rejectedListItem.noDays.toString(),
                                                                                          '0',
                                                                                        ),
                                                                                        textAlign: TextAlign.center,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 8,
                                                                                      child: Text(
                                                                                        dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(rejectedListItem.createdDate)),
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 12,
                                                                                      child: Text(
                                                                                        rejectedListItem.leaveNote,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 10,
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          rejectedListItem.remark,
                                                                                          '-',
                                                                                        ),
                                                                                        textAlign: TextAlign.start,
                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                    Expanded(
                                                                                      flex: 5,
                                                                                      child: Text(
                                                                                        valueOrDefault<String>(
                                                                                          containerTeamTreeRecordList.where((e) => e.userProfileId == rejectedListItem.actionTakenBy).toList().firstOrNull?.userName,
                                                                                          '-',
                                                                                        ),
                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                              letterSpacing: 0.0,
                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
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
                                                                    height:
                                                                        10.0)),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
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
      ),
    );
  }
}
