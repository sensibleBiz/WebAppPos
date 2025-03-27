import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_success_model.dart';
export 'popup_success_model.dart';

class PopupSuccessWidget extends StatefulWidget {
  const PopupSuccessWidget({super.key});

  @override
  State<PopupSuccessWidget> createState() => _PopupSuccessWidgetState();
}

class _PopupSuccessWidgetState extends State<PopupSuccessWidget> {
  late PopupSuccessModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupSuccessModel());

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
          color: Color(0xFFECFFCB),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 6,
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20.0),
                    child: Image.asset(
                      'assets/images/verified.gif',
                      width: 130.0,
                      height: 130.0,
                      fit: BoxFit.fitHeight,
                    ),
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
                                  color: Color(0xFF2C4100),
                                  fontSize: 26.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: GoogleFonts.asMap()
                                      .containsKey(FlutterFlowTheme.of(context)
                                          .displayLargeFamily),
                                ),
                      ),
                    ),
                    Text(
                      'Successfull !',
                      style: FlutterFlowTheme.of(context).displayLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displayLargeFamily,
                            color: Color(0xFF375401),
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
