import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/custom_date_range/custom_date_range_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'call_logs_header_model.dart';
export 'call_logs_header_model.dart';

class CallLogsHeaderWidget extends StatefulWidget {
  const CallLogsHeaderWidget({super.key});

  @override
  State<CallLogsHeaderWidget> createState() => _CallLogsHeaderWidgetState();
}

class _CallLogsHeaderWidgetState extends State<CallLogsHeaderWidget> {
  late CallLogsHeaderModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CallLogsHeaderModel());

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
      width: double.infinity,
      height: 100.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).primary,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 20.0, 0.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: Icon(
                      Icons.chevron_left,
                      color: FlutterFlowTheme.of(context).primaryBtnText,
                      size: 24.0,
                    ),
                    onPressed: () async {
                      context.safePop();
                    },
                  ),
                ),
                Text(
                  'Call Logs',
                  style: FlutterFlowTheme.of(context).displayLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).displayLargeFamily,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        fontSize: 24.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).displayLargeIsCustom,
                      ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  functions
                              .getTodayDateInMili(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      FFAppState().startDate))
                              .toString() ==
                          functions
                              .getTodayDateInMili(
                                  DateTime.fromMillisecondsSinceEpoch(
                                      FFAppState().endDate))
                              .toString()
                      ? dateTimeFormat("dd-MMM-yy", FFAppState().endDateShow)
                      : '${dateTimeFormat("dd-MMM-yy", DateTime.fromMillisecondsSinceEpoch(FFAppState().startDate))} To ${dateTimeFormat("dd-MMM-yy", FFAppState().endDateShow)}',
                  style: FlutterFlowTheme.of(context).labelLarge.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).labelLargeFamily,
                        color: FlutterFlowTheme.of(context).primaryBtnText,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).labelLargeIsCustom,
                      ),
                ),
                Builder(
                  builder: (context) => FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                    icon: Icon(
                      Icons.calendar_month,
                      color: FlutterFlowTheme.of(context).lineColor,
                      size: 24.0,
                    ),
                    onPressed: () async {
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
                              child: CustomDateRangeWidget(),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              ].divide(SizedBox(width: 20.0)),
            ),
          ],
        ),
      ),
    );
  }
}
