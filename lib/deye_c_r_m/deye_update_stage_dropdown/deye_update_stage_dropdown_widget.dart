import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/deye_c_r_m/deye_activity_update/deye_activity_update_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'deye_update_stage_dropdown_model.dart';
export 'deye_update_stage_dropdown_model.dart';

class DeyeUpdateStageDropdownWidget extends StatefulWidget {
  const DeyeUpdateStageDropdownWidget({
    super.key,
    this.doc,
  });

  final LeadsManagementRecord? doc;

  @override
  State<DeyeUpdateStageDropdownWidget> createState() =>
      _DeyeUpdateStageDropdownWidgetState();
}

class _DeyeUpdateStageDropdownWidgetState
    extends State<DeyeUpdateStageDropdownWidget> {
  late DeyeUpdateStageDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeyeUpdateStageDropdownModel());

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

    return StreamBuilder<List<LeadStagesRecord>>(
      stream: queryLeadStagesRecord(
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
                color: FlutterFlowTheme.of(context).primary,
                size: 30.0,
              ),
            ),
          );
        }
        List<LeadStagesRecord> containerLeadStagesRecordList = snapshot.data!;

        return Container(
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsets.all(4.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 40.0),
                  child: Container(
                    width: double.infinity,
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).customColor6,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(4.0),
                        bottomRight: Radius.circular(4.0),
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(16.0),
                      ),
                    ),
                    child: Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Status',
                            style: FlutterFlowTheme.of(context)
                                .labelLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .labelLargeFamily,
                                  color: FlutterFlowTheme.of(context)
                                      .primaryBackground,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .labelLargeIsCustom,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Builder(
                        builder: (context) => FlutterFlowDropDown<String>(
                          controller: _model.dropDownValueController ??=
                              FormFieldController<String>(
                            _model.dropDownValue ??= widget!.doc?.stage,
                          ),
                          options: containerLeadStagesRecordList
                              .map((e) => e.name)
                              .toList(),
                          onChanged: (val) async {
                            safeSetState(() => _model.dropDownValue = val);
                            var confirmDialogResponse = await showDialog<bool>(
                                  context: context,
                                  builder: (alertDialogContext) {
                                    return WebViewAware(
                                      child: AlertDialog(
                                        title: Text(
                                            'Do you want to update the Status..?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, false),
                                            child: Text('Cancel'),
                                          ),
                                          TextButton(
                                            onPressed: () => Navigator.pop(
                                                alertDialogContext, true),
                                            child: Text('Confirm'),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ) ??
                                false;
                            if (confirmDialogResponse) {
                              if (_model.dropDownValue == 'completed') {
                                await showDialog(
                                  context: context,
                                  builder: (dialogContext) {
                                    return Dialog(
                                      elevation: 0,
                                      insetPadding: EdgeInsets.zero,
                                      backgroundColor: Colors.transparent,
                                      alignment: AlignmentDirectional(0.0, 0.0)
                                          .resolve(Directionality.of(context)),
                                      child: WebViewAware(
                                        child: DeyeActivityUpdateWidget(
                                          leadManagement: widget!.doc,
                                          status: _model.dropDownValue,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              } else {
                                await widget!.doc!.reference
                                    .update(createLeadsManagementRecordData(
                                  status: _model.dropDownValue,
                                  updatedDate: functions
                                      .timestampToMili(getCurrentTimestamp),
                                  stage: _model.dropDownValue,
                                  closeDate: _model.dropDownValue == 'completed'
                                      ? dateTimeFormat(
                                          "dd-mm-yyyy", getCurrentTimestamp)
                                      : '0',
                                  closeDateMili:
                                      _model.dropDownValue == 'completed'
                                          ? getCurrentTimestamp
                                              .millisecondsSinceEpoch
                                          : 0,
                                ));
                                Navigator.pop(context, _model.dropDownValue);
                              }
                            } else {
                              return;
                            }
                          },
                          width: 200.0,
                          height: 40.0,
                          textStyle: FlutterFlowTheme.of(context)
                              .labelLarge
                              .override(
                                fontFamily: FlutterFlowTheme.of(context)
                                    .labelLargeFamily,
                                letterSpacing: 0.0,
                                useGoogleFonts: !FlutterFlowTheme.of(context)
                                    .labelLargeIsCustom,
                              ),
                          icon: Icon(
                            Icons.storage,
                            color: FlutterFlowTheme.of(context).customColor5,
                            size: 15.0,
                          ),
                          fillColor:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          elevation: 2.0,
                          borderColor:
                              FlutterFlowTheme.of(context).customColor6,
                          borderWidth: 2.0,
                          borderRadius: 2.0,
                          margin: EdgeInsetsDirectional.fromSTEB(
                              12.0, 4.0, 12.0, 4.0),
                          hidesUnderline: true,
                          isOverButton: false,
                          isSearchable: false,
                          isMultiSelect: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
