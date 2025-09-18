import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/widgets/index.dart' as custom_widgets;
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
            isEqualTo: widget!.ticket,
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
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .headlineLargeIsCustom,
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
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .bodyMediumIsCustom,
                                  ),
                            ),
                          ),
                        ),
                        StreamBuilder<List<TeamTreeRecord>>(
                          stream: queryTeamTreeRecord(
                            parent: FFAppState().outletRef,
                            queryBuilder: (teamTreeRecord) =>
                                teamTreeRecord.whereArrayContainsAny(
                                    'zoneList',
                                    FFAppState().currentUserZoneList != ''
                                        ? FFAppState().currentUserZoneList
                                        : null),
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
                            List<TeamTreeRecord>
                                newCustomWidgetTeamTreeRecordList =
                                snapshot.data!;

                            return Container(
                              width: 450.0,
                              height: 60.0,
                              child: custom_widgets.NewCustomWidget(
                                width: 450.0,
                                height: 60.0,
                                selectedItem: newCustomWidgetTeamTreeRecordList
                                    .firstOrNull!.userProfileId,
                                doc: newCustomWidgetTeamTreeRecordList,
                                changeEvent: (value) async {},
                              ),
                            );
                          },
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
                      Container(
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
                                            assignedTo:
                                                FFAppState().selectedItem,
                                            isCustomer: false,
                                            leadRefId: _model
                                                .outletLeadDoc?.reference.id,
                                            followUpName:
                                                _model.outletLeadDoc?.username,
                                            area: _model.outletLeadDoc?.area,
                                            city: _model.outletLeadDoc?.city,
                                            comments:
                                                _model.outletLeadDoc?.comments,
                                            date: _model.outletLeadDoc?.date,
                                            email: _model.outletLeadDoc?.email,
                                            logId: _model.outletLeadDoc?.logId,
                                            mobile:
                                                _model.outletLeadDoc?.mobile,
                                            mobileAlt:
                                                _model.outletLeadDoc?.mobileAlt,
                                            phone: _model.outletLeadDoc?.phone,
                                            requirement: _model
                                                .outletLeadDoc?.requirement,
                                            source:
                                                _model.outletLeadDoc?.source,
                                            time: _model.outletLeadDoc?.time,
                                            username:
                                                _model.outletLeadDoc?.username,
                                            state: _model.outletLeadDoc?.state,
                                            remarks: '#',
                                            updatedDate:
                                                functions.timestampToMili(
                                                    getCurrentTimestamp),
                                            priority: '',
                                            leadCreatedDate:
                                                functions.timestampToMili(_model
                                                    .outletLeadDoc
                                                    ?.createdDateTime),
                                            leadDate:
                                                _model.outletLeadDoc?.date,
                                            businessName: '',
                                            businessType: '',
                                            assignedBy: FFAppState().userId,
                                            isDealerLead: false,
                                            isDuplicate: false,
                                            zone: _model.outletLeadDoc?.zone,
                                            ticket: widget!.ticket,
                                            customFields:
                                                createCustomFieldsStruct(
                                              capacity: _model.outletLeadDoc
                                                  ?.customFields?.capacity,
                                              productType: _model.outletLeadDoc
                                                  ?.customFields?.productType,
                                              purchasedFrom: _model
                                                  .outletLeadDoc
                                                  ?.customFields
                                                  ?.purchasedFrom,
                                              serial: _model.outletLeadDoc
                                                  ?.customFields?.serial,
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            closeDate: '0',
                                            closeDateMili: 0,
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
                                              'assignedToHistory': [
                                                getAssignedToHistoryFirestoreData(
                                                  createAssignedToHistoryStruct(
                                                    userProfileId: FFAppState()
                                                        .selectedItem,
                                                    assignedDate: functions
                                                        .timestampToMili(
                                                            getCurrentTimestamp),
                                                    assignedDateTime:
                                                        getCurrentTimestamp,
                                                    clearUnsetFields: false,
                                                    create: true,
                                                  ),
                                                  true,
                                                )
                                              ],
                                            },
                                          ),
                                        });
                                        _model.dealerRes = LeadsManagementRecord
                                            .getDocumentFromData({
                                          ...createLeadsManagementRecordData(
                                            status: 'assigned',
                                            stage: 'assigned',
                                            createdDate:
                                                functions.timestampToMili(
                                                    getCurrentTimestamp),
                                            assignedTo:
                                                FFAppState().selectedItem,
                                            isCustomer: false,
                                            leadRefId: _model
                                                .outletLeadDoc?.reference.id,
                                            followUpName:
                                                _model.outletLeadDoc?.username,
                                            area: _model.outletLeadDoc?.area,
                                            city: _model.outletLeadDoc?.city,
                                            comments:
                                                _model.outletLeadDoc?.comments,
                                            date: _model.outletLeadDoc?.date,
                                            email: _model.outletLeadDoc?.email,
                                            logId: _model.outletLeadDoc?.logId,
                                            mobile:
                                                _model.outletLeadDoc?.mobile,
                                            mobileAlt:
                                                _model.outletLeadDoc?.mobileAlt,
                                            phone: _model.outletLeadDoc?.phone,
                                            requirement: _model
                                                .outletLeadDoc?.requirement,
                                            source:
                                                _model.outletLeadDoc?.source,
                                            time: _model.outletLeadDoc?.time,
                                            username:
                                                _model.outletLeadDoc?.username,
                                            state: _model.outletLeadDoc?.state,
                                            remarks: '#',
                                            updatedDate:
                                                functions.timestampToMili(
                                                    getCurrentTimestamp),
                                            priority: '',
                                            leadCreatedDate:
                                                functions.timestampToMili(_model
                                                    .outletLeadDoc
                                                    ?.createdDateTime),
                                            leadDate:
                                                _model.outletLeadDoc?.date,
                                            businessName: '',
                                            businessType: '',
                                            assignedBy: FFAppState().userId,
                                            isDealerLead: false,
                                            isDuplicate: false,
                                            zone: _model.outletLeadDoc?.zone,
                                            ticket: widget!.ticket,
                                            customFields:
                                                createCustomFieldsStruct(
                                              capacity: _model.outletLeadDoc
                                                  ?.customFields?.capacity,
                                              productType: _model.outletLeadDoc
                                                  ?.customFields?.productType,
                                              purchasedFrom: _model
                                                  .outletLeadDoc
                                                  ?.customFields
                                                  ?.purchasedFrom,
                                              serial: _model.outletLeadDoc
                                                  ?.customFields?.serial,
                                              clearUnsetFields: false,
                                              create: true,
                                            ),
                                            closeDate: '0',
                                            closeDateMili: 0,
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
                                              'assignedToHistory': [
                                                getAssignedToHistoryFirestoreData(
                                                  createAssignedToHistoryStruct(
                                                    userProfileId: FFAppState()
                                                        .selectedItem,
                                                    assignedDate: functions
                                                        .timestampToMili(
                                                            getCurrentTimestamp),
                                                    assignedDateTime:
                                                        getCurrentTimestamp,
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
                                          id: _model.dealerRes?.reference.id,
                                        ));

                                        await _model.outletLeadDoc!.reference
                                            .update(createOutletLeadsRecordData(
                                          status: 'assigned',
                                          isDuplicate: false,
                                        ));
                                        Navigator.pop(context);

                                        context.pushNamed(
                                            DeyeDashboardCopyWidget.routeName);

                                        if (_shouldSetState)
                                          safeSetState(() {});
                                        return;
                                      } else {
                                        await _model.leadMangementDoc!.reference
                                            .update({
                                          ...createLeadsManagementRecordData(
                                            assignedTo:
                                                FFAppState().selectedItem,
                                            isDealerLead: false,
                                            updatedDate: getCurrentTimestamp
                                                .millisecondsSinceEpoch,
                                          ),
                                          ...mapToFirestore(
                                            {
                                              'assignedToHistory':
                                                  FieldValue.arrayUnion([
                                                getAssignedToHistoryFirestoreData(
                                                  createAssignedToHistoryStruct(
                                                    userProfileId: FFAppState()
                                                        .selectedItem,
                                                    assignedDate: functions
                                                        .timestampToMili(
                                                            getCurrentTimestamp),
                                                    assignedDateTime:
                                                        getCurrentTimestamp,
                                                    clearUnsetFields: false,
                                                  ),
                                                  true,
                                                )
                                              ]),
                                            },
                                          ),
                                        });
                                        FFAppState().leadCreateValue = '';
                                        safeSetState(() {});
                                        FFAppState().leadCreateValue =
                                            'Assigned';
                                        FFAppState().lostLeadIcon = false;
                                        safeSetState(() {});
                                        FFAppState().nleads =
                                            Colors.transparent;
                                        FFAppState().aleads = Color(0xFFCC0404);
                                        FFAppState().fLeads =
                                            Colors.transparent;
                                        FFAppState().cLeads =
                                            Colors.transparent;
                                        FFAppState().dLead = Colors.transparent;
                                        safeSetState(() {});
                                        Navigator.pop(context);
                                      }

                                      if (_shouldSetState) safeSetState(() {});
                                    },
                                    text: 'Assign',
                                    options: FFButtonOptions(
                                      width: 160.0,
                                      height: 45.0,
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 0.0),
                                      iconPadding:
                                          EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      textStyle: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBtnText,
                                            fontSize: 18.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyMediumIsCustom,
                                          ),
                                      elevation: 2.0,
                                      borderSide: BorderSide(
                                        color: Colors.transparent,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      hoverColor: Color(0x68247DFF),
                                      hoverTextColor: Color(0xFF01287E),
                                    ),
                                  ),
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
          ),
        ),
      ],
    );
  }
}
