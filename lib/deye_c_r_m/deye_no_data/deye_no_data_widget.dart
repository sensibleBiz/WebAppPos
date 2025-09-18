import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deye_no_data_model.dart';
export 'deye_no_data_model.dart';

class DeyeNoDataWidget extends StatefulWidget {
  const DeyeNoDataWidget({
    super.key,
    required this.message,
  });

  final String? message;

  @override
  State<DeyeNoDataWidget> createState() => _DeyeNoDataWidgetState();
}

class _DeyeNoDataWidgetState extends State<DeyeNoDataWidget> {
  late DeyeNoDataModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeyeNoDataModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      height: 300.0,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                'assets/images/17771135.gif',
                width: 200.0,
                height: 200.0,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              valueOrDefault<String>(
                widget!.message,
                'No Data Found',
              ),
              style: FlutterFlowTheme.of(context).headlineLarge.override(
                    fontFamily:
                        FlutterFlowTheme.of(context).headlineLargeFamily,
                    color: FlutterFlowTheme.of(context).customColor5,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w600,
                    useGoogleFonts:
                        !FlutterFlowTheme.of(context).headlineLargeIsCustom,
                  ),
            ),
          ].divide(SizedBox(height: 10.0)),
        ),
      ),
    );
  }
}
