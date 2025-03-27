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
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'assign_ticket_model.dart';
export 'assign_ticket_model.dart';

class AssignTicketWidget extends StatefulWidget {
  const AssignTicketWidget({
    super.key,
    this.ticket,
  });

  final String? ticket;

  @override
  State<AssignTicketWidget> createState() => _AssignTicketWidgetState();
}

class _AssignTicketWidgetState extends State<AssignTicketWidget> {
  late AssignTicketModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AssignTicketModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().changeAssignedFlag) {
        _model.leadMangementDoc = await queryLeadsManagementRecordOnce(
          parent: FFAppState().outletRef,
          queryBuilder: (leadsManagementRecord) => leadsManagementRecord.where(
            'ticket',
            isEqualTo: '',
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
      } else {
        _model.outletLeadDoc = await queryOutletLeadsRecordOnce(
          parent: FFAppState().outletRef,
          queryBuilder: (outletLeadsRecord) => outletLeadsRecord.where(
            'ticket',
            isEqualTo: widget!.ticket,
          ),
          singleRecord: true,
        ).then((s) => s.firstOrNull);
      }
    });

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
        Container(
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
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FlutterFlowIconButton(
                        buttonSize: 40.0,
                        fillColor: FlutterFlowTheme.of(context).customColor1,
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
                        padding:
                            EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                        child: Text(
                          'Assign ',
                          style: FlutterFlowTheme.of(context)
                              .headlineLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .headlineLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: GoogleFonts.asMap().containsKey(
                                    FlutterFlowTheme.of(context)
                                        .headlineLargeFamily),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-1.0, -1.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: Text(
                              'Assign to engineer',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .bodyMediumFamily,
                                    fontSize: 15.0,
                                    letterSpacing: 0.0,
                                    useGoogleFonts: GoogleFonts.asMap()
                                        .containsKey(
                                            FlutterFlowTheme.of(context)
                                                .bodyMediumFamily),
                                  ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 50.0),
                          child: StreamBuilder<List<TeamTreeRecord>>(
                            stream: queryTeamTreeRecord(
                              parent: FFAppState().outletRef,
                              queryBuilder: (teamTreeRecord) =>
                                  teamTreeRecord.where(
                                'zone',
                                isEqualTo: FFAppState().zone != ''
                                    ? FFAppState().zone
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
                              List<TeamTreeRecord> containerTeamTreeRecordList =
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
                                  options: List<String>.from(
                                      containerTeamTreeRecordList
                                          .map((e) => e.userProfileId)
                                          .toList()),
                                  optionLabels: containerTeamTreeRecordList
                                      .map((e) => e.userName)
                                      .toList(),
                                  onChanged: (val) => safeSetState(() => _model
                                      .executiveAssigneDropDownValue = val),
                                  width: 180.0,
                                  height: 50.0,
                                  searchTextStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: Colors.black,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
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
                Container(
                  decoration: BoxDecoration(),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      StreamBuilder<List<OutletLeadsRecord>>(
                        stream: queryOutletLeadsRecord(
                          parent: FFAppState().outletRef,
                          queryBuilder: (outletLeadsRecord) =>
                              outletLeadsRecord.where(
                            'ticket',
                            isEqualTo: widget!.ticket,
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
                          List<OutletLeadsRecord>
                              container66OutletLeadsRecordList = snapshot.data!;
                          final container66OutletLeadsRecord =
                              container66OutletLeadsRecordList.isNotEmpty
                                  ? container66OutletLeadsRecordList.first
                                  : null;

                          return Container(
                            decoration: BoxDecoration(),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 25.0),
                                      child: FFButtonWidget(
                                        onPressed: () async {
                                          var _shouldSetState = false;
                                          if (FFAppState().changeAssignedFlag ==
                                              false) {
                                            var leadsManagementRecordReference =
                                                LeadsManagementRecord.createDoc(
                                                    FFAppState().outletRef!);
                                            await leadsManagementRecordReference
                                                .set({
                                              ...createLeadsManagementRecordData(
                                                status: 'assigned',
                                                stage: 'assigned',
                                                createdDate:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                assignedTo: _model
                                                    .executiveAssigneDropDownValue,
                                                isCustomer: false,
                                                leadRefId: _model.outletLeadDoc
                                                    ?.reference.id,
                                                followUpName:
                                                    container66OutletLeadsRecord
                                                        ?.username,
                                                area:
                                                    container66OutletLeadsRecord
                                                        ?.area,
                                                city:
                                                    container66OutletLeadsRecord
                                                        ?.city,
                                                comments:
                                                    container66OutletLeadsRecord
                                                        ?.comments,
                                                date:
                                                    container66OutletLeadsRecord
                                                        ?.date,
                                                email:
                                                    container66OutletLeadsRecord
                                                        ?.email,
                                                logId:
                                                    container66OutletLeadsRecord
                                                        ?.logId,
                                                mobile:
                                                    container66OutletLeadsRecord
                                                        ?.mobile,
                                                mobileAlt:
                                                    container66OutletLeadsRecord
                                                        ?.mobileAlt,
                                                phone:
                                                    container66OutletLeadsRecord
                                                        ?.phone,
                                                requirement:
                                                    container66OutletLeadsRecord
                                                        ?.requirement,
                                                source:
                                                    container66OutletLeadsRecord
                                                        ?.source,
                                                time:
                                                    container66OutletLeadsRecord
                                                        ?.time,
                                                username:
                                                    container66OutletLeadsRecord
                                                        ?.username,
                                                state:
                                                    container66OutletLeadsRecord
                                                        ?.state,
                                                remarks: '#',
                                                updatedDate:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                priority:
                                                    valueOrDefault<String>(
                                                  container66OutletLeadsRecord
                                                                  ?.priority ==
                                                              null ||
                                                          container66OutletLeadsRecord
                                                                  ?.priority ==
                                                              ''
                                                      ? valueOrDefault<String>(
                                                          '',
                                                          'priority',
                                                        )
                                                      : valueOrDefault<String>(
                                                          container66OutletLeadsRecord
                                                              ?.priority,
                                                          '#',
                                                        ),
                                                  '\"\"',
                                                ),
                                                leadCreatedDate:
                                                    functions.timestampToMili(
                                                        container66OutletLeadsRecord
                                                            ?.createdDateTime),
                                                leadDate:
                                                    container66OutletLeadsRecord
                                                        ?.date,
                                                businessName:
                                                    container66OutletLeadsRecord
                                                        ?.businessName,
                                                businessType:
                                                    container66OutletLeadsRecord
                                                        ?.businessType,
                                                assignedBy: FFAppState().userId,
                                                isDealerLead: false,
                                                isDuplicate: false,
                                                zone:
                                                    container66OutletLeadsRecord
                                                        ?.zone,
                                                ticket:
                                                    container66OutletLeadsRecord
                                                        ?.ticket,
                                                customFields:
                                                    updateCustomFieldsStruct(
                                                  container66OutletLeadsRecord
                                                      ?.customFields,
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'leadTag': [
                                                    getLeadTagListFirestoreData(
                                                      createLeadTagListStruct(
                                                        code: 0,
                                                        isDeleted: false,
                                                        leadTagName: '',
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                      true,
                                                    )
                                                  ],
                                                },
                                              ),
                                            });
                                            _model.dealerRes =
                                                LeadsManagementRecord
                                                    .getDocumentFromData({
                                              ...createLeadsManagementRecordData(
                                                status: 'assigned',
                                                stage: 'assigned',
                                                createdDate:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                assignedTo: _model
                                                    .executiveAssigneDropDownValue,
                                                isCustomer: false,
                                                leadRefId: _model.outletLeadDoc
                                                    ?.reference.id,
                                                followUpName:
                                                    container66OutletLeadsRecord
                                                        ?.username,
                                                area:
                                                    container66OutletLeadsRecord
                                                        ?.area,
                                                city:
                                                    container66OutletLeadsRecord
                                                        ?.city,
                                                comments:
                                                    container66OutletLeadsRecord
                                                        ?.comments,
                                                date:
                                                    container66OutletLeadsRecord
                                                        ?.date,
                                                email:
                                                    container66OutletLeadsRecord
                                                        ?.email,
                                                logId:
                                                    container66OutletLeadsRecord
                                                        ?.logId,
                                                mobile:
                                                    container66OutletLeadsRecord
                                                        ?.mobile,
                                                mobileAlt:
                                                    container66OutletLeadsRecord
                                                        ?.mobileAlt,
                                                phone:
                                                    container66OutletLeadsRecord
                                                        ?.phone,
                                                requirement:
                                                    container66OutletLeadsRecord
                                                        ?.requirement,
                                                source:
                                                    container66OutletLeadsRecord
                                                        ?.source,
                                                time:
                                                    container66OutletLeadsRecord
                                                        ?.time,
                                                username:
                                                    container66OutletLeadsRecord
                                                        ?.username,
                                                state:
                                                    container66OutletLeadsRecord
                                                        ?.state,
                                                remarks: '#',
                                                updatedDate:
                                                    functions.timestampToMili(
                                                        getCurrentTimestamp),
                                                priority:
                                                    valueOrDefault<String>(
                                                  container66OutletLeadsRecord
                                                                  ?.priority ==
                                                              null ||
                                                          container66OutletLeadsRecord
                                                                  ?.priority ==
                                                              ''
                                                      ? valueOrDefault<String>(
                                                          '',
                                                          'priority',
                                                        )
                                                      : valueOrDefault<String>(
                                                          container66OutletLeadsRecord
                                                              ?.priority,
                                                          '#',
                                                        ),
                                                  '\"\"',
                                                ),
                                                leadCreatedDate:
                                                    functions.timestampToMili(
                                                        container66OutletLeadsRecord
                                                            ?.createdDateTime),
                                                leadDate:
                                                    container66OutletLeadsRecord
                                                        ?.date,
                                                businessName:
                                                    container66OutletLeadsRecord
                                                        ?.businessName,
                                                businessType:
                                                    container66OutletLeadsRecord
                                                        ?.businessType,
                                                assignedBy: FFAppState().userId,
                                                isDealerLead: false,
                                                isDuplicate: false,
                                                zone:
                                                    container66OutletLeadsRecord
                                                        ?.zone,
                                                ticket:
                                                    container66OutletLeadsRecord
                                                        ?.ticket,
                                                customFields:
                                                    updateCustomFieldsStruct(
                                                  container66OutletLeadsRecord
                                                      ?.customFields,
                                                  clearUnsetFields: false,
                                                  create: true,
                                                ),
                                              ),
                                              ...mapToFirestore(
                                                {
                                                  'leadTag': [
                                                    getLeadTagListFirestoreData(
                                                      createLeadTagListStruct(
                                                        code: 0,
                                                        isDeleted: false,
                                                        leadTagName: '',
                                                        clearUnsetFields: false,
                                                        create: true,
                                                      ),
                                                      true,
                                                    )
                                                  ],
                                                },
                                              ),
                                            }, leadsManagementRecordReference);
                                            _shouldSetState = true;

                                            await _model.dealerRes!.reference
                                                .update(
                                                    createLeadsManagementRecordData(
                                              id: _model
                                                  .dealerRes?.reference.id,
                                            ));

                                            await container66OutletLeadsRecord!
                                                .reference
                                                .update(
                                                    createOutletLeadsRecordData(
                                              status: 'assigned',
                                              isDuplicate: false,
                                            ));
                                            Navigator.pop(context);

                                            context.pushNamed(
                                                DeyeDashboardEXPANDWidget
                                                    .routeName);

                                            if (_shouldSetState)
                                              safeSetState(() {});
                                            return;
                                          } else {
                                            await _model
                                                .leadMangementDoc!.reference
                                                .update(
                                                    createLeadsManagementRecordData(
                                              assignedTo: _model
                                                  .executiveAssigneDropDownValue,
                                              isDealerLead: false,
                                            ));
                                            _model.lead1 =
                                                await actions.leadDocRefCopy(
                                              '0',
                                              FFAppState().outletId,
                                              'assigned',
                                              functions.last30days(),
                                              functions.timestampToMili(
                                                  getCurrentTimestamp),
                                            );
                                            _shouldSetState = true;
                                            FFAppState().assignedExec = true;
                                            FFAppState().allLeads = _model
                                                .lead1!
                                                .toList()
                                                .cast<dynamic>();
                                            safeSetState(() {});
                                            FFAppState().leadCreateValue = '';
                                            safeSetState(() {});
                                            FFAppState().leadCreateValue =
                                                'Assigned';
                                            FFAppState().lostLeadIcon = false;
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
                                          }

                                          if (_shouldSetState)
                                            safeSetState(() {});
                                        },
                                        text: 'Assign',
                                        options: FFButtonOptions(
                                          width: 160.0,
                                          height: 45.0,
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          iconPadding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0.0, 0.0, 0.0, 0.0),
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          textStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodyMedium
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBtnText,
                                                fontSize: 18.0,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodyMediumFamily),
                                              ),
                                          elevation: 2.0,
                                          borderSide: BorderSide(
                                            color: Colors.transparent,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          hoverColor: Color(0x68247DFF),
                                          hoverTextColor: Color(0xFF01287E),
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
