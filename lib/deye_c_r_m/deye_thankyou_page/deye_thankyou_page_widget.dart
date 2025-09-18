import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deye_thankyou_page_model.dart';
export 'deye_thankyou_page_model.dart';

class DeyeThankyouPageWidget extends StatefulWidget {
  const DeyeThankyouPageWidget({super.key});

  static String routeName = 'DeyeThankyouPage';
  static String routePath = 'DeyeThankyouPage';

  @override
  State<DeyeThankyouPageWidget> createState() => _DeyeThankyouPageWidgetState();
}

class _DeyeThankyouPageWidgetState extends State<DeyeThankyouPageWidget> {
  late DeyeThankyouPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeyeThankyouPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Title(
        title: 'DeyeThankyouPage',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: PopScope(
            canPop: false,
            child: Scaffold(
              key: scaffoldKey,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
              body: Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).back2nd,
                ),
                child: Padding(
                  padding: EdgeInsets.all(45.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.thumb_up,
                        color: FlutterFlowTheme.of(context).customColor6,
                        size: 50.0,
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Thank you ',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displayLarge
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayLargeFamily,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.w600,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .displayLargeIsCustom,
                                ),
                          ),
                          Text(
                            'for contacting us !',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context)
                                .displayMedium
                                .override(
                                  fontFamily: FlutterFlowTheme.of(context)
                                      .displayMediumFamily,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: !FlutterFlowTheme.of(context)
                                      .displayMediumIsCustom,
                                ),
                          ),
                        ].divide(SizedBox(height: 5.0)),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: 200.0,
                          height: 90.0,
                          fit: BoxFit.none,
                        ),
                      ),
                    ].divide(SizedBox(height: 40.0)),
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
