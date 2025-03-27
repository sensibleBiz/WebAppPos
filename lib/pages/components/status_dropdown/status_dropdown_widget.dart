import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/popup_success_copy_widget.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'status_dropdown_model.dart';
export 'status_dropdown_model.dart';

class StatusDropdownWidget extends StatefulWidget {
  const StatusDropdownWidget({
    super.key,
    this.stages,
    this.json,
    required this.flag,
  });

  final List<LeadStagesRecord>? stages;
  final dynamic json;
  final int? flag;

  @override
  State<StatusDropdownWidget> createState() => _StatusDropdownWidgetState();
}

class _StatusDropdownWidgetState extends State<StatusDropdownWidget> {
  late StatusDropdownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StatusDropdownModel());

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

    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Builder(
        builder: (context) => FlutterFlowDropDown<String>(
          controller: _model.dropDownValueController ??=
              FormFieldController<String>(
            _model.dropDownValue ??= getJsonField(
              widget!.json,
              r'''$.status''',
            ).toString(),
          ),
          options: widget!.stages!.map((e) => e.name).toList(),
          onChanged: (val) async {
            safeSetState(() => _model.dropDownValue = val);
            var confirmDialogResponse = await showDialog<bool>(
                  context: context,
                  builder: (alertDialogContext) {
                    return WebViewAware(
                      child: AlertDialog(
                        title: Text('Do you want to update the Status..?'),
                        content: Text(_model.dropDownValue!),
                        actions: [
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, false),
                            child: Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () =>
                                Navigator.pop(alertDialogContext, true),
                            child: Text('Confirm'),
                          ),
                        ],
                      ),
                    );
                  },
                ) ??
                false;
            if (!confirmDialogResponse) {
              return;
            }

            await functions
                .getRef(
                    getJsonField(
                      widget!.json,
                      r'''$''',
                    ),
                    FFAppState().outletRef!.id,
                    widget!.flag!)
                .update(createLeadsManagementRecordData(
                  status: _model.dropDownValue,
                  updatedDate: functions.timestampToMili(getCurrentTimestamp),
                  stage: _model.dropDownValue,
                ));
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
                    child: PopupSuccessCopyWidget(
                      title: 'Status Upadated ',
                      message: 'Status Upadated ',
                    ),
                  ),
                );
              },
            );
          },
          width: 100.0,
          height: 50.0,
          textStyle: FlutterFlowTheme.of(context).labelLarge.override(
                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                fontSize: 11.0,
                letterSpacing: 0.0,
                useGoogleFonts: GoogleFonts.asMap()
                    .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
              ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: FlutterFlowTheme.of(context).secondaryText,
            size: 18.0,
          ),
          fillColor: FlutterFlowTheme.of(context).secondaryBackground,
          elevation: 2.0,
          borderColor: FlutterFlowTheme.of(context).customColor1,
          borderWidth: 1.0,
          borderRadius: 8.0,
          margin: EdgeInsets.all(5.0),
          hidesUnderline: true,
          isSearchable: false,
          isMultiSelect: false,
        ),
      ),
    );
  }
}
