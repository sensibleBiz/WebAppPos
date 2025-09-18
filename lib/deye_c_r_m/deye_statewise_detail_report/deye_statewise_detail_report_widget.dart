import '/backend/backend.dart';
import '/deye_c_r_m/deye_header/deye_header_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/list_view_msg/list_view_msg_widget.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'deye_statewise_detail_report_model.dart';
export 'deye_statewise_detail_report_model.dart';

class DeyeStatewiseDetailReportWidget extends StatefulWidget {
  const DeyeStatewiseDetailReportWidget({
    super.key,
    this.state,
    this.docs,
  });

  final String? state;
  final List<LeadsManagementRecord>? docs;

  static String routeName = 'DeyeStatewiseDetailReport';
  static String routePath = 'deyeStatewiseDetailReport';

  @override
  State<DeyeStatewiseDetailReportWidget> createState() =>
      _DeyeStatewiseDetailReportWidgetState();
}

class _DeyeStatewiseDetailReportWidgetState
    extends State<DeyeStatewiseDetailReportWidget> {
  late DeyeStatewiseDetailReportModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DeyeStatewiseDetailReportModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<OutletRecord>>(
      stream: queryOutletRecord(
        queryBuilder: (outletRecord) => outletRecord.where(
          'id',
          isEqualTo: FFAppState().outletRef?.id,
        ),
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).back2nd,
            body: Center(
              child: SizedBox(
                width: 30.0,
                height: 30.0,
                child: SpinKitRing(
                  color: FlutterFlowTheme.of(context).primary,
                  size: 30.0,
                ),
              ),
            ),
          );
        }
        List<OutletRecord> deyeStatewiseDetailReportOutletRecordList =
            snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final deyeStatewiseDetailReportOutletRecord =
            deyeStatewiseDetailReportOutletRecordList.isNotEmpty
                ? deyeStatewiseDetailReportOutletRecordList.first
                : null;

        return Title(
            title: 'DeyeStatewiseDetailReport',
            color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: Scaffold(
                key: scaffoldKey,
                backgroundColor: FlutterFlowTheme.of(context).back2nd,
                body: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      flex: 3,
                      child: wrapWithModel(
                        model: _model.deyeHeaderModel,
                        updateCallback: () => safeSetState(() {}),
                        child: DeyeHeaderWidget(),
                      ),
                    ),
                    Expanded(
                      flex: 35,
                      child: Container(
                        width: double.infinity,
                        height: 100.0,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: FlutterFlowIconButton(
                                        borderRadius: 8.0,
                                        buttonSize: 40.0,
                                        icon: Icon(
                                          Icons.arrow_back,
                                          color:
                                              FlutterFlowTheme.of(context).info,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.safePop();
                                        },
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      10.0, 0.0, 0.0, 0.0),
                                              child: Text(
                                                valueOrDefault<String>(
                                                  widget!.state,
                                                  '-',
                                                ),
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .labelLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor5,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLargeIsCustom,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  functions.milisecToTimestamp(
                                                      FFAppState().startDate),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmallIsCustom,
                                                      ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Text(
                                                  '-  ${functions.milisecToTimestamp(FFAppState().endDate)}',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .labelSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .labelSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .lineColor,
                                                        fontSize: 12.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .labelSmallIsCustom,
                                                      ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ].divide(SizedBox(width: 15.0)),
                              ),
                              Expanded(
                                child: Container(
                                  height: 500.0,
                                  decoration: BoxDecoration(),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: Container(
                                          width: 200.0,
                                          decoration: BoxDecoration(),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        2.0, 0.0, 3.0, 10.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    FFAppState().showStatus =
                                                        false;
                                                    FFAppState()
                                                        .dropDownStatus = 'ALL';
                                                    safeSetState(() {});
                                                  },
                                                  text: 'All',
                                                  options: FFButtonOptions(
                                                    width: double.infinity,
                                                    height: 40.0,
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    iconPadding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 0.0),
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    textStyle:
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .headlineLarge
                                                            .override(
                                                              fontFamily:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeFamily,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .customColor5,
                                                              letterSpacing:
                                                                  0.0,
                                                              useGoogleFonts:
                                                                  !FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineLargeIsCustom,
                                                            ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color: FFAppState()
                                                                  .showStatus ==
                                                              false
                                                          ? Color(0xFF216CE4)
                                                          : Color(0x00000000),
                                                      width: 2.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: StreamBuilder<
                                                    List<LeadStagesRecord>>(
                                                  stream: queryLeadStagesRecord(
                                                    parent:
                                                        FFAppState().outletRef,
                                                  ),
                                                  builder: (context, snapshot) {
                                                    // Customize what your widget looks like when it's loading.
                                                    if (!snapshot.hasData) {
                                                      return Center(
                                                        child: SizedBox(
                                                          width: 30.0,
                                                          height: 30.0,
                                                          child: SpinKitRing(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primary,
                                                            size: 30.0,
                                                          ),
                                                        ),
                                                      );
                                                    }
                                                    List<LeadStagesRecord>
                                                        columnLeadStagesRecordList =
                                                        snapshot.data!;

                                                    return Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: List.generate(
                                                          columnLeadStagesRecordList
                                                              .length,
                                                          (columnIndex) {
                                                        final columnLeadStagesRecord =
                                                            columnLeadStagesRecordList[
                                                                columnIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      2.0,
                                                                      5.0,
                                                                      3.0,
                                                                      5.0),
                                                          child: FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              FFAppState()
                                                                      .dropDownStatus =
                                                                  columnLeadStagesRecord
                                                                      .name;
                                                              FFAppState()
                                                                      .showStatus =
                                                                  true;
                                                              safeSetState(
                                                                  () {});
                                                            },
                                                            text:
                                                                columnLeadStagesRecord
                                                                    .display,
                                                            options:
                                                                FFButtonOptions(
                                                              width: double
                                                                  .infinity,
                                                              height: 40.0,
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(0.0),
                                                              iconPadding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMedium
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).titleMediumFamily,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                      ),
                                                              elevation: 2.0,
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FFAppState()
                                                                            .dropDownStatus ==
                                                                        columnLeadStagesRecord
                                                                            .name
                                                                    ? Color(
                                                                        0xFF216CE4)
                                                                    : Color(
                                                                        0x00000000),
                                                                width: 2.0,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8.0),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 8,
                                        child: Stack(
                                          children: [
                                            if (!FFAppState().showStatus)
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Container(
                                                        height: 35.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFA5A8B1),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  'SR. No.',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  'TICKET',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 5,
                                                                child: Text(
                                                                  'CUSTOMER',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  'MOBILE',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  'CITY',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  'SERIAL NO.',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 4,
                                                                child: Text(
                                                                  'STATUS',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              if (false)
                                                                Expanded(
                                                                  flex: 3,
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      Text(
                                                                        'Total:',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                      Text(
                                                                        '',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .labelLarge
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_back,
                                                                  color: Color(
                                                                      0x000D0801),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final containerVar = widget!
                                                                        .docs
                                                                        ?.map((e) =>
                                                                            e)
                                                                        .toList()
                                                                        ?.toList() ??
                                                                    [];
                                                                if (containerVar
                                                                    .isEmpty) {
                                                                  return ListViewMsgWidget();
                                                                }

                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      containerVar
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          height:
                                                                              10.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          containerVarIndex) {
                                                                    final containerVarItem =
                                                                        containerVar[
                                                                            containerVarIndex];
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          child:
                                                                              ExpandableNotifier(
                                                                            initialExpanded:
                                                                                false,
                                                                            child:
                                                                                ExpandablePanel(
                                                                              header: Container(
                                                                                width: 100.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(10.0),
                                                                                    topRight: Radius.circular(10.0),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 0.0, 7.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          '${(containerVarIndex + 1).toString()}.',
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                color: FlutterFlowTheme.of(context).customColor6,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: SelectionArea(
                                                                                            child: Text(
                                                                                          containerVarItem.ticket,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                color: FlutterFlowTheme.of(context).customColor5,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        )),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 7,
                                                                                        child: Text(
                                                                                          containerVarItem.username,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: SelectionArea(
                                                                                            child: AutoSizeText(
                                                                                          containerVarItem.mobile,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        )),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 4,
                                                                                        child: Text(
                                                                                          containerVarItem.city,
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: Text(
                                                                                          containerVarItem.customFields.serial,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 4,
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {},
                                                                                          child: Text(
                                                                                            functions.toCapitalLetter(valueOrDefault<String>(
                                                                                              containerVarItem.stage,
                                                                                              '-',
                                                                                            )),
                                                                                            textAlign: TextAlign.end,
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).customColor5,
                                                                                                  letterSpacing: 1.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                              tabletLandscape: false,
                                                                                            ))
                                                                                              FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 30.0,
                                                                                                buttonSize: 30.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                icon: Icon(
                                                                                                  Icons.edit_square,
                                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                                  size: 12.0,
                                                                                                ),
                                                                                                onPressed: FFAppState().readOnlyAccess
                                                                                                    ? null
                                                                                                    : () async {
                                                                                                        context.pushNamed(
                                                                                                          DeyeComplaintEditDetailsWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'mobile': serializeParam(
                                                                                                              containerVarItem.mobile,
                                                                                                              ParamType.String,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      },
                                                                                              ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              collapsed: Container(),
                                                                              expanded: Container(
                                                                                decoration: BoxDecoration(),
                                                                                child: Container(
                                                                                  width: double.infinity,
                                                                                  decoration: BoxDecoration(
                                                                                    color: Color(0xFFEAF2FF),
                                                                                    borderRadius: BorderRadius.only(
                                                                                      bottomLeft: Radius.circular(0.0),
                                                                                      bottomRight: Radius.circular(0.0),
                                                                                      topLeft: Radius.circular(0.0),
                                                                                      topRight: Radius.circular(0.0),
                                                                                    ),
                                                                                  ),
                                                                                  child: Padding(
                                                                                    padding: EdgeInsets.all(10.0),
                                                                                    child: Column(
                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                                      children: [
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Type :',
                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  StreamBuilder<List<CategoryRecord>>(
                                                                                                    stream: queryCategoryRecord(
                                                                                                      parent: FFAppState().outletRef,
                                                                                                      queryBuilder: (categoryRecord) => categoryRecord.where(
                                                                                                        'id',
                                                                                                        isEqualTo: containerVarItem.customFields.productType,
                                                                                                      ),
                                                                                                      singleRecord: true,
                                                                                                    ),
                                                                                                    builder: (context, snapshot) {
                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                      if (!snapshot.hasData) {
                                                                                                        return Center(
                                                                                                          child: SizedBox(
                                                                                                            width: 40.0,
                                                                                                            height: 40.0,
                                                                                                            child: CircularProgressIndicator(
                                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                Color(0xFFEAF2FF),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                      List<CategoryRecord> textCategoryRecordList = snapshot.data!;
                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                        return Container();
                                                                                                      }
                                                                                                      final textCategoryRecord = textCategoryRecordList.isNotEmpty ? textCategoryRecordList.first : null;

                                                                                                      return SelectionArea(
                                                                                                          child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          textCategoryRecord?.name,
                                                                                                          '-',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      ));
                                                                                                    },
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Capacity :',
                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  StreamBuilder<List<ProductRecord>>(
                                                                                                    stream: queryProductRecord(
                                                                                                      parent: FFAppState().outletRef,
                                                                                                      queryBuilder: (productRecord) => productRecord.where(
                                                                                                        'id',
                                                                                                        isEqualTo: containerVarItem.customFields.capacity,
                                                                                                      ),
                                                                                                      singleRecord: true,
                                                                                                    ),
                                                                                                    builder: (context, snapshot) {
                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                      if (!snapshot.hasData) {
                                                                                                        return Center(
                                                                                                          child: SizedBox(
                                                                                                            width: 40.0,
                                                                                                            height: 40.0,
                                                                                                            child: CircularProgressIndicator(
                                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                Color(0xFFEAF2FF),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                      List<ProductRecord> textProductRecordList = snapshot.data!;
                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                        return Container();
                                                                                                      }
                                                                                                      final textProductRecord = textProductRecordList.isNotEmpty ? textProductRecordList.first : null;

                                                                                                      return SelectionArea(
                                                                                                          child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          textProductRecord?.name,
                                                                                                          '-',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      ));
                                                                                                    },
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 2,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Purchased from :',
                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    containerVarItem.customFields.purchasedFrom,
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              child: Text(
                                                                                                dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(containerVarItem.createdDate)),
                                                                                                textAlign: TextAlign.end,
                                                                                                style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                      fontSize: 13.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                        ),
                                                                                        Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          children: [
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Assign to :',
                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  StreamBuilder<List<UserProfileRecord>>(
                                                                                                    stream: queryUserProfileRecord(
                                                                                                      queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                        'id',
                                                                                                        isEqualTo: containerVarItem.assignedTo,
                                                                                                      ),
                                                                                                      singleRecord: true,
                                                                                                    ),
                                                                                                    builder: (context, snapshot) {
                                                                                                      // Customize what your widget looks like when it's loading.
                                                                                                      if (!snapshot.hasData) {
                                                                                                        return Center(
                                                                                                          child: SizedBox(
                                                                                                            width: 40.0,
                                                                                                            height: 40.0,
                                                                                                            child: CircularProgressIndicator(
                                                                                                              valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                                Color(0xFFEAF2FF),
                                                                                                              ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        );
                                                                                                      }
                                                                                                      List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                      // Return an empty Container when the item does not exist.
                                                                                                      if (snapshot.data!.isEmpty) {
                                                                                                        return Container();
                                                                                                      }
                                                                                                      final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                      return InkWell(
                                                                                                        splashColor: Colors.transparent,
                                                                                                        focusColor: Colors.transparent,
                                                                                                        hoverColor: Colors.transparent,
                                                                                                        highlightColor: Colors.transparent,
                                                                                                        onTap: () async {},
                                                                                                        child: Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUserProfileRecord?.name,
                                                                                                            '--',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                                color: FlutterFlowTheme.of(context).customColor4,
                                                                                                                letterSpacing: 0.0,
                                                                                                                fontWeight: FontWeight.w600,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                              ),
                                                                                                        ),
                                                                                                      );
                                                                                                    },
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Remark :',
                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  Text(
                                                                                                    containerVarItem.remarks,
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                            Expanded(
                                                                                              flex: 1,
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                children: [
                                                                                                  Text(
                                                                                                    'Comments',
                                                                                                    style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                          color: FlutterFlowTheme.of(context).text2nd,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                        ),
                                                                                                  ),
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    containerVarItem.comments,
                                                                                                    style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                          fontSize: 12.0,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                ].divide(SizedBox(width: 5.0)),
                                                                                              ),
                                                                                            ),
                                                                                          ].divide(SizedBox(width: 10.0)),
                                                                                        ),
                                                                                        Padding(
                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                          child: SelectionArea(
                                                                                              child: Text(
                                                                                            valueOrDefault<String>(
                                                                                              functions.leadsReq(containerVarItem.requirement),
                                                                                              'Requirement not specified',
                                                                                            ),
                                                                                            textAlign: TextAlign.start,
                                                                                            style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                  color: FlutterFlowTheme.of(context).customColor5,
                                                                                                  letterSpacing: 0.0,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                                ),
                                                                                          )),
                                                                                        ),
                                                                                        Container(
                                                                                          decoration: BoxDecoration(
                                                                                            color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                            borderRadius: BorderRadius.circular(7.0),
                                                                                          ),
                                                                                          child: Padding(
                                                                                            padding: EdgeInsets.all(5.0),
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.min,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Actions Taken :',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                        StreamBuilder<List<LeadActivitiesRecord>>(
                                                                                          stream: queryLeadActivitiesRecord(
                                                                                            parent: FFAppState().outletRef,
                                                                                            queryBuilder: (leadActivitiesRecord) => leadActivitiesRecord
                                                                                                .where(
                                                                                                  'leadRefId',
                                                                                                  isEqualTo: containerVarItem.id,
                                                                                                )
                                                                                                .orderBy('scheduledDate', descending: true),
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
                                                                                            List<LeadActivitiesRecord> listViewLeadActivitiesRecordList = snapshot.data!;

                                                                                            return ListView.separated(
                                                                                              padding: EdgeInsets.zero,
                                                                                              shrinkWrap: true,
                                                                                              scrollDirection: Axis.vertical,
                                                                                              itemCount: listViewLeadActivitiesRecordList.length,
                                                                                              separatorBuilder: (_, __) => SizedBox(height: 5.0),
                                                                                              itemBuilder: (context, listViewIndex) {
                                                                                                final listViewLeadActivitiesRecord = listViewLeadActivitiesRecordList[listViewIndex];
                                                                                                return Container(
                                                                                                  decoration: BoxDecoration(
                                                                                                    borderRadius: BorderRadius.circular(7.0),
                                                                                                    border: Border.all(
                                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                      width: 1.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                  child: Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      children: [
                                                                                                        Expanded(
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Text(
                                                                                                                listViewLeadActivitiesRecord.description,
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      fontSize: 13.0,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                    ),
                                                                                                              ),
                                                                                                              Expanded(
                                                                                                                child: Text(
                                                                                                                  listViewLeadActivitiesRecord.solution,
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        color: FlutterFlowTheme.of(context).customColor5,
                                                                                                                        fontSize: 13.0,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        fontWeight: FontWeight.bold,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                ),
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Text(
                                                                                                          dateTimeFormat("relative", DateTime.fromMillisecondsSinceEpoch(listViewLeadActivitiesRecord.scheduledDate)),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).customColor6,
                                                                                                                fontSize: 10.0,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                );
                                                                                              },
                                                                                            );
                                                                                          },
                                                                                        ),
                                                                                        Expanded(
                                                                                          flex: 1,
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Complaint closed on : ${containerVarItem.closeDate}',
                                                                                                style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                      color: FlutterFlowTheme.of(context).customColor5,
                                                                                                      fontSize: 12.0,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ].divide(SizedBox(width: 5.0)),
                                                                                          ),
                                                                                        ),
                                                                                      ].divide(SizedBox(height: 6.0)),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              theme: ExpandableThemeData(
                                                                                tapHeaderToExpand: true,
                                                                                tapBodyToExpand: false,
                                                                                tapBodyToCollapse: false,
                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                hasIcon: true,
                                                                                iconSize: 24.0,
                                                                                iconColor: FlutterFlowTheme.of(context).customColor4,
                                                                                iconPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            if (FFAppState().showStatus)
                                              Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0.0,
                                                                  0.0,
                                                                  0.0,
                                                                  5.0),
                                                      child: Container(
                                                        height: 35.0,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFA5A8B1),
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    0.0),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    0.0),
                                                            topLeft:
                                                                Radius.circular(
                                                                    10.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    10.0),
                                                          ),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      10.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Text(
                                                                  'SR. No.',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .start,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  'TICKET',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 7,
                                                                child: Text(
                                                                  'CUSTOMER',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  'MOBILE',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 4,
                                                                child: Text(
                                                                  'CITY',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Text(
                                                                  'SERIAL NO.',
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 4,
                                                                child: Text(
                                                                  'STATUS',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyLarge
                                                                      .override(
                                                                        fontFamily:
                                                                            FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryBtnText,
                                                                        fontSize:
                                                                            12.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        useGoogleFonts:
                                                                            !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                      ),
                                                                ),
                                                              ),
                                                              Expanded(
                                                                flex: 3,
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceAround,
                                                                  children: [],
                                                                ),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            10.0,
                                                                            0.0),
                                                                child: Icon(
                                                                  Icons
                                                                      .arrow_back,
                                                                  color: Color(
                                                                      0x000D0801),
                                                                  size: 24.0,
                                                                ),
                                                              ),
                                                            ].divide(SizedBox(
                                                                width: 10.0)),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Stack(
                                                        children: [
                                                          Container(
                                                            width:
                                                                double.infinity,
                                                            decoration:
                                                                BoxDecoration(),
                                                            child: Builder(
                                                              builder:
                                                                  (context) {
                                                                final containerVar = widget!
                                                                        .docs
                                                                        ?.where((e) =>
                                                                            e.stage ==
                                                                            FFAppState().dropDownStatus)
                                                                        .toList()
                                                                        ?.toList() ??
                                                                    [];
                                                                if (containerVar
                                                                    .isEmpty) {
                                                                  return ListViewMsgWidget();
                                                                }

                                                                return ListView
                                                                    .separated(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .zero,
                                                                  scrollDirection:
                                                                      Axis.vertical,
                                                                  itemCount:
                                                                      containerVar
                                                                          .length,
                                                                  separatorBuilder: (_,
                                                                          __) =>
                                                                      SizedBox(
                                                                          height:
                                                                              2.0),
                                                                  itemBuilder:
                                                                      (context,
                                                                          containerVarIndex) {
                                                                    final containerVarItem =
                                                                        containerVar[
                                                                            containerVarIndex];
                                                                    return ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0),
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10.0),
                                                                        ),
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              double.infinity,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          child:
                                                                              ExpandableNotifier(
                                                                            initialExpanded:
                                                                                false,
                                                                            child:
                                                                                ExpandablePanel(
                                                                              header: Container(
                                                                                width: 100.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(10.0),
                                                                                    topRight: Radius.circular(10.0),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(10.0, 7.0, 0.0, 7.0),
                                                                                  child: Row(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    children: [
                                                                                      Expanded(
                                                                                        child: Text(
                                                                                          '${(containerVarIndex + 1).toString()}.',
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                color: FlutterFlowTheme.of(context).customColor6,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: SelectionArea(
                                                                                            child: Text(
                                                                                          containerVarItem.ticket,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                color: FlutterFlowTheme.of(context).customColor5,
                                                                                                fontSize: 16.0,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        )),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 7,
                                                                                        child: Text(
                                                                                          containerVarItem.username,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                fontWeight: FontWeight.w600,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: SelectionArea(
                                                                                            child: AutoSizeText(
                                                                                          containerVarItem.mobile,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        )),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 4,
                                                                                        child: Text(
                                                                                          containerVarItem.city,
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: Text(
                                                                                          containerVarItem.customFields.serial,
                                                                                          style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                              ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 4,
                                                                                        child: InkWell(
                                                                                          splashColor: Colors.transparent,
                                                                                          focusColor: Colors.transparent,
                                                                                          hoverColor: Colors.transparent,
                                                                                          highlightColor: Colors.transparent,
                                                                                          onTap: () async {},
                                                                                          child: Text(
                                                                                            functions.toCapitalLetter(valueOrDefault<String>(
                                                                                              containerVarItem.stage,
                                                                                              '-',
                                                                                            )),
                                                                                            textAlign: TextAlign.end,
                                                                                            style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                  fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                  color: FlutterFlowTheme.of(context).customColor5,
                                                                                                  letterSpacing: 1.0,
                                                                                                  fontWeight: FontWeight.w600,
                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                ),
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Expanded(
                                                                                        flex: 3,
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.end,
                                                                                          children: [
                                                                                            if (responsiveVisibility(
                                                                                              context: context,
                                                                                              phone: false,
                                                                                              tablet: false,
                                                                                              tabletLandscape: false,
                                                                                            ))
                                                                                              FlutterFlowIconButton(
                                                                                                borderColor: Colors.transparent,
                                                                                                borderRadius: 30.0,
                                                                                                buttonSize: 30.0,
                                                                                                fillColor: FlutterFlowTheme.of(context).tertiary,
                                                                                                icon: Icon(
                                                                                                  Icons.edit_square,
                                                                                                  color: FlutterFlowTheme.of(context).lineColor,
                                                                                                  size: 12.0,
                                                                                                ),
                                                                                                onPressed: FFAppState().readOnlyAccess
                                                                                                    ? null
                                                                                                    : () async {
                                                                                                        context.pushNamed(
                                                                                                          DeyeComplaintEditDetailsWidget.routeName,
                                                                                                          queryParameters: {
                                                                                                            'mobile': serializeParam(
                                                                                                              containerVarItem.mobile,
                                                                                                              ParamType.String,
                                                                                                            ),
                                                                                                          }.withoutNulls,
                                                                                                        );
                                                                                                      },
                                                                                              ),
                                                                                          ].divide(SizedBox(width: 5.0)),
                                                                                        ),
                                                                                      ),
                                                                                    ].divide(SizedBox(width: 10.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              collapsed: Container(),
                                                                              expanded: Container(
                                                                                width: double.infinity,
                                                                                decoration: BoxDecoration(
                                                                                  color: Color(0xFFEAF2FF),
                                                                                  borderRadius: BorderRadius.only(
                                                                                    bottomLeft: Radius.circular(0.0),
                                                                                    bottomRight: Radius.circular(0.0),
                                                                                    topLeft: Radius.circular(0.0),
                                                                                    topRight: Radius.circular(0.0),
                                                                                  ),
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(10.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 1,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Type :',
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                        color: FlutterFlowTheme.of(context).text2nd,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                StreamBuilder<List<CategoryRecord>>(
                                                                                                  stream: queryCategoryRecord(
                                                                                                    parent: FFAppState().outletRef,
                                                                                                    queryBuilder: (categoryRecord) => categoryRecord.where(
                                                                                                      'id',
                                                                                                      isEqualTo: containerVarItem.customFields.productType,
                                                                                                    ),
                                                                                                    singleRecord: true,
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 40.0,
                                                                                                          height: 40.0,
                                                                                                          child: CircularProgressIndicator(
                                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                              Color(0xFFEAF2FF),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<CategoryRecord> textCategoryRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final textCategoryRecord = textCategoryRecordList.isNotEmpty ? textCategoryRecordList.first : null;

                                                                                                    return SelectionArea(
                                                                                                        child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        textCategoryRecord?.name,
                                                                                                        '-',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                          ),
                                                                                                    ));
                                                                                                  },
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 1,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Capacity :',
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                        color: FlutterFlowTheme.of(context).text2nd,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                StreamBuilder<List<ProductRecord>>(
                                                                                                  stream: queryProductRecord(
                                                                                                    parent: FFAppState().outletRef,
                                                                                                    queryBuilder: (productRecord) => productRecord.where(
                                                                                                      'id',
                                                                                                      isEqualTo: containerVarItem.customFields.capacity,
                                                                                                    ),
                                                                                                    singleRecord: true,
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 40.0,
                                                                                                          height: 40.0,
                                                                                                          child: CircularProgressIndicator(
                                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                              Color(0xFFEAF2FF),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<ProductRecord> textProductRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final textProductRecord = textProductRecordList.isNotEmpty ? textProductRecordList.first : null;

                                                                                                    return SelectionArea(
                                                                                                        child: Text(
                                                                                                      valueOrDefault<String>(
                                                                                                        textProductRecord?.name,
                                                                                                        '-',
                                                                                                      ),
                                                                                                      style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                          ),
                                                                                                    ));
                                                                                                  },
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 2,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Purchased from :',
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                        color: FlutterFlowTheme.of(context).text2nd,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                Text(
                                                                                                  containerVarItem.customFields.purchasedFrom,
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            child: Text(
                                                                                              dateTimeFormat("yMMMd", DateTime.fromMillisecondsSinceEpoch(containerVarItem.createdDate)),
                                                                                              textAlign: TextAlign.end,
                                                                                              style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                    fontSize: 13.0,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            flex: 1,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Assign to :',
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                        color: FlutterFlowTheme.of(context).text2nd,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                StreamBuilder<List<UserProfileRecord>>(
                                                                                                  stream: queryUserProfileRecord(
                                                                                                    queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                      'id',
                                                                                                      isEqualTo: containerVarItem.assignedTo,
                                                                                                    ),
                                                                                                    singleRecord: true,
                                                                                                  ),
                                                                                                  builder: (context, snapshot) {
                                                                                                    // Customize what your widget looks like when it's loading.
                                                                                                    if (!snapshot.hasData) {
                                                                                                      return Center(
                                                                                                        child: SizedBox(
                                                                                                          width: 40.0,
                                                                                                          height: 40.0,
                                                                                                          child: CircularProgressIndicator(
                                                                                                            valueColor: AlwaysStoppedAnimation<Color>(
                                                                                                              Color(0xFFEAF2FF),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ),
                                                                                                      );
                                                                                                    }
                                                                                                    List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                    // Return an empty Container when the item does not exist.
                                                                                                    if (snapshot.data!.isEmpty) {
                                                                                                      return Container();
                                                                                                    }
                                                                                                    final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                    return InkWell(
                                                                                                      splashColor: Colors.transparent,
                                                                                                      focusColor: Colors.transparent,
                                                                                                      hoverColor: Colors.transparent,
                                                                                                      highlightColor: Colors.transparent,
                                                                                                      onTap: () async {},
                                                                                                      child: Text(
                                                                                                        valueOrDefault<String>(
                                                                                                          textUserProfileRecord?.name,
                                                                                                          '--',
                                                                                                        ),
                                                                                                        style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                              color: FlutterFlowTheme.of(context).customColor4,
                                                                                                              letterSpacing: 0.0,
                                                                                                              fontWeight: FontWeight.w600,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    );
                                                                                                  },
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 1,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.start,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Remark :',
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                        color: FlutterFlowTheme.of(context).text2nd,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                Text(
                                                                                                  containerVarItem.remarks,
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                              ].divide(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          ),
                                                                                          Expanded(
                                                                                            flex: 1,
                                                                                            child: Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              children: [
                                                                                                Text(
                                                                                                  'Comments',
                                                                                                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyLargeFamily,
                                                                                                        color: FlutterFlowTheme.of(context).text2nd,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyLargeIsCustom,
                                                                                                      ),
                                                                                                ),
                                                                                                SelectionArea(
                                                                                                    child: Text(
                                                                                                  containerVarItem.comments,
                                                                                                  style: FlutterFlowTheme.of(context).labelSmall.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).labelSmallFamily,
                                                                                                        fontSize: 12.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).labelSmallIsCustom,
                                                                                                      ),
                                                                                                )),
                                                                                              ].divide(SizedBox(width: 5.0)),
                                                                                            ),
                                                                                          ),
                                                                                        ].divide(SizedBox(width: 10.0)),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 3.0, 0.0, 0.0),
                                                                                        child: SelectionArea(
                                                                                            child: Text(
                                                                                          valueOrDefault<String>(
                                                                                            functions.leadsReq(containerVarItem.requirement),
                                                                                            'Requirement not specified',
                                                                                          ),
                                                                                          textAlign: TextAlign.start,
                                                                                          style: FlutterFlowTheme.of(context).labelLarge.override(
                                                                                                fontFamily: FlutterFlowTheme.of(context).labelLargeFamily,
                                                                                                color: FlutterFlowTheme.of(context).customColor5,
                                                                                                letterSpacing: 0.0,
                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).labelLargeIsCustom,
                                                                                              ),
                                                                                        )),
                                                                                      ),
                                                                                      Container(
                                                                                        decoration: BoxDecoration(
                                                                                          color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                          borderRadius: BorderRadius.circular(7.0),
                                                                                        ),
                                                                                        child: Padding(
                                                                                          padding: EdgeInsets.all(5.0),
                                                                                          child: Row(
                                                                                            mainAxisSize: MainAxisSize.min,
                                                                                            children: [
                                                                                              Text(
                                                                                                'Actions Taken :',
                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                      letterSpacing: 0.0,
                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                    ),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      StreamBuilder<List<LeadActivitiesRecord>>(
                                                                                        stream: queryLeadActivitiesRecord(
                                                                                          parent: FFAppState().outletRef,
                                                                                          queryBuilder: (leadActivitiesRecord) => leadActivitiesRecord
                                                                                              .where(
                                                                                                'leadRefId',
                                                                                                isEqualTo: containerVarItem.id,
                                                                                              )
                                                                                              .orderBy('scheduledDate', descending: true),
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
                                                                                          List<LeadActivitiesRecord> listViewLeadActivitiesRecordList = snapshot.data!;

                                                                                          return ListView.separated(
                                                                                            padding: EdgeInsets.zero,
                                                                                            shrinkWrap: true,
                                                                                            scrollDirection: Axis.vertical,
                                                                                            itemCount: listViewLeadActivitiesRecordList.length,
                                                                                            separatorBuilder: (_, __) => SizedBox(height: 5.0),
                                                                                            itemBuilder: (context, listViewIndex) {
                                                                                              final listViewLeadActivitiesRecord = listViewLeadActivitiesRecordList[listViewIndex];
                                                                                              return Container(
                                                                                                decoration: BoxDecoration(
                                                                                                  borderRadius: BorderRadius.circular(7.0),
                                                                                                  border: Border.all(
                                                                                                    color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                                    width: 1.0,
                                                                                                  ),
                                                                                                ),
                                                                                                child: Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5.0, 10.0, 5.0, 10.0),
                                                                                                  child: Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                    children: [
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        children: [
                                                                                                          Expanded(
                                                                                                            child: Text(
                                                                                                              listViewLeadActivitiesRecord.description,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    fontSize: 13.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                          Expanded(
                                                                                                            child: Text(
                                                                                                              listViewLeadActivitiesRecord.solution,
                                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                    color: FlutterFlowTheme.of(context).customColor5,
                                                                                                                    fontSize: 13.0,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    fontWeight: FontWeight.bold,
                                                                                                                    fontStyle: FontStyle.italic,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                  ),
                                                                                                            ),
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                      Text(
                                                                                                        dateTimeFormat("relative", DateTime.fromMillisecondsSinceEpoch(listViewLeadActivitiesRecord.scheduledDate)),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).customColor6,
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ),
                                                                                              );
                                                                                            },
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ].divide(SizedBox(height: 6.0)),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              theme: ExpandableThemeData(
                                                                                tapHeaderToExpand: true,
                                                                                tapBodyToExpand: false,
                                                                                tapBodyToCollapse: false,
                                                                                headerAlignment: ExpandablePanelHeaderAlignment.center,
                                                                                hasIcon: true,
                                                                                iconSize: 24.0,
                                                                                iconColor: FlutterFlowTheme.of(context).customColor4,
                                                                                iconPadding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    );
                                                                  },
                                                                );
                                                              },
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ].divide(SizedBox(width: 15.0)),
                                  ),
                                ),
                              ),
                            ].divide(SizedBox(height: 20.0)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ));
      },
    );
  }
}
