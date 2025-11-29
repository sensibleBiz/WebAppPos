import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deye_subscription_popup_model.dart';
export 'deye_subscription_popup_model.dart';

class DeyeSubscriptionPopupWidget extends StatefulWidget {
  const DeyeSubscriptionPopupWidget({
    super.key,
    required this.moduleName,
  });

  final SubscriptionModules? moduleName;

  @override
  State<DeyeSubscriptionPopupWidget> createState() =>
      _DeyeSubscriptionPopupWidgetState();
}

class _DeyeSubscriptionPopupWidgetState
    extends State<DeyeSubscriptionPopupWidget> {
  late DeyeSubscriptionPopupModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeyeSubscriptionPopupModel());

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
      child: StreamBuilder<List<ModuleSubscriptionRecord>>(
        stream: queryModuleSubscriptionRecord(
          parent: FFAppState().outletRef,
          queryBuilder: (moduleSubscriptionRecord) =>
              moduleSubscriptionRecord.where(
            'name',
            isEqualTo: widget!.moduleName?.serialize(),
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
          List<ModuleSubscriptionRecord> containerModuleSubscriptionRecordList =
              snapshot.data!;
          // Return an empty Container when the item does not exist.
          if (snapshot.data!.isEmpty) {
            return Container();
          }
          final containerModuleSubscriptionRecord =
              containerModuleSubscriptionRecordList.isNotEmpty
                  ? containerModuleSubscriptionRecordList.first
                  : null;

          return Container(
            width: 450.0,
            height: double.infinity,
            constraints: BoxConstraints(
              maxHeight: 350.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(10.0),
            ),
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(0.0, 0.0),
                      child: Text(
                        getCurrentTimestamp.millisecondsSinceEpoch >=
                                containerModuleSubscriptionRecord!.renewalDate
                            ? 'Your ${widget!.moduleName?.name} Subscription has Expired. Please renew your Subscription by contacting Support.'
                            : 'Your Subscription is about to Expire on: ${dateTimeFormat("dd-MMM-yyyy", DateTime.fromMillisecondsSinceEpoch(containerModuleSubscriptionRecord!.renewalDate))}',
                        textAlign: TextAlign.center,
                        style:
                            FlutterFlowTheme.of(context).headlineSmall.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .headlineSmallFamily,
                                  fontSize: 18.0,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .headlineSmallIsCustom,
                                ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        if (getCurrentTimestamp.millisecondsSinceEpoch >=
                            containerModuleSubscriptionRecord!.renewalDate) {
                          context.pushNamed(DeyeSubscriptionWidget.routeName);
                        } else {
                          Navigator.pop(context);
                        }
                      },
                      text: getCurrentTimestamp.millisecondsSinceEpoch >=
                              containerModuleSubscriptionRecord!.renewalDate
                          ? 'Subscription Page'
                          : 'Ok',
                      options: FFButtonOptions(
                        width: double.infinity,
                        height: 40.0,
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        iconAlignment: IconAlignment.start,
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
                              useGoogleFonts: !FlutterFlowTheme.of(context)
                                  .titleSmallIsCustom,
                            ),
                        elevation: 0.0,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
