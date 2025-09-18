import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'deye_activity_update_model.dart';
export 'deye_activity_update_model.dart';

class DeyeActivityUpdateWidget extends StatefulWidget {
  const DeyeActivityUpdateWidget({
    super.key,
    this.leadManagement,
    this.status,
  });

  final LeadsManagementRecord? leadManagement;
  final String? status;

  @override
  State<DeyeActivityUpdateWidget> createState() =>
      _DeyeActivityUpdateWidgetState();
}

class _DeyeActivityUpdateWidgetState extends State<DeyeActivityUpdateWidget> {
  late DeyeActivityUpdateModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeyeActivityUpdateModel());

    _model.textFieldCustomerNameTextController ??= TextEditingController();
    _model.textFieldCustomerNameFocusNode ??= FocusNode();

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

    return Container(
      width: 350.0,
      height: 400.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).back2nd,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Action Taken',
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily:
                        FlutterFlowTheme.of(context).headlineLargeFamily,
                    letterSpacing: 0.0,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                  ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Text(
                      'Action Description',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).text2nd,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodySmallIsCustom,
                          ),
                    ),
                  ),
                  TextFormField(
                    controller: _model.textFieldCustomerNameTextController,
                    focusNode: _model.textFieldCustomerNameFocusNode,
                    autofocus: true,
                    obscureText: false,
                    decoration: InputDecoration(
                      isDense: true,
                      hintStyle: FlutterFlowTheme.of(context)
                          .bodySmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodySmallIsCustom,
                          ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).customColor1,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).primaryText,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00000000),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(3.0),
                      ),
                      filled: true,
                      fillColor:
                          FlutterFlowTheme.of(context).secondaryBackground,
                    ),
                    style: FlutterFlowTheme.of(context).labelLarge.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelLargeFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelLargeIsCustom,
                        ),
                    maxLines: 3,
                    validator: _model
                        .textFieldCustomerNameTextControllerValidator
                        .asValidator(context),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Text(
                      'Solution',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).text2nd,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodySmallIsCustom,
                          ),
                    ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.actionDropdownValueController ??=
                        FormFieldController<String>(null),
                    options: FFAppConstants.DeyeActionItems,
                    onChanged: (val) =>
                        safeSetState(() => _model.actionDropdownValue = val),
                    width: double.infinity,
                    height: 45.0,
                    textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelSmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelSmallIsCustom,
                        ),
                    hintText: 'Select Solution ',
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 21.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).customColor1,
                    borderWidth: 0.0,
                    borderRadius: 5.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 7.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                    child: Text(
                      'Select Travel Mode',
                      style: FlutterFlowTheme.of(context).bodySmall.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).bodySmallFamily,
                            color: FlutterFlowTheme.of(context).text2nd,
                            letterSpacing: 0.0,
                            useGoogleFonts:
                                !FlutterFlowTheme.of(context).bodySmallIsCustom,
                          ),
                    ),
                  ),
                  FlutterFlowDropDown<String>(
                    controller: _model.typeDropdownValueController ??=
                        FormFieldController<String>(null),
                    options: FFAppConstants.DeyeActivityList,
                    onChanged: (val) =>
                        safeSetState(() => _model.typeDropdownValue = val),
                    width: double.infinity,
                    height: 45.0,
                    textStyle: FlutterFlowTheme.of(context).labelSmall.override(
                          fontFamily:
                              FlutterFlowTheme.of(context).labelSmallFamily,
                          letterSpacing: 0.0,
                          useGoogleFonts:
                              !FlutterFlowTheme.of(context).labelSmallIsCustom,
                        ),
                    hintText: 'Select Type',
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      size: 21.0,
                    ),
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    elevation: 2.0,
                    borderColor: FlutterFlowTheme.of(context).customColor1,
                    borderWidth: 0.0,
                    borderRadius: 5.0,
                    margin:
                        EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: false,
                    isMultiSelect: false,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        Navigator.pop(context);
                      },
                      text: 'Cancel',
                      options: FFButtonOptions(
                        width: 130.0,
                        height: 40.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        textStyle:
                            FlutterFlowTheme.of(context).titleMedium.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .titleMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .titleMediumIsCustom,
                                ),
                        elevation: 2.0,
                        borderSide: BorderSide(
                          color: FlutterFlowTheme.of(context).text2nd,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  FFButtonWidget(
                    onPressed: () async {
                      var _shouldSetState = false;
                      if (_model.textFieldCustomerNameTextController.text !=
                              null &&
                          _model.textFieldCustomerNameTextController.text !=
                              '') {
                        await widget!.leadManagement!.reference
                            .update(createLeadsManagementRecordData(
                          status: widget!.status,
                          stage: widget!.status,
                          closeDate: widget!.status == 'completed'
                              ? dateTimeFormat(
                                  "dd-MM-yyyy", getCurrentTimestamp)
                              : '0',
                          closeDateMili: widget!.status == 'completed'
                              ? getCurrentTimestamp.millisecondsSinceEpoch
                              : 0,
                          customFields: createCustomFieldsStruct(
                            solution: _model.actionDropdownValue,
                            clearUnsetFields: false,
                          ),
                        ));

                        var leadActivitiesRecordReference =
                            LeadActivitiesRecord.createDoc(
                                FFAppState().outletRef!);
                        await leadActivitiesRecordReference
                            .set(createLeadActivitiesRecordData(
                          assignedTo: widget!.leadManagement?.assignedTo,
                          scheduledDate:
                              getCurrentTimestamp.millisecondsSinceEpoch,
                          scheduledTime:
                              getCurrentTimestamp.millisecondsSinceEpoch,
                          leadName: widget!.leadManagement?.followUpName,
                          description:
                              _model.textFieldCustomerNameTextController.text,
                          leadRefId: widget!.leadManagement?.id,
                          createdDate: getCurrentTimestamp,
                          type: _model.typeDropdownValue,
                          status: 'completed',
                          mode: 'ONLINE',
                          solution: _model.actionDropdownValue,
                        ));
                        _model.activityDoc =
                            LeadActivitiesRecord.getDocumentFromData(
                                createLeadActivitiesRecordData(
                                  assignedTo:
                                      widget!.leadManagement?.assignedTo,
                                  scheduledDate: getCurrentTimestamp
                                      .millisecondsSinceEpoch,
                                  scheduledTime: getCurrentTimestamp
                                      .millisecondsSinceEpoch,
                                  leadName:
                                      widget!.leadManagement?.followUpName,
                                  description: _model
                                      .textFieldCustomerNameTextController.text,
                                  leadRefId: widget!.leadManagement?.id,
                                  createdDate: getCurrentTimestamp,
                                  type: _model.typeDropdownValue,
                                  status: 'completed',
                                  mode: 'ONLINE',
                                  solution: _model.actionDropdownValue,
                                ),
                                leadActivitiesRecordReference);
                        _shouldSetState = true;

                        await _model.activityDoc!.reference
                            .update(createLeadActivitiesRecordData(
                          id: _model.activityDoc?.reference.id,
                        ));
                        Navigator.pop(context);
                      } else {
                        await showDialog(
                          context: context,
                          builder: (alertDialogContext) {
                            return WebViewAware(
                              child: AlertDialog(
                                title: Text('Action taken  is  empty!!'),
                                actions: [
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(alertDialogContext),
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
                    text: 'Submit',
                    options: FFButtonOptions(
                      width: 130.0,
                      height: 40.0,
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      iconPadding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                      color: FlutterFlowTheme.of(context).customColor5,
                      textStyle: FlutterFlowTheme.of(context)
                          .titleSmall
                          .override(
                            fontFamily:
                                FlutterFlowTheme.of(context).titleSmallFamily,
                            color: Colors.white,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .titleSmallIsCustom,
                          ),
                      elevation: 2.0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
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
    );
  }
}
