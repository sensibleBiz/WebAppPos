import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_failed_model.dart';
export 'popup_failed_model.dart';

class PopupFailedWidget extends StatefulWidget {
  const PopupFailedWidget({super.key});

  @override
  State<PopupFailedWidget> createState() => _PopupFailedWidgetState();
}

class _PopupFailedWidgetState extends State<PopupFailedWidget> {
  late PopupFailedModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupFailedModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(1.0, 0.0),
      child: Container(
        width: 500.0,
        height: 160.0,
        decoration: BoxDecoration(
          color: Color(0xFFFFCECB),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: FlutterFlowTheme.of(context).tertiary,
            width: 0.5,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 6,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(
                    'assets/images/camp-dayz-no.gif',
                    width: 130.0,
                    height: 130.0,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                      child: Text(
                        'Lead creation',
                        style:
                            FlutterFlowTheme.of(context).displayLarge.override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayLargeFamily,
                                  color: Color(0xFF41000B),
                                  fontSize: 26.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayLargeFamily),
                                ),
                      ),
                    ),
                    Text(
                      'Failed !',
                      style: FlutterFlowTheme.of(context).displayLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displayLargeFamily,
                            color: Color(0xFF41000B),
                            fontSize: 40.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: GoogleFonts.asMap().containsKey(
                                FlutterFlowTheme.of(context)
                                    .displayLargeFamily),
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
