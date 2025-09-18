import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deye_over_due_popup_model.dart';
export 'deye_over_due_popup_model.dart';

class DeyeOverDuePopupWidget extends StatefulWidget {
  const DeyeOverDuePopupWidget({
    super.key,
    this.document,
  });

  final List<LeadsManagementRecord>? document;

  @override
  State<DeyeOverDuePopupWidget> createState() => _DeyeOverDuePopupWidgetState();
}

class _DeyeOverDuePopupWidgetState extends State<DeyeOverDuePopupWidget> {
  late DeyeOverDuePopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeyeOverDuePopupModel());

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
      width: 450.0,
      height: 550.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Needs Attention',
                  style: FlutterFlowTheme.of(context).displaySmall.override(
                        fontFamily:
                            FlutterFlowTheme.of(context).displaySmallFamily,
                        color: FlutterFlowTheme.of(context).customColor5,
                        letterSpacing: 0.0,
                        useGoogleFonts:
                            !FlutterFlowTheme.of(context).displaySmallIsCustom,
                      ),
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 35.0,
                  fillColor: FlutterFlowTheme.of(context).secondaryBackground,
                  icon: Icon(
                    Icons.close_sharp,
                    color: FlutterFlowTheme.of(context).primary,
                    size: 18.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  final list = widget!.document?.toList() ?? [];

                  return ListView.separated(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: list.length,
                    separatorBuilder: (_, __) => SizedBox(height: 3.0),
                    itemBuilder: (context, listIndex) {
                      final listItem = list[listIndex];
                      return InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          if (FFAppState().billingType == 'CRM') {
                            context.pushNamed(
                              DeyeComplaintDetailViewWidget.routeName,
                              queryParameters: {
                                'leadManagementDocId': serializeParam(
                                  listItem.reference.id,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          } else {
                            context.pushNamed(
                              LeadLogWidget.routeName,
                              queryParameters: {
                                'id': serializeParam(
                                  listItem.id,
                                  ParamType.String,
                                ),
                                'username': serializeParam(
                                  listItem.username,
                                  ParamType.String,
                                ),
                                'mobile': serializeParam(
                                  listItem.mobile,
                                  ParamType.String,
                                ),
                                'state': serializeParam(
                                  listItem.state,
                                  ParamType.String,
                                ),
                                'source': serializeParam(
                                  listItem.source,
                                  ParamType.String,
                                ),
                                'requirement': serializeParam(
                                  listItem.requirement,
                                  ParamType.String,
                                ),
                                'area': serializeParam(
                                  listItem.area,
                                  ParamType.String,
                                ),
                                'city': serializeParam(
                                  listItem.city,
                                  ParamType.String,
                                ),
                                'leadRefId': serializeParam(
                                  listItem.id,
                                  ParamType.String,
                                ),
                              }.withoutNulls,
                            );
                          }

                          context.pushNamed(
                            DeyeComplaintDetailViewWidget.routeName,
                            queryParameters: {
                              'leadManagementDocId': serializeParam(
                                listItem.reference.id,
                                ParamType.String,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 5.0),
                                  child: Text(
                                    listItem.username,
                                    style: FlutterFlowTheme.of(context)
                                        .labelSmall
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .labelSmallFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .labelSmallIsCustom,
                                        ),
                                  ),
                                ),
                                Text(
                                  listItem.requirement,
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .bodyMediumIsCustom,
                                      ),
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: Text(
                                        listItem.state,
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily,
                                              fontSize: 9.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelSmallIsCustom,
                                            ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: Text(
                                        dateTimeFormat(
                                            "relative",
                                            DateTime.fromMillisecondsSinceEpoch(
                                                listItem.updatedDate)),
                                        style: FlutterFlowTheme.of(context)
                                            .labelSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .labelSmallFamily,
                                              fontSize: 9.0,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .labelSmallIsCustom,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ].divide(SizedBox(height: 5.0)),
        ),
      ),
    );
  }
}
