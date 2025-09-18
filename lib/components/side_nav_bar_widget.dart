import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'side_nav_bar_model.dart';
export 'side_nav_bar_model.dart';

class SideNavBarWidget extends StatefulWidget {
  const SideNavBarWidget({super.key});

  @override
  State<SideNavBarWidget> createState() => _SideNavBarWidgetState();
}

class _SideNavBarWidgetState extends State<SideNavBarWidget> {
  late SideNavBarModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SideNavBarModel());

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
      width: 60.0,
      height: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).customColor7,
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
              child: Container(
                width: 10.0,
                height: 80.0,
                decoration: BoxDecoration(),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 45.0,
                  hoverIconColor: FlutterFlowTheme.of(context).customColor5,
                  icon: Icon(
                    Icons.person_2,
                    color: FlutterFlowTheme.of(context).text2nd,
                    size: 20.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 45.0,
                  hoverIconColor: FlutterFlowTheme.of(context).customColor5,
                  icon: Icon(
                    Icons.home,
                    color: FlutterFlowTheme.of(context).text2nd,
                    size: 20.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 45.0,
                  hoverIconColor: FlutterFlowTheme.of(context).customColor5,
                  icon: Icon(
                    Icons.dashboard_sharp,
                    color: FlutterFlowTheme.of(context).text2nd,
                    size: 20.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 45.0,
                  hoverIconColor: FlutterFlowTheme.of(context).customColor5,
                  icon: Icon(
                    Icons.bar_chart,
                    color: FlutterFlowTheme.of(context).text2nd,
                    size: 20.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
                FlutterFlowIconButton(
                  borderRadius: 8.0,
                  buttonSize: 45.0,
                  hoverIconColor: FlutterFlowTheme.of(context).customColor5,
                  icon: Icon(
                    Icons.power_settings_new,
                    color: FlutterFlowTheme.of(context).text2nd,
                    size: 20.0,
                  ),
                  onPressed: () {
                    print('IconButton pressed ...');
                  },
                ),
              ].divide(SizedBox(height: 1.0)),
            ),
          ],
        ),
      ),
    );
  }
}
