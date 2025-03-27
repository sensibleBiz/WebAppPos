import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_radio_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'schedule_model.dart';
export 'schedule_model.dart';

class ScheduleWidget extends StatefulWidget {
  const ScheduleWidget({
    super.key,
    this.leadMRefid,
    this.username,
    this.mobile,
  });

  final String? leadMRefid;
  final String? username;
  final String? mobile;

  @override
  State<ScheduleWidget> createState() => _ScheduleWidgetState();
}

class _ScheduleWidgetState extends State<ScheduleWidget> {
  late ScheduleModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ScheduleModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().mode = false;
      safeSetState(() {});
    });

    _model.textFieldUsernameTextController ??=
        TextEditingController(text: widget!.username);
    _model.textFieldUsernameFocusNode ??= FocusNode();

    _model.textFieldDecsTextController ??= TextEditingController();
    _model.textFieldDecsFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Container(
            width: 400.0,
            height: 590.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).back2nd,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(0.0),
                bottomRight: Radius.circular(0.0),
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
              border: Border.all(
                color: FlutterFlowTheme.of(context).customColor1,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Text(
                      'Schedule Activity',
                      style:
                          FlutterFlowTheme.of(context).headlineLarge.override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineLargeFamily),
                              ),
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: FlutterFlowDropDown<String>(
                            controller: _model.typeDropdownValueController ??=
                                FormFieldController<String>(null),
                            options: [
                              'Demo',
                              'Follow Up',
                              'Instalation',
                              'Visit',
                              'ServiceCall'
                            ],
                            onChanged: (val) async {
                              safeSetState(
                                  () => _model.typeDropdownValue = val);
                              if (_model.typeDropdownValue == 'Demo') {
                                FFAppState().mode = true;
                                safeSetState(() {});
                              } else {
                                FFAppState().mode = false;
                                safeSetState(() {});
                              }
                            },
                            width: double.infinity,
                            height: 45.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelLargeFamily),
                                ),
                            hintText: 'Select Type',
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 21.0,
                            ),
                            fillColor: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            elevation: 2.0,
                            borderColor:
                                FlutterFlowTheme.of(context).customColor1,
                            borderWidth: 0.0,
                            borderRadius: 5.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 0.0, 3.0),
                    child: Text(
                      'Mode',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  if (FFAppState().mode)
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (FFAppState().mode)
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              height: 45.0,
                              decoration: BoxDecoration(),
                              child: Visibility(
                                visible: FFAppState().mode,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child:
                                                              FlutterFlowRadioButton(
                                                            options: [
                                                              'Online',
                                                              'Offline'
                                                            ].toList(),
                                                            onChanged: (val) =>
                                                                safeSetState(
                                                                    () {}),
                                                            controller: _model
                                                                    .radioButton1ValueController ??=
                                                                FormFieldController<
                                                                        String>(
                                                                    'Offline'),
                                                            optionHeight: 32.0,
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
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).labelMediumFamily),
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
                                                                      useGoogleFonts: GoogleFonts
                                                                              .asMap()
                                                                          .containsKey(
                                                                              FlutterFlowTheme.of(context).bodyMediumFamily),
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
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
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
                      ],
                    ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2.0, 2.0, 0.0, 3.0),
                    child: Text(
                      ' Date & Time',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodyMediumFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context).bodyMediumFamily),
                          ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(1.0, 0.0, 1.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: FFButtonWidget(
                              onPressed: () async {
                                final _datePickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: getCurrentTimestamp,
                                  firstDate: getCurrentTimestamp,
                                  lastDate: DateTime(2050),
                                );

                                TimeOfDay? _datePickedTime;
                                if (_datePickedDate != null) {
                                  _datePickedTime = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.fromDateTime(
                                        getCurrentTimestamp),
                                  );
                                }

                                if (_datePickedDate != null &&
                                    _datePickedTime != null) {
                                  safeSetState(() {
                                    _model.datePicked = DateTime(
                                      _datePickedDate.year,
                                      _datePickedDate.month,
                                      _datePickedDate.day,
                                      _datePickedTime!.hour,
                                      _datePickedTime.minute,
                                    );
                                  });
                                } else if (_model.datePicked != null) {
                                  safeSetState(() {
                                    _model.datePicked = getCurrentTimestamp;
                                  });
                                }
                              },
                              text: 'Select  Date & Time',
                              icon: Icon(
                                Icons.calendar_today,
                                size: 20.0,
                              ),
                              options: FFButtonOptions(
                                width: 120.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: FlutterFlowTheme.of(context).text2nd,
                                textStyle: FlutterFlowTheme.of(context)
                                    .headlineSmall
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .headlineSmallFamily,
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .headlineSmallFamily),
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
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 0.0),
                        child: Text(
                          ' Date',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dateTimeFormat("d/M/y", _model.datePicked),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelLargeFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily),
                                      lineHeight: 2.0,
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
                    children: [
                      Text(
                        ' Time',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily:
                                  FlutterFlowTheme.of(context).bodyMediumFamily,
                              letterSpacing: 0.0,
                              useGoogleFonts: GoogleFonts.asMap().containsKey(
                                  FlutterFlowTheme.of(context)
                                      .bodyMediumFamily),
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 30.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4.0,
                                color: Color(0x33000000),
                                offset: Offset(
                                  0.0,
                                  2.0,
                                ),
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                dateTimeFormat("jm", _model.datePicked),
                                textAlign: TextAlign.center,
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelLargeFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily),
                                      lineHeight: 1.0,
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
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                        child: Text(
                          'Lead Name',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 40.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: TextFormField(
                            controller: _model.textFieldUsernameTextController,
                            focusNode: _model.textFieldUsernameFocusNode,
                            autofocus: false,
                            readOnly: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle: FlutterFlowTheme.of(context)
                                  .bodySmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodySmallFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodySmallFamily),
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color:
                                      FlutterFlowTheme.of(context).customColor1,
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 0.5,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelLargeFamily),
                                ),
                            validator: _model
                                .textFieldUsernameTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                        child: Text(
                          'Lead Priority',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: FlutterFlowDropDown<String>(
                            controller:
                                _model.priorityDropDownValueController ??=
                                    FormFieldController<String>(null),
                            options: ['cold', 'warm', 'hot', 'interested'],
                            onChanged: (val) => safeSetState(
                                () => _model.priorityDropDownValue = val),
                            width: double.infinity,
                            height: 45.0,
                            textStyle: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .labelLargeFamily),
                                ),
                            hintText: 'Select Priority',
                            icon: Icon(
                              Icons.keyboard_arrow_down,
                              size: 21.0,
                            ),
                            elevation: 2.0,
                            borderColor:
                                FlutterFlowTheme.of(context).customColor1,
                            borderWidth: 0.0,
                            borderRadius: 5.0,
                            margin: EdgeInsetsDirectional.fromSTEB(
                                12.0, 4.0, 12.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 3.0),
                        child: Text(
                          'Assigned to',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 45.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                          ),
                          child: StreamBuilder<List<UserProfileRecord>>(
                            stream: queryUserProfileRecord(
                              queryBuilder: (userProfileRecord) =>
                                  userProfileRecord.where(
                                'outletId',
                                isEqualTo: FFAppState().outletId != ''
                                    ? FFAppState().outletId
                                    : null,
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
                                          FlutterFlowTheme.of(context).primary,
                                      size: 30.0,
                                    ),
                                  ),
                                );
                              }
                              List<UserProfileRecord>
                                  userDropDownUserProfileRecordList =
                                  snapshot.data!;

                              return FlutterFlowDropDown<String>(
                                controller:
                                    _model.userDropDownValueController ??=
                                        FormFieldController<String>(null),
                                options: userDropDownUserProfileRecordList
                                    .where((e) => e.permissionList
                                        .where((e) =>
                                            (e.title == 'Leads') &&
                                            (e.value != 0))
                                        .toList()
                                        .isNotEmpty)
                                    .toList()
                                    .map((e) => e.name)
                                    .toList(),
                                onChanged: (val) => safeSetState(
                                    () => _model.userDropDownValue = val),
                                width: double.infinity,
                                height: 45.0,
                                textStyle: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: FlutterFlowTheme.of(context)
                                          .labelLargeFamily,
                                      letterSpacing: 0.0,
                                      useGoogleFonts: GoogleFonts.asMap()
                                          .containsKey(
                                              FlutterFlowTheme.of(context)
                                                  .labelLargeFamily),
                                    ),
                                hintText: 'Select Executive',
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  size: 21.0,
                                ),
                                elevation: 2.0,
                                borderColor:
                                    FlutterFlowTheme.of(context).customColor1,
                                borderWidth: 0.0,
                                borderRadius: 5.0,
                                margin: EdgeInsetsDirectional.fromSTEB(
                                    12.0, 4.0, 12.0, 4.0),
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 0.0, 3.0),
                        child: Text(
                          'Description',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _model.textFieldDecsTextController,
                          focusNode: _model.textFieldDecsFocusNode,
                          autofocus: false,
                          obscureText: false,
                          decoration: InputDecoration(
                            hintStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .bodySmallFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .bodySmallFamily),
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color:
                                    FlutterFlowTheme.of(context).customColor1,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .bodyMediumFamily),
                              ),
                          maxLines: 2,
                          validator: _model.textFieldDecsTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: StreamBuilder<List<UserProfileRecord>>(
                      stream: queryUserProfileRecord(
                        queryBuilder: (userProfileRecord) =>
                            userProfileRecord.where(
                          'name',
                          isEqualTo: _model.userDropDownValue != ''
                              ? _model.userDropDownValue
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
                        List<UserProfileRecord> rowUserProfileRecordList =
                            snapshot.data!;
                        final rowUserProfileRecord =
                            rowUserProfileRecordList.isNotEmpty
                                ? rowUserProfileRecordList.first
                                : null;

                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: FFButtonWidget(
                                onPressed: () async {
                                  Navigator.pop(context);
                                },
                                text: 'Cancel',
                                options: FFButtonOptions(
                                  width: 130.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).text2nd,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
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
                            StreamBuilder<List<LeadsManagementRecord>>(
                              stream: queryLeadsManagementRecord(
                                parent: FFAppState().outletRef,
                                queryBuilder: (leadsManagementRecord) =>
                                    leadsManagementRecord.where(
                                  'id',
                                  isEqualTo: widget!.leadMRefid != ''
                                      ? widget!.leadMRefid
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
                                        color: FlutterFlowTheme.of(context)
                                            .primary,
                                        size: 30.0,
                                      ),
                                    ),
                                  );
                                }
                                List<LeadsManagementRecord>
                                    buttonLeadsManagementRecordList =
                                    snapshot.data!;
                                final buttonLeadsManagementRecord =
                                    buttonLeadsManagementRecordList.isNotEmpty
                                        ? buttonLeadsManagementRecordList.first
                                        : null;

                                return FFButtonWidget(
                                  onPressed: () async {
                                    var _shouldSetState = false;
                                    if (_model.datePicked != null) {
                                      if (_model.userDropDownValue == null ||
                                          _model.userDropDownValue == '') {
                                        await showDialog(
                                          context: context,
                                          builder: (alertDialogContext) {
                                            return WebViewAware(
                                              child: AlertDialog(
                                                title: Text(
                                                    'Some fields are mising!'),
                                                content: Text(
                                                    'Plz add assigned to '),
                                                actions: [
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            alertDialogContext),
                                                    child: Text('Ok'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        await buttonLeadsManagementRecord!
                                            .reference
                                            .update(
                                                createLeadsManagementRecordData(
                                          status: valueOrDefault<String>(
                                            () {
                                              if (_model.typeDropdownValue ==
                                                  'Demo') {
                                                return 'DEMO SCHEDULED';
                                              } else if (_model
                                                      .typeDropdownValue ==
                                                  'Follow Up') {
                                                return 'FOLLOWUP';
                                              } else if (_model
                                                      .typeDropdownValue ==
                                                  'ServiceCall') {
                                                return 'DEMO SCHEDULED';
                                              } else {
                                                return 'INSTALLATION';
                                              }
                                            }(),
                                            '0',
                                          ),
                                          stage: valueOrDefault<String>(
                                            () {
                                              if (_model.typeDropdownValue ==
                                                  'Demo') {
                                                return 'assigned';
                                              } else if (_model
                                                      .typeDropdownValue ==
                                                  'Follow Up') {
                                                return 'followup';
                                              } else {
                                                return 'completed';
                                              }
                                            }(),
                                            '0',
                                          ),
                                        ));

                                        var leadActivitiesRecordReference =
                                            LeadActivitiesRecord.createDoc(
                                                FFAppState().outletRef!);
                                        await leadActivitiesRecordReference
                                            .set(createLeadActivitiesRecordData(
                                          assignedTo: rowUserProfileRecord?.id,
                                          scheduledDate: _model.datePicked
                                              ?.millisecondsSinceEpoch,
                                          scheduledTime: _model.datePicked
                                              ?.millisecondsSinceEpoch,
                                          leadName: buttonLeadsManagementRecord
                                              ?.username,
                                          description: _model
                                              .textFieldDecsTextController.text,
                                          leadRefId:
                                              buttonLeadsManagementRecord?.id,
                                          createdDate: getCurrentTimestamp,
                                          type: _model.typeDropdownValue,
                                          status: 'PENDING',
                                          createdDateInMill: getCurrentTimestamp
                                              .millisecondsSinceEpoch,
                                          mode: valueOrDefault<String>(
                                            _model.radioButton1Value,
                                            'Offline',
                                          ),
                                        ));
                                        _model.activityDoc = LeadActivitiesRecord
                                            .getDocumentFromData(
                                                createLeadActivitiesRecordData(
                                                  assignedTo:
                                                      rowUserProfileRecord?.id,
                                                  scheduledDate: _model
                                                      .datePicked
                                                      ?.millisecondsSinceEpoch,
                                                  scheduledTime: _model
                                                      .datePicked
                                                      ?.millisecondsSinceEpoch,
                                                  leadName:
                                                      buttonLeadsManagementRecord
                                                          ?.username,
                                                  description: _model
                                                      .textFieldDecsTextController
                                                      .text,
                                                  leadRefId:
                                                      buttonLeadsManagementRecord
                                                          ?.id,
                                                  createdDate:
                                                      getCurrentTimestamp,
                                                  type:
                                                      _model.typeDropdownValue,
                                                  status: 'PENDING',
                                                  createdDateInMill:
                                                      getCurrentTimestamp
                                                          .millisecondsSinceEpoch,
                                                  mode: valueOrDefault<String>(
                                                    _model.radioButton1Value,
                                                    'Offline',
                                                  ),
                                                ),
                                                leadActivitiesRecordReference);
                                        _shouldSetState = true;

                                        await _model.activityDoc!.reference
                                            .update(
                                                createLeadActivitiesRecordData(
                                          id: _model.activityDoc?.reference.id,
                                        ));
                                        if (_model.typeDropdownValue ==
                                            'Follow Up') {
                                          var leadFollowUpRecordReference =
                                              LeadFollowUpRecord.createDoc(
                                                  FFAppState().outletRef!);
                                          await leadFollowUpRecordReference
                                              .set(createLeadFollowUpRecordData(
                                            date: functions.timestampToMili(
                                                _model.datePicked),
                                            time: functions.timestampToMili(
                                                getCurrentTimestamp),
                                            followUpName: _model
                                                .textFieldUsernameTextController
                                                .text,
                                            leadPriority:
                                                _model.priorityDropDownValue,
                                            assignedTo:
                                                rowUserProfileRecord?.id,
                                            discription: _model
                                                .textFieldDecsTextController
                                                .text,
                                            leadMRefId:
                                                buttonLeadsManagementRecord?.id,
                                            mobile: widget!.mobile,
                                            timestamp: getCurrentTimestamp,
                                          ));
                                          _model.doc = LeadFollowUpRecord
                                              .getDocumentFromData(
                                                  createLeadFollowUpRecordData(
                                                    date: functions
                                                        .timestampToMili(
                                                            _model.datePicked),
                                                    time: functions
                                                        .timestampToMili(
                                                            getCurrentTimestamp),
                                                    followUpName: _model
                                                        .textFieldUsernameTextController
                                                        .text,
                                                    leadPriority: _model
                                                        .priorityDropDownValue,
                                                    assignedTo:
                                                        rowUserProfileRecord
                                                            ?.id,
                                                    discription: _model
                                                        .textFieldDecsTextController
                                                        .text,
                                                    leadMRefId:
                                                        buttonLeadsManagementRecord
                                                            ?.id,
                                                    mobile: widget!.mobile,
                                                    timestamp:
                                                        getCurrentTimestamp,
                                                  ),
                                                  leadFollowUpRecordReference);
                                          _shouldSetState = true;
                                          await showDialog(
                                            context: context,
                                            builder: (alertDialogContext) {
                                              return WebViewAware(
                                                child: AlertDialog(
                                                  title: Text(
                                                      'Follow up Details Added...'),
                                                  actions: [
                                                    TextButton(
                                                      onPressed: () =>
                                                          Navigator.pop(
                                                              alertDialogContext),
                                                      child: Text('Ok'),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        }
                                      }

                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title:
                                                  Text('Lead Activity Added'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      Navigator.pop(context);
                                    } else {
                                      await showDialog(
                                        context: context,
                                        builder: (alertDialogContext) {
                                          return WebViewAware(
                                            child: AlertDialog(
                                              title: Text(
                                                  'Some fields are missing !'),
                                              content:
                                                  Text('Select Date And Time'),
                                              actions: [
                                                TextButton(
                                                  onPressed: () =>
                                                      Navigator.pop(
                                                          alertDialogContext),
                                                  child: Text('Ok'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      );
                                      if (_shouldSetState) safeSetState(() {});
                                      return;
                                    }

                                    if (_shouldSetState) safeSetState(() {});
                                  },
                                  text: 'Schedule',
                                  options: FFButtonOptions(
                                    width: 130.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
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
                                          fontWeight: FontWeight.w600,
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
                                );
                              },
                            ),
                          ],
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
    );
  }
}
