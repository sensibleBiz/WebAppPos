import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'stages_drop_down_model.dart';
export 'stages_drop_down_model.dart';

class StagesDropDownWidget extends StatefulWidget {
  const StagesDropDownWidget({
    super.key,
    required this.id,
    required this.title,
    required this.index,
  });

  final String? id;
  final String? title;
  final int? index;

  @override
  State<StagesDropDownWidget> createState() => _StagesDropDownWidgetState();
}

class _StagesDropDownWidgetState extends State<StagesDropDownWidget> {
  late StagesDropDownModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => StagesDropDownModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().addToStageListState(StageAccessDataTypeStruct(
        id: widget!.id,
        title: widget!.title,
        value: _model.dropDownValue,
      ));
      safeSetState(() {});
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

    return FlutterFlowDropDown<int>(
      controller: _model.dropDownValueController ??= FormFieldController<int>(
        _model.dropDownValue ??= 0,
      ),
      options: List<int>.from([4, 0]),
      optionLabels: ['Show', 'Hide'],
      onChanged: (val) async {
        safeSetState(() => _model.dropDownValue = val);
        FFAppState().updateStageListStateAtIndex(
          widget!.index!,
          (e) => e..value = _model.dropDownValue,
        );
        safeSetState(() {});
      },
      width: 150.0,
      height: 30.0,
      textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
            fontSize: 12.0,
            letterSpacing: 0.0,
            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
          ),
      hintText: 'Select...',
      icon: Icon(
        Icons.keyboard_arrow_down_rounded,
        color: FlutterFlowTheme.of(context).secondaryText,
        size: 24.0,
      ),
      fillColor: FlutterFlowTheme.of(context).secondaryBackground,
      elevation: 2.0,
      borderColor: Colors.transparent,
      borderWidth: 0.0,
      borderRadius: 8.0,
      margin: EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 12.0, 0.0),
      hidesUnderline: true,
      isOverButton: false,
      isSearchable: false,
      isMultiSelect: false,
    );
  }
}
