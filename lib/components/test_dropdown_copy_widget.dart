import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
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
import 'test_dropdown_copy_model.dart';
export 'test_dropdown_copy_model.dart';

class TestDropdownCopyWidget extends StatefulWidget {
  const TestDropdownCopyWidget({
    super.key,
    this.ref,
    int? flag,
  }) : this.flag = flag ?? 0;

  final LeadsManagementRecord? ref;
  final int flag;

  @override
  State<TestDropdownCopyWidget> createState() => _TestDropdownCopyWidgetState();
}

class _TestDropdownCopyWidgetState extends State<TestDropdownCopyWidget> {
  late TestDropdownCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => TestDropdownCopyModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
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
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: FlutterFlowDropDown<String>(
        controller: _model.dropDownValueController ??=
            FormFieldController<String>(
          _model.dropDownValue ??=
              functions.toCapitalLetter(widget.ref?.status),
        ),
        options: functions.dropdownStatusList(FFAppState().leadCreateValue),
        onChanged: (val) async {
          setState(() => _model.dropDownValue = val);
          var confirmDialogResponse = await showDialog<bool>(
                context: context,
                builder: (alertDialogContext) {
                  return WebViewAware(
                    child: AlertDialog(
                      title: Text('Do you want to update the Status..?'),
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

          await widget.ref!.reference.update(createLeadsManagementRecordData(
            status: _model.dropDownValue,
            updatedDate: functions.timestampToMili(getCurrentTimestamp),
            stage: functions.statusForStage(_model.dropDownValue!),
          ));
        },
        width: 170.0,
        height: 40.0,
        textStyle: FlutterFlowTheme.of(context).labelLarge.override(
              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
              letterSpacing: 0.0,
              useGoogleFonts: GoogleFonts.asMap()
                  .containsKey(FlutterFlowTheme.of(context).labelLargeFamily),
            ),
        fillColor: FlutterFlowTheme.of(context).secondaryBackground,
        elevation: 2.0,
        borderColor: Colors.transparent,
        borderWidth: 0.0,
        borderRadius: 0.0,
        margin: EdgeInsetsDirectional.fromSTEB(12.0, 4.0, 12.0, 4.0),
        hidesUnderline: true,
        isSearchable: false,
        isMultiSelect: false,
      ),
    );
  }
}
