import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'assign_lead_model.dart';
export 'assign_lead_model.dart';

class AssignLeadWidget extends StatefulWidget {
  const AssignLeadWidget({
    super.key,
    this.area,
    this.city,
    this.comments,
    this.createdDateTime,
    this.date,
    this.email,
    this.leadid,
    this.leadtype,
    this.mobile,
    this.mobileAlt,
    this.phone,
    this.prefix,
    this.requirement,
    this.source,
    this.state,
    this.status,
    this.time,
    this.username,
    this.leadRefId,
    this.businessName,
    this.businessType,
    this.priority,
    this.outletLeadsDoc,
  });

  final String? area;
  final String? city;
  final String? comments;
  final DateTime? createdDateTime;
  final String? date;
  final String? email;
  final String? leadid;
  final String? leadtype;
  final String? mobile;
  final String? mobileAlt;
  final String? phone;
  final String? prefix;
  final String? requirement;
  final String? source;
  final String? state;
  final String? status;
  final String? time;
  final String? username;
  final String? leadRefId;
  final String? businessName;
  final String? businessType;
  final String? priority;
  final OutletLeadsRecord? outletLeadsDoc;

  @override
  State<AssignLeadWidget> createState() => _AssignLeadWidgetState();
}

class _AssignLeadWidgetState extends State<AssignLeadWidget> {
  late AssignLeadModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignLeadModel());

    _model.dealerSwitchValue = false;
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        StreamBuilder<List<DealersRecord>>(
          stream: queryDealersRecord(
            parent: FFAppState().outletRef,
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
            List<DealersRecord> containerDealersRecordList = snapshot.data!;
            final containerDealersRecord = containerDealersRecordList.isNotEmpty
                ? containerDealersRecordList.first
                : null;

            return Container(
              width: 500.0,
              height: 400.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: FlutterFlowTheme.of(context).customColor1,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            buttonSize: 40.0,
                            fillColor:
                                FlutterFlowTheme.of(context).customColor1,
                            icon: Icon(
                              Icons.chevron_left_sharp,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Assign this Lead',
                              style: FlutterFlowTheme.of(context)
                                  .headlineLarge
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .headlineLargeFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .headlineLargeIsCustom,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Switch.adaptive(
                          value: _model.dealerSwitchValue!,
                          onChanged: (newValue) async {
                            safeSetState(
                                () => _model.dealerSwitchValue = newValue!);
                          },
                          activeColor: FlutterFlowTheme.of(context).info,
                          activeTrackColor:
                              FlutterFlowTheme.of(context).accent2,
                          inactiveTrackColor:
                              FlutterFlowTheme.of(context).secondary,
                          inactiveThumbColor:
                              FlutterFlowTheme.of(context).secondaryText,
                        ),
                        Text(
                          'Show Dealer',
                          style: FlutterFlowTheme.of(context)
                              .bodyMedium
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .bodyMediumFamily,
                                fontSize: 15.0,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .bodyMediumIsCustom,
                              ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        if (_model.dealerSwitchValue == false)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Text(
                                    'Assign to executive',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: StreamBuilder<List<UserProfileRecord>>(
                                  stream: queryUserProfileRecord(
                                    queryBuilder: (userProfileRecord) =>
                                        userProfileRecord.where(
                                      'outlets',
                                      arrayContains: FFAppState().outletId != ''
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<UserProfileRecord>
                                        containerUserProfileRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: 450.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor1,
                                        ),
                                      ),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .executiveAssigneDropDownValueController ??=
                                            FormFieldController<String>(null),
                                        options: containerUserProfileRecordList
                                            .where((e) =>
                                                (e.outletId ==
                                                    FFAppState().outletId) &&
                                                (containerDealersRecord
                                                        ?.userProfileId !=
                                                    e.id) &&
                                                (e.permissionList
                                                        .elementAtOrNull(10)
                                                        ?.value !=
                                                    0))
                                            .toList()
                                            .map((e) => e.name)
                                            .toList(),
                                        onChanged: (val) => safeSetState(() =>
                                            _model.executiveAssigneDropDownValue =
                                                val),
                                        width: 180.0,
                                        height: 50.0,
                                        searchTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        hintText: 'Please select...',
                                        fillColor: Colors.white,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        if (_model.dealerSwitchValue == true)
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Align(
                                alignment: AlignmentDirectional(-1.0, -1.0),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Text(
                                    'Assign to dealer',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 50.0),
                                child: StreamBuilder<List<DealersRecord>>(
                                  stream: queryDealersRecord(
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
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<DealersRecord>
                                        containerDealersRecordList =
                                        snapshot.data!;

                                    return Container(
                                      width: 450.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor1,
                                        ),
                                      ),
                                      child: FlutterFlowDropDown<String>(
                                        controller: _model
                                                .assigneDealerDropDownValueController ??=
                                            FormFieldController<String>(
                                          _model.assigneDealerDropDownValue ??=
                                              '',
                                        ),
                                        options: List<String>.from(
                                            containerDealersRecordList
                                                .map((e) => e.userProfileId)
                                                .toList()),
                                        optionLabels: containerDealersRecordList
                                            .map((e) => e.firmName)
                                            .toList(),
                                        onChanged: (val) => safeSetState(() =>
                                            _model.assigneDealerDropDownValue =
                                                val),
                                        width: 180.0,
                                        height: 50.0,
                                        searchTextStyle: FlutterFlowTheme.of(
                                                context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily,
                                              color: Colors.black,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .bodyMediumIsCustom,
                                            ),
                                        hintText: 'Please select...',
                                        fillColor: Colors.white,
                                        elevation: 2.0,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0.0,
                                        borderRadius: 0.0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12.0, 4.0, 12.0, 4.0),
                                        hidesUnderline: true,
                                        isSearchable: true,
                                        isMultiSelect: false,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                      ],
                    ),
                    StreamBuilder<List<DealersRecord>>(
                      stream: queryDealersRecord(
                        parent: FFAppState().outletRef,
                        queryBuilder: (dealersRecord) => dealersRecord.where(
                          'dealerName',
                          isEqualTo: _model.assigneDealerDropDownValue,
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
                        List<DealersRecord> container55DealersRecordList =
                            snapshot.data!;
                        final container55DealersRecord =
                            container55DealersRecordList.isNotEmpty
                                ? container55DealersRecordList.first
                                : null;

                        return Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              StreamBuilder<List<OutletLeadsRecord>>(
                                stream: queryOutletLeadsRecord(
                                  parent: FFAppState().outletRef,
                                  queryBuilder: (outletLeadsRecord) =>
                                      outletLeadsRecord.where(
                                    'mobile',
                                    isEqualTo: widget!.mobile,
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
                                  List<OutletLeadsRecord>
                                      container66OutletLeadsRecordList =
                                      snapshot.data!;
                                  final container66OutletLeadsRecord =
                                      container66OutletLeadsRecordList
                                              .isNotEmpty
                                          ? container66OutletLeadsRecordList
                                              .first
                                          : null;

                                  return Container(
                                    decoration: BoxDecoration(),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 25.0),
                                              child: FFButtonWidget(
                                                onPressed: () async {
                                                  var _shouldSetState = false;
                                                  if (FFAppState()
                                                          .changeAssignedFlag ==
                                                      false) {
                                                    if (_model.dealerSwitchValue ==
                                                            true
                                                        ? (_model.assigneDealerDropDownValue !=
                                                                null &&
                                                            _model.assigneDealerDropDownValue !=
                                                                '')
                                                        : (_model.executiveAssigneDropDownValue !=
                                                                null &&
                                                            _model.executiveAssigneDropDownValue !=
                                                                '')) {
                                                      _model.userRef1 =
                                                          await queryUserProfileRecordOnce(
                                                        queryBuilder:
                                                            (userProfileRecord) =>
                                                                userProfileRecord
                                                                    .where(
                                                          'name',
                                                          isEqualTo: _model
                                                              .executiveAssigneDropDownValue,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      _shouldSetState = true;

                                                      var leadsManagementRecordReference =
                                                          LeadsManagementRecord
                                                              .createDoc(
                                                                  FFAppState()
                                                                      .outletRef!);
                                                      await leadsManagementRecordReference
                                                          .set({
                                                        ...createLeadsManagementRecordData(
                                                          status: 'assigned',
                                                          stage: 'assigned',
                                                          createdDate: functions
                                                              .timestampToMili(
                                                                  getCurrentTimestamp),
                                                          assignedTo: _model
                                                                      .dealerSwitchValue ==
                                                                  true
                                                              ? container55DealersRecord
                                                                  ?.userProfileId
                                                              : _model
                                                                  .userRef1?.id,
                                                          isCustomer: false,
                                                          leadRefId:
                                                              widget!.leadRefId,
                                                          followUpName:
                                                              widget!.username,
                                                          area: widget!.area,
                                                          city: valueOrDefault<
                                                              String>(
                                                            widget!.city,
                                                            'Not Available',
                                                          ),
                                                          comments:
                                                              widget!.comments,
                                                          date:
                                                              container66OutletLeadsRecord
                                                                  ?.date,
                                                          email: widget!.email,
                                                          logId:
                                                              container66OutletLeadsRecord
                                                                  ?.logId,
                                                          mobile:
                                                              widget!.mobile,
                                                          mobileAlt:
                                                              widget!.mobileAlt,
                                                          phone: widget!.phone,
                                                          requirement: widget!
                                                              .requirement,
                                                          source:
                                                              widget!.source,
                                                          time:
                                                              container66OutletLeadsRecord
                                                                  ?.time,
                                                          username:
                                                              widget!.username,
                                                          state: valueOrDefault<
                                                              String>(
                                                            widget!.state,
                                                            'Not Available',
                                                          ),
                                                          remarks: '#',
                                                          updatedDate: functions
                                                              .timestampToMili(
                                                                  getCurrentTimestamp),
                                                          priority:
                                                              valueOrDefault<
                                                                  String>(
                                                            container66OutletLeadsRecord
                                                                            ?.priority ==
                                                                        null ||
                                                                    container66OutletLeadsRecord
                                                                            ?.priority ==
                                                                        ''
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    '',
                                                                    'priority',
                                                                  )
                                                                : valueOrDefault<
                                                                    String>(
                                                                    container66OutletLeadsRecord
                                                                        ?.priority,
                                                                    '#',
                                                                  ),
                                                            '\"\"',
                                                          ),
                                                          leadCreatedDate: functions
                                                              .timestampToMili(
                                                                  widget!
                                                                      .createdDateTime),
                                                          leadDate:
                                                              widget!.date,
                                                          businessName: widget!
                                                              .businessName,
                                                          businessType:
                                                              valueOrDefault<
                                                                  String>(
                                                            widget!
                                                                .businessType,
                                                            '#',
                                                          ),
                                                          assignedBy: _model
                                                              .userRef1?.id,
                                                          isDuplicate: false,
                                                          leadCampaign:
                                                              container66OutletLeadsRecord
                                                                  ?.leadCampaign,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'leadTag': [
                                                              getLeadTagListFirestoreData(
                                                                createLeadTagListStruct(
                                                                  code: 0,
                                                                  isDeleted:
                                                                      false,
                                                                  leadTagName:
                                                                      '',
                                                                  clearUnsetFields:
                                                                      false,
                                                                  create: true,
                                                                ),
                                                                true,
                                                              )
                                                            ],
                                                          },
                                                        ),
                                                      });
                                                      _model.res1Copy =
                                                          LeadsManagementRecord
                                                              .getDocumentFromData({
                                                        ...createLeadsManagementRecordData(
                                                          status: 'assigned',
                                                          stage: 'assigned',
                                                          createdDate: functions
                                                              .timestampToMili(
                                                                  getCurrentTimestamp),
                                                          assignedTo: _model
                                                                      .dealerSwitchValue ==
                                                                  true
                                                              ? container55DealersRecord
                                                                  ?.userProfileId
                                                              : _model
                                                                  .userRef1?.id,
                                                          isCustomer: false,
                                                          leadRefId:
                                                              widget!.leadRefId,
                                                          followUpName:
                                                              widget!.username,
                                                          area: widget!.area,
                                                          city: valueOrDefault<
                                                              String>(
                                                            widget!.city,
                                                            'Not Available',
                                                          ),
                                                          comments:
                                                              widget!.comments,
                                                          date:
                                                              container66OutletLeadsRecord
                                                                  ?.date,
                                                          email: widget!.email,
                                                          logId:
                                                              container66OutletLeadsRecord
                                                                  ?.logId,
                                                          mobile:
                                                              widget!.mobile,
                                                          mobileAlt:
                                                              widget!.mobileAlt,
                                                          phone: widget!.phone,
                                                          requirement: widget!
                                                              .requirement,
                                                          source:
                                                              widget!.source,
                                                          time:
                                                              container66OutletLeadsRecord
                                                                  ?.time,
                                                          username:
                                                              widget!.username,
                                                          state: valueOrDefault<
                                                              String>(
                                                            widget!.state,
                                                            'Not Available',
                                                          ),
                                                          remarks: '#',
                                                          updatedDate: functions
                                                              .timestampToMili(
                                                                  getCurrentTimestamp),
                                                          priority:
                                                              valueOrDefault<
                                                                  String>(
                                                            container66OutletLeadsRecord
                                                                            ?.priority ==
                                                                        null ||
                                                                    container66OutletLeadsRecord
                                                                            ?.priority ==
                                                                        ''
                                                                ? valueOrDefault<
                                                                    String>(
                                                                    '',
                                                                    'priority',
                                                                  )
                                                                : valueOrDefault<
                                                                    String>(
                                                                    container66OutletLeadsRecord
                                                                        ?.priority,
                                                                    '#',
                                                                  ),
                                                            '\"\"',
                                                          ),
                                                          leadCreatedDate: functions
                                                              .timestampToMili(
                                                                  widget!
                                                                      .createdDateTime),
                                                          leadDate:
                                                              widget!.date,
                                                          businessName: widget!
                                                              .businessName,
                                                          businessType:
                                                              valueOrDefault<
                                                                  String>(
                                                            widget!
                                                                .businessType,
                                                            '#',
                                                          ),
                                                          assignedBy: _model
                                                              .userRef1?.id,
                                                          isDuplicate: false,
                                                          leadCampaign:
                                                              container66OutletLeadsRecord
                                                                  ?.leadCampaign,
                                                        ),
                                                        ...mapToFirestore(
                                                          {
                                                            'leadTag': [
                                                              getLeadTagListFirestoreData(
                                                                createLeadTagListStruct(
                                                                  code: 0,
                                                                  isDeleted:
                                                                      false,
                                                                  leadTagName:
                                                                      '',
                                                                  clearUnsetFields:
                                                                      false,
                                                                  create: true,
                                                                ),
                                                                true,
                                                              )
                                                            ],
                                                          },
                                                        ),
                                                      }, leadsManagementRecordReference);
                                                      _shouldSetState = true;

                                                      await _model
                                                          .res1Copy!.reference
                                                          .update(
                                                              createLeadsManagementRecordData(
                                                        id: functions
                                                            .getLeadDocIdFromDocRef(
                                                                _model.res1Copy
                                                                    ?.reference),
                                                      ));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Lead Assigned',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmallIsCustom,
                                                                ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );

                                                      await container66OutletLeadsRecord!
                                                          .reference
                                                          .update(
                                                              createOutletLeadsRecordData(
                                                        status: 'assigned',
                                                        isDuplicate: false,
                                                      ));
                                                      await Future.delayed(
                                                        Duration(
                                                          milliseconds: 2000,
                                                        ),
                                                      );

                                                      context.pushNamed(
                                                          LeadsDashboardFinalWidget
                                                              .routeName);

                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Error!'),
                                                              content: Text(
                                                                  'Please select name to assign'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  } else {
                                                    if (_model.dealerSwitchValue ==
                                                            true
                                                        ? (_model.assigneDealerDropDownValue !=
                                                                null &&
                                                            _model.assigneDealerDropDownValue !=
                                                                '')
                                                        : (_model.executiveAssigneDropDownValue !=
                                                                null &&
                                                            _model.executiveAssigneDropDownValue !=
                                                                '')) {
                                                      _model.userRef2 =
                                                          await queryUserProfileRecordOnce(
                                                        queryBuilder:
                                                            (userProfileRecord) =>
                                                                userProfileRecord
                                                                    .where(
                                                          'name',
                                                          isEqualTo: _model
                                                              .executiveAssigneDropDownValue,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      _shouldSetState = true;
                                                      _model.res2 =
                                                          await queryLeadsManagementRecordOnce(
                                                        parent: FFAppState()
                                                            .outletRef,
                                                        queryBuilder:
                                                            (leadsManagementRecord) =>
                                                                leadsManagementRecord
                                                                    .where(
                                                          'leadRefId',
                                                          isEqualTo:
                                                              widget!.leadRefId,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      _shouldSetState = true;

                                                      await _model
                                                          .res2!.reference
                                                          .update(
                                                              createLeadsManagementRecordData(
                                                        assignedTo: _model
                                                                    .dealerSwitchValue ==
                                                                true
                                                            ? container55DealersRecord
                                                                ?.userProfileId
                                                            : _model
                                                                .userRef2?.id,
                                                        leadCampaign:
                                                            container66OutletLeadsRecord
                                                                ?.leadCampaign,
                                                      ));
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Lead Assigned',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .headlineSmall
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primary,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts:
                                                                      !FlutterFlowTheme.of(
                                                                              context)
                                                                          .headlineSmallIsCustom,
                                                                ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  4000),
                                                          backgroundColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                        ),
                                                      );

                                                      await _model
                                                          .res2!.reference
                                                          .update(
                                                              createLeadsManagementRecordData(
                                                        id: _model.res2?.id,
                                                      ));

                                                      await _model
                                                          .res2!.reference
                                                          .update(
                                                              createLeadsManagementRecordData(
                                                        status: 'assigned',
                                                        isDuplicate: false,
                                                      ));
                                                      await Future.delayed(
                                                        Duration(
                                                          milliseconds: 2000,
                                                        ),
                                                      );
                                                      _model.res3 =
                                                          await actions
                                                              .leadDocRefCopy(
                                                        '0',
                                                        FFAppState().outletId,
                                                        'assigned',
                                                        functions.last30days(),
                                                        functions.timestampToMili(
                                                            getCurrentTimestamp),
                                                      );
                                                      _shouldSetState = true;
                                                      FFAppState()
                                                          .assignedExec = true;
                                                      FFAppState().allLeads =
                                                          _model.res3!
                                                              .toList()
                                                              .cast<dynamic>();
                                                      safeSetState(() {});
                                                      FFAppState()
                                                          .leadCreateValue = '';
                                                      safeSetState(() {});
                                                      FFAppState()
                                                              .leadCreateValue =
                                                          'Assigned';
                                                      FFAppState()
                                                          .lostLeadIcon = false;
                                                      safeSetState(() {});
                                                      FFAppState().nleads =
                                                          Colors.transparent;
                                                      FFAppState().aleads =
                                                          Color(0xFFCC0404);
                                                      FFAppState().fLeads =
                                                          Colors.transparent;
                                                      FFAppState().cLeads =
                                                          Colors.transparent;
                                                      FFAppState().dLead =
                                                          Colors.transparent;
                                                      safeSetState(() {});
                                                      Navigator.pop(context);
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Error!'),
                                                              content: Text(
                                                                  'Please select name to assign'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }
                                                  }

                                                  if (_shouldSetState)
                                                    safeSetState(() {});
                                                },
                                                text: 'Assign',
                                                options: FFButtonOptions(
                                                  width: 160.0,
                                                  height: 45.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          0.0, 0.0, 0.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primary,
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            fontSize: 18.0,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumIsCustom,
                                                          ),
                                                  elevation: 2.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  hoverColor: Color(0x68247DFF),
                                                  hoverTextColor:
                                                      Color(0xFF01287E),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
