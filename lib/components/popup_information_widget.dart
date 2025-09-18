import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'popup_information_model.dart';
export 'popup_information_model.dart';

class PopupInformationWidget extends StatefulWidget {
  const PopupInformationWidget({super.key});

  @override
  State<PopupInformationWidget> createState() => _PopupInformationWidgetState();
}

class _PopupInformationWidgetState extends State<PopupInformationWidget> {
  late PopupInformationModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PopupInformationModel());

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
          color: Color(0xFFCBE5FF),
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
                    'assets/images/info_Animation_-_1738148400648.gif',
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
                                  color: Color(0xFF000241),
                                  fontSize: 26.0,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .displayLargeIsCustom,
                                ),
                      ),
                    ),
                    Text(
                      'Information !',
                      style: FlutterFlowTheme.of(context).displayLarge.override(
                            fontFamily:
                                FlutterFlowTheme.of(context).displayLargeFamily,
                            color: Color(0xFF000241),
                            fontSize: 40.0,
                            letterSpacing: 0.0,
                            useGoogleFonts: !FlutterFlowTheme.of(context)
                                .displayLargeIsCustom,
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
