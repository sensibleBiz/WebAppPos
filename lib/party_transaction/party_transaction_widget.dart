import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'party_transaction_model.dart';
export 'party_transaction_model.dart';

class PartyTransactionWidget extends StatefulWidget {
  const PartyTransactionWidget({
    super.key,
    this.partyDoc,
    this.outletId,
    this.leadManagement,
  });

  final DocumentReference? partyDoc;
  final DocumentReference? outletId;
  final DocumentReference? leadManagement;

  static String routeName = 'PartyTransaction';
  static String routePath = 'partyTransaction';

  @override
  State<PartyTransactionWidget> createState() => _PartyTransactionWidgetState();
}

class _PartyTransactionWidgetState extends State<PartyTransactionWidget>
    with TickerProviderStateMixin {
  late PartyTransactionModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PartyTransactionModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().showList = false;
      safeSetState(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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

    return Title(
        title: 'PartyTransaction',
        color: FlutterFlowTheme.of(context).primary.withAlpha(0XFF),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primary,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                20.0, 0.0, 20.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 45.0,
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    size: 30.0,
                                  ),
                                  onPressed: () async {
                                    context.safePop();
                                    FFAppState().showList = false;
                                    safeSetState(() {});
                                  },
                                ),
                                AutoSizeText(
                                  'Transactions',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context)
                                      .headlineMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .headlineMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBtnText,
                                        letterSpacing: 0.0,
                                        fontWeight: FontWeight.w600,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .headlineMediumIsCustom,
                                      ),
                                ),
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                  tabletLandscape: false,
                                ))
                                  FlutterFlowIconButton(
                                    borderColor: Colors.transparent,
                                    borderRadius: 30.0,
                                    borderWidth: 1.0,
                                    buttonSize: 45.0,
                                    icon: Icon(
                                      Icons.wechat_sharp,
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 30.0,
                                    ),
                                    onPressed: () {
                                      print('IconButton pressed ...');
                                    },
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 24,
                    child: Container(
                      width: double.infinity,
                      height: 100.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(0.0),
                          bottomRight: Radius.circular(0.0),
                          topLeft: Radius.circular(40.0),
                          topRight: Radius.circular(40.0),
                        ),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment(0.0, 0),
                                    child: TabBar(
                                      labelColor:
                                          FlutterFlowTheme.of(context).primary,
                                      unselectedLabelColor:
                                          FlutterFlowTheme.of(context)
                                              .primaryText,
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .labelLargeFamily,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .labelLargeIsCustom,
                                          ),
                                      unselectedLabelStyle: TextStyle(),
                                      indicatorColor:
                                          FlutterFlowTheme.of(context)
                                              .secondary,
                                      tabs: [
                                        Tab(
                                          text: 'Advance Payment',
                                        ),
                                        Tab(
                                          text: 'Balance Pending',
                                        ),
                                      ],
                                      controller: _model.tabBarController,
                                      onTap: (i) async {
                                        [() async {}, () async {}][i]();
                                      },
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      controller: _model.tabBarController,
                                      children: [
                                        StreamBuilder<List<UserProfileRecord>>(
                                          stream: queryUserProfileRecord(
                                            queryBuilder: (userProfileRecord) =>
                                                userProfileRecord.where(
                                              'email',
                                              isEqualTo:
                                                  FFAppState().currentEmail,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 30.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UserProfileRecord>
                                                stackUserProfileRecordList =
                                                snapshot.data!;
                                            final stackUserProfileRecord =
                                                stackUserProfileRecordList
                                                        .isNotEmpty
                                                    ? stackUserProfileRecordList
                                                        .first
                                                    : null;

                                            return Stack(
                                              children: [
                                                if (FFAppState().showList ==
                                                    false)
                                                  StreamBuilder<
                                                      List<SaleRecord>>(
                                                    stream: querySaleRecord(
                                                      parent: FFAppState()
                                                          .outletRef,
                                                      queryBuilder:
                                                          (saleRecord) =>
                                                              saleRecord.where(
                                                        'balanceDue',
                                                        isNotEqualTo: 0.0,
                                                      ),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<SaleRecord>
                                                          saleSaleRecordList =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Stack(
                                                                  children: [
                                                                    if ((stackUserProfileRecord?.role ==
                                                                            'user') &&
                                                                        (functions.userDocToJsonNew(stackUserProfileRecord!, 'Sales Order').toString() ==
                                                                            '1'))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final saleRef1 =
                                                                                functions.orderBy(saleSaleRecordList.where((e) => (e.createdBy == stackUserProfileRecord?.id) && (stackUserProfileRecord?.role == 'user') && (e.balanceDue != 0.0)).toList(), 'd').toList();

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: saleRef1.length,
                                                                              itemBuilder: (context, saleRef1Index) {
                                                                                final saleRef1Item = saleRef1[saleRef1Index];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.sale23 = await actions.docToJsonSale(
                                                                                        saleRef1Item,
                                                                                      );
                                                                                      FFAppState().selectedSale = _model.sale23!;
                                                                                      FFAppState().update(() {});

                                                                                      context.pushNamed(
                                                                                        SalesOrderdetailsWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'id': serializeParam(
                                                                                            saleRef1Item.id,
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'saleRef': serializeParam(
                                                                                            saleRef1Item.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(6.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    saleRef1Item.party,
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    functions.milisecToTimestamp(saleRef1Item.orderDate),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                height: 18.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFFC4E091),
                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                      child: SelectionArea(
                                                                                                          child: Text(
                                                                                                        'Sale',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                              child: SelectionArea(
                                                                                                                  child: Text(
                                                                                                                'Total',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                    ),
                                                                                                              )),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                                  child: SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    '₹',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  )),
                                                                                                                ),
                                                                                                                SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  saleRef1Item.finalBillAmt.toString(),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                )),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                            child: SelectionArea(
                                                                                                                child: Text(
                                                                                                              'Balance',
                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                  ),
                                                                                                            )),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                                child: SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  '₹',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                )),
                                                                                                              ),
                                                                                                              SelectionArea(
                                                                                                                  child: Text(
                                                                                                                saleRef1Item.balanceDue.toString(),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                    ),
                                                                                                              )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                                        child: FFButtonWidget(
                                                                                                          onPressed: () {
                                                                                                            print('Button pressed ...');
                                                                                                          },
                                                                                                          text: valueOrDefault<String>(
                                                                                                            () {
                                                                                                              if (saleRef1Item.status == 1) {
                                                                                                                return 'Requested';
                                                                                                              } else if (saleRef1Item.status == 2) {
                                                                                                                return 'Confirmed';
                                                                                                              } else if (saleRef1Item.status == 3) {
                                                                                                                return 'Dispatch';
                                                                                                              } else if (saleRef1Item.status == 4) {
                                                                                                                return 'Delivered';
                                                                                                              } else if (saleRef1Item.status == 5) {
                                                                                                                return 'Cancel';
                                                                                                              } else {
                                                                                                                return '';
                                                                                                              }
                                                                                                            }(),
                                                                                                            '1',
                                                                                                          ),
                                                                                                          options: FFButtonOptions(
                                                                                                            height: 25.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: () {
                                                                                                              if (saleRef1Item.status == 1) {
                                                                                                                return FlutterFlowTheme.of(context).warning;
                                                                                                              } else if (saleRef1Item.status == 2) {
                                                                                                                return FlutterFlowTheme.of(context).success;
                                                                                                              } else if (saleRef1Item.status == 3) {
                                                                                                                return FlutterFlowTheme.of(context).info;
                                                                                                              } else if (saleRef1Item.status == 4) {
                                                                                                                return FlutterFlowTheme.of(context).alternate;
                                                                                                              } else if (saleRef1Item.status == 5) {
                                                                                                                return FlutterFlowTheme.of(context).primary;
                                                                                                              } else {
                                                                                                                return null;
                                                                                                              }
                                                                                                            }(),
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                  color: Colors.white,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                                ),
                                                                                                            elevation: 3.0,
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Colors.transparent,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Created By :',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<UserProfileRecord>>(
                                                                                                      stream: queryUserProfileRecord(
                                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                          'id',
                                                                                                          isEqualTo: saleRef1Item.createdBy,
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
                                                                                                        List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUserProfileRecord?.name,
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Updated By :',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<UserProfileRecord>>(
                                                                                                      stream: queryUserProfileRecord(
                                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                          'id',
                                                                                                          isEqualTo: saleRef1Item.authorizedBy,
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
                                                                                                        List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUserProfileRecord?.name,
                                                                                                            'Pending',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
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
                                                                    if ((stackUserProfileRecord?.role == 'admin') ||
                                                                        (stackUserProfileRecord?.role ==
                                                                            'user') ||
                                                                        (functions.userDocToJsonNew(stackUserProfileRecord!, 'Sales Order').toString() ==
                                                                            '4'))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final saleRef =
                                                                                saleSaleRecordList.where((e) => functions.userDocToJsonNew(stackUserProfileRecord!, 'Sales Order').toString() != '1').toList();

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: saleRef.length,
                                                                              itemBuilder: (context, saleRefIndex) {
                                                                                final saleRefItem = saleRef[saleRefIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.sale1 = await actions.docToJsonSale(
                                                                                        saleRefItem,
                                                                                      );
                                                                                      FFAppState().selectedSale = _model.sale1!;
                                                                                      FFAppState().update(() {});

                                                                                      context.pushNamed(
                                                                                        SalesOrderdetailsWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'id': serializeParam(
                                                                                            saleRefItem.id,
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'saleRef': serializeParam(
                                                                                            saleRefItem.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(6.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    saleRefItem.party,
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    functions.milisecToTimestamp(saleRefItem.orderDate),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                height: 18.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFFC4E091),
                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                      child: SelectionArea(
                                                                                                          child: Text(
                                                                                                        'Sale',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                child: SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  'Total',
                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                      ),
                                                                                                                )),
                                                                                                              ),
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                                    child: SelectionArea(
                                                                                                                        child: Text(
                                                                                                                      '₹',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                          ),
                                                                                                                    )),
                                                                                                                  ),
                                                                                                                  SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    saleRefItem.finalBillAmt.toString(),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  )),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                              child: SelectionArea(
                                                                                                                  child: Text(
                                                                                                                'Balance',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                    ),
                                                                                                              )),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                                  child: SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    '₹',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  )),
                                                                                                                ),
                                                                                                                SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  saleRefItem.balanceDue.toString(),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                )),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      FFButtonWidget(
                                                                                                        onPressed: () {
                                                                                                          print('Button pressed ...');
                                                                                                        },
                                                                                                        text: valueOrDefault<String>(
                                                                                                          () {
                                                                                                            if (saleRefItem.status == 1) {
                                                                                                              return 'Requested';
                                                                                                            } else if (saleRefItem.status == 2) {
                                                                                                              return 'Confirmed';
                                                                                                            } else if (saleRefItem.status == 3) {
                                                                                                              return 'Canceled';
                                                                                                            } else {
                                                                                                              return '';
                                                                                                            }
                                                                                                          }(),
                                                                                                          '1',
                                                                                                        ),
                                                                                                        options: FFButtonOptions(
                                                                                                          height: 25.0,
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          color: () {
                                                                                                            if (saleRefItem.status == 1) {
                                                                                                              return FlutterFlowTheme.of(context).warning;
                                                                                                            } else if (saleRefItem.status == 2) {
                                                                                                              return FlutterFlowTheme.of(context).success;
                                                                                                            } else if (saleRefItem.status == 3) {
                                                                                                              return FlutterFlowTheme.of(context).primary;
                                                                                                            } else {
                                                                                                              return null;
                                                                                                            }
                                                                                                          }(),
                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                color: Colors.white,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                              ),
                                                                                                          elevation: 3.0,
                                                                                                          borderSide: BorderSide(
                                                                                                            color: Colors.transparent,
                                                                                                            width: 1.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'CreatedBy :',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<UserProfileRecord>>(
                                                                                                      stream: queryUserProfileRecord(
                                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                          'id',
                                                                                                          isEqualTo: saleRefItem.createdBy,
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
                                                                                                        List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUserProfileRecord?.name,
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Approved By :',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<UserProfileRecord>>(
                                                                                                      stream: queryUserProfileRecord(
                                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                          'id',
                                                                                                          isEqualTo: saleRefItem.authorizedBy,
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
                                                                                                        List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUserProfileRecord?.name,
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
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
                                                      );
                                                    },
                                                  ),
                                                if (FFAppState().showList ==
                                                    true)
                                                  StreamBuilder<
                                                      List<PurchaseRecord>>(
                                                    stream: queryPurchaseRecord(
                                                      parent: FFAppState()
                                                          .outletRef,
                                                      queryBuilder:
                                                          (purchaseRecord) =>
                                                              purchaseRecord
                                                                  .orderBy(
                                                                      'orderDate',
                                                                      descending:
                                                                          true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<PurchaseRecord>
                                                          purchasePurchaseRecordList =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        FFAppState().showList =
                                                                            false;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Sales Order',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.45,
                                                                        height:
                                                                            35.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              fontSize: 8.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                    ),
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        FFAppState().showList =
                                                                            true;
                                                                        safeSetState(
                                                                            () {});
                                                                      },
                                                                      text:
                                                                          'Purchase Order',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width: MediaQuery.sizeOf(context).width *
                                                                            0.45,
                                                                        height:
                                                                            35.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .bodyMedium
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              fontSize: 8.0,
                                                                              letterSpacing: 0.0,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(10.0),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          0.0,
                                                                          10.0),
                                                                  child:
                                                                      Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final purchaseRef =
                                                                          purchasePurchaseRecordList
                                                                              .toList();

                                                                      return ListView
                                                                          .builder(
                                                                        padding:
                                                                            EdgeInsets.zero,
                                                                        shrinkWrap:
                                                                            true,
                                                                        scrollDirection:
                                                                            Axis.vertical,
                                                                        itemCount:
                                                                            purchaseRef.length,
                                                                        itemBuilder:
                                                                            (context,
                                                                                purchaseRefIndex) {
                                                                          final purchaseRefItem =
                                                                              purchaseRef[purchaseRefIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                0.0,
                                                                                0.0,
                                                                                0.0,
                                                                                5.0),
                                                                            child:
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                _model.po = await actions.docToJsonPo(
                                                                                  purchaseRefItem,
                                                                                );
                                                                                FFAppState().selectedPurchase = _model.po!;
                                                                                FFAppState().update(() {});

                                                                                safeSetState(() {});
                                                                              },
                                                                              child: Container(
                                                                                width: 100.0,
                                                                                decoration: BoxDecoration(
                                                                                  color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                ),
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.all(6.0),
                                                                                  child: Column(
                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          children: [
                                                                                            SelectionArea(
                                                                                                child: Text(
                                                                                              purchaseRefItem.party,
                                                                                              style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    fontWeight: FontWeight.w600,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                  ),
                                                                                            )),
                                                                                            Text(
                                                                                              functions.milisecToTimestamp(purchaseRefItem.orderDate),
                                                                                              style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                    letterSpacing: 0.0,
                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                  ),
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                        child: Container(
                                                                                          height: 18.0,
                                                                                          decoration: BoxDecoration(
                                                                                            color: Color(0xFFF7E8E8),
                                                                                            borderRadius: BorderRadius.circular(5.0),
                                                                                          ),
                                                                                          child: Column(
                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                                                            children: [
                                                                                              Padding(
                                                                                                padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                child: SelectionArea(
                                                                                                    child: Text(
                                                                                                  'Purchase',
                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                        color: FlutterFlowTheme.of(context).primary,
                                                                                                        fontSize: 10.0,
                                                                                                        letterSpacing: 0.0,
                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                      ),
                                                                                                )),
                                                                                              ),
                                                                                            ],
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                        child: Row(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                              child: Column(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                    child: SelectionArea(
                                                                                                        child: Text(
                                                                                                      'Total',
                                                                                                      style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                        child: SelectionArea(
                                                                                                            child: Text(
                                                                                                          '₹',
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        )),
                                                                                                      ),
                                                                                                      SelectionArea(
                                                                                                          child: Text(
                                                                                                        purchaseRefItem.finalBillAmt.toString(),
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Column(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                                                              children: [
                                                                                                Padding(
                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                  child: SelectionArea(
                                                                                                      child: Text(
                                                                                                    'Balance',
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                      child: SelectionArea(
                                                                                                          child: Text(
                                                                                                        '₹',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ),
                                                                                                    SelectionArea(
                                                                                                        child: Text(
                                                                                                      purchaseRefItem.balanceDue.toString(),
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    )),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                    ],
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
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            5.0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceEvenly,
                                                                  children: [
                                                                    FFButtonWidget(
                                                                      onPressed:
                                                                          () {
                                                                        print(
                                                                            'Button pressed ...');
                                                                      },
                                                                      text:
                                                                          'Add Purchase',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            130.0,
                                                                        height:
                                                                            40.0,
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        iconPadding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            0.0),
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primary,
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .titleSmall
                                                                            .override(
                                                                              fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                              color: FlutterFlowTheme.of(context).primaryBtnText,
                                                                              letterSpacing: 0.0,
                                                                              fontWeight: FontWeight.w600,
                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                            ),
                                                                        elevation:
                                                                            2.0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1.0,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(15.0),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                        StreamBuilder<List<UserProfileRecord>>(
                                          stream: queryUserProfileRecord(
                                            queryBuilder: (userProfileRecord) =>
                                                userProfileRecord.where(
                                              'email',
                                              isEqualTo:
                                                  FFAppState().currentEmail,
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
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primary,
                                                    size: 30.0,
                                                  ),
                                                ),
                                              );
                                            }
                                            List<UserProfileRecord>
                                                stackUserProfileRecordList =
                                                snapshot.data!;
                                            final stackUserProfileRecord =
                                                stackUserProfileRecordList
                                                        .isNotEmpty
                                                    ? stackUserProfileRecordList
                                                        .first
                                                    : null;

                                            return Stack(
                                              children: [
                                                if (FFAppState().showList ==
                                                    false)
                                                  StreamBuilder<
                                                      List<SaleRecord>>(
                                                    stream: querySaleRecord(
                                                      parent: FFAppState()
                                                          .outletRef,
                                                      queryBuilder: (saleRecord) =>
                                                          saleRecord
                                                              .where(
                                                                'balanceDue',
                                                                isEqualTo: 0.0,
                                                              )
                                                              .orderBy(
                                                                  'orderDate',
                                                                  descending:
                                                                      true),
                                                    ),
                                                    builder:
                                                        (context, snapshot) {
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
                                                      List<SaleRecord>
                                                          saleSaleRecordList =
                                                          snapshot.data!;

                                                      return Container(
                                                        width: double.infinity,
                                                        height:
                                                            MediaQuery.sizeOf(
                                                                        context)
                                                                    .height *
                                                                1.0,
                                                        decoration:
                                                            BoxDecoration(),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      10.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Expanded(
                                                                child: Stack(
                                                                  children: [
                                                                    if ((stackUserProfileRecord?.role ==
                                                                            'user') &&
                                                                        (functions.userDocToJsonNew(stackUserProfileRecord!, 'Sales Order').toString() ==
                                                                            '1'))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final saleRef1 =
                                                                                saleSaleRecordList.where((e) => (e.createdBy == stackUserProfileRecord?.id) && (stackUserProfileRecord?.role == 'user')).toList();

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: saleRef1.length,
                                                                              itemBuilder: (context, saleRef1Index) {
                                                                                final saleRef1Item = saleRef1[saleRef1Index];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.sale230 = await actions.docToJsonSale(
                                                                                        saleRef1Item,
                                                                                      );
                                                                                      FFAppState().selectedSale = _model.sale230!;
                                                                                      FFAppState().update(() {});

                                                                                      context.pushNamed(
                                                                                        SalesOrderdetailsWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'id': serializeParam(
                                                                                            saleRef1Item.id,
                                                                                            ParamType.String,
                                                                                          ),
                                                                                          'saleRef': serializeParam(
                                                                                            saleRef1Item.reference,
                                                                                            ParamType.DocumentReference,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(6.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    saleRef1Item.party,
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    functions.milisecToTimestamp(saleRef1Item.orderDate),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                height: 18.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFFC4E091),
                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                      child: SelectionArea(
                                                                                                          child: Text(
                                                                                                        'Sale',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                        child: Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                              child: SelectionArea(
                                                                                                                  child: Text(
                                                                                                                'Total',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                    ),
                                                                                                              )),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                                  child: SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    '₹',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  )),
                                                                                                                ),
                                                                                                                SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  saleRef1Item.finalBillAmt.toString(),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                )),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ),
                                                                                                      Column(
                                                                                                        mainAxisSize: MainAxisSize.max,
                                                                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                        children: [
                                                                                                          Padding(
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                            child: SelectionArea(
                                                                                                                child: Text(
                                                                                                              'Balance',
                                                                                                              style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                    fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                    letterSpacing: 0.0,
                                                                                                                    useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                  ),
                                                                                                            )),
                                                                                                          ),
                                                                                                          Row(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                                child: SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  '₹',
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                )),
                                                                                                              ),
                                                                                                              SelectionArea(
                                                                                                                  child: Text(
                                                                                                                saleRef1Item.balanceDue.toString(),
                                                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                    ),
                                                                                                              )),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ],
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      Padding(
                                                                                                        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 15.0, 0.0),
                                                                                                        child: FFButtonWidget(
                                                                                                          onPressed: () {
                                                                                                            print('Button pressed ...');
                                                                                                          },
                                                                                                          text: valueOrDefault<String>(
                                                                                                            () {
                                                                                                              if (saleRef1Item.status == 1) {
                                                                                                                return 'Requested';
                                                                                                              } else if (saleRef1Item.status == 2) {
                                                                                                                return 'Confirmed';
                                                                                                              } else if (saleRef1Item.status == 3) {
                                                                                                                return 'Dispatch';
                                                                                                              } else if (saleRef1Item.status == 4) {
                                                                                                                return 'Delivered';
                                                                                                              } else if (saleRef1Item.status == 5) {
                                                                                                                return 'Cancel';
                                                                                                              } else {
                                                                                                                return '';
                                                                                                              }
                                                                                                            }(),
                                                                                                            '1',
                                                                                                          ),
                                                                                                          options: FFButtonOptions(
                                                                                                            height: 25.0,
                                                                                                            padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                            iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                            color: () {
                                                                                                              if (saleRef1Item.status == 1) {
                                                                                                                return FlutterFlowTheme.of(context).warning;
                                                                                                              } else if (saleRef1Item.status == 2) {
                                                                                                                return FlutterFlowTheme.of(context).success;
                                                                                                              } else if (saleRef1Item.status == 3) {
                                                                                                                return FlutterFlowTheme.of(context).info;
                                                                                                              } else if (saleRef1Item.status == 4) {
                                                                                                                return FlutterFlowTheme.of(context).alternate;
                                                                                                              } else if (saleRef1Item.status == 5) {
                                                                                                                return FlutterFlowTheme.of(context).primary;
                                                                                                              } else {
                                                                                                                return null;
                                                                                                              }
                                                                                                            }(),
                                                                                                            textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                  fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                  color: Colors.white,
                                                                                                                  letterSpacing: 0.0,
                                                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                                ),
                                                                                                            elevation: 3.0,
                                                                                                            borderSide: BorderSide(
                                                                                                              color: Colors.transparent,
                                                                                                              width: 1.0,
                                                                                                            ),
                                                                                                            borderRadius: BorderRadius.circular(8.0),
                                                                                                          ),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Created By :',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<UserProfileRecord>>(
                                                                                                      stream: queryUserProfileRecord(
                                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                          'id',
                                                                                                          isEqualTo: saleRef1Item.createdBy,
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
                                                                                                        List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUserProfileRecord?.name,
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.end,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                      child: Text(
                                                                                                        'Approved By :',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).primary,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<UserProfileRecord>>(
                                                                                                      stream: queryUserProfileRecord(
                                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                          'id',
                                                                                                          isEqualTo: saleRef1Item.authorizedBy,
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
                                                                                                        List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUserProfileRecord?.name,
                                                                                                            'Pending',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
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
                                                                    if ((stackUserProfileRecord?.role == 'admin') ||
                                                                        (stackUserProfileRecord?.role ==
                                                                            'user') ||
                                                                        (functions.userDocToJsonNew(stackUserProfileRecord!, 'Sales Order').toString() ==
                                                                            '4'))
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            0.0,
                                                                            0.0,
                                                                            0.0,
                                                                            10.0),
                                                                        child:
                                                                            Builder(
                                                                          builder:
                                                                              (context) {
                                                                            final saleRef =
                                                                                saleSaleRecordList.where((e) => functions.userDocToJsonNew(stackUserProfileRecord!, 'Sales Order').toString() != '1').toList();

                                                                            return ListView.builder(
                                                                              padding: EdgeInsets.zero,
                                                                              shrinkWrap: true,
                                                                              scrollDirection: Axis.vertical,
                                                                              itemCount: saleRef.length,
                                                                              itemBuilder: (context, saleRefIndex) {
                                                                                final saleRefItem = saleRef[saleRefIndex];
                                                                                return Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                  child: InkWell(
                                                                                    splashColor: Colors.transparent,
                                                                                    focusColor: Colors.transparent,
                                                                                    hoverColor: Colors.transparent,
                                                                                    highlightColor: Colors.transparent,
                                                                                    onTap: () async {
                                                                                      _model.sale10 = await actions.docToJsonSale(
                                                                                        saleRefItem,
                                                                                      );
                                                                                      FFAppState().selectedSale = _model.sale10!;
                                                                                      FFAppState().update(() {});

                                                                                      context.pushNamed(
                                                                                        SalesOrderdetailsWidget.routeName,
                                                                                        queryParameters: {
                                                                                          'id': serializeParam(
                                                                                            '',
                                                                                            ParamType.String,
                                                                                          ),
                                                                                        }.withoutNulls,
                                                                                      );

                                                                                      safeSetState(() {});
                                                                                    },
                                                                                    child: Container(
                                                                                      width: 100.0,
                                                                                      decoration: BoxDecoration(
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                      child: Padding(
                                                                                        padding: EdgeInsets.all(6.0),
                                                                                        child: Column(
                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                          children: [
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    saleRefItem.party,
                                                                                                    style: FlutterFlowTheme.of(context).titleMedium.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).titleMediumFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          fontWeight: FontWeight.w600,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).titleMediumIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                  SelectionArea(
                                                                                                      child: Text(
                                                                                                    functions.milisecToTimestamp(saleRefItem.orderDate),
                                                                                                    style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                          letterSpacing: 0.0,
                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                        ),
                                                                                                  )),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 4.0),
                                                                                              child: Container(
                                                                                                height: 18.0,
                                                                                                decoration: BoxDecoration(
                                                                                                  color: Color(0xFFC4E091),
                                                                                                  borderRadius: BorderRadius.circular(5.0),
                                                                                                ),
                                                                                                child: Column(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                                                  children: [
                                                                                                    Padding(
                                                                                                      padding: EdgeInsetsDirectional.fromSTEB(6.0, 0.0, 6.0, 0.0),
                                                                                                      child: SelectionArea(
                                                                                                          child: Text(
                                                                                                        'Sale',
                                                                                                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                              fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                              color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                              fontSize: 10.0,
                                                                                                              letterSpacing: 0.0,
                                                                                                              useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                            ),
                                                                                                      )),
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ),
                                                                                            ),
                                                                                            Padding(
                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 5.0),
                                                                                              child: Row(
                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                children: [
                                                                                                  Padding(
                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 2.0),
                                                                                                    child: Row(
                                                                                                      mainAxisSize: MainAxisSize.max,
                                                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                                                      children: [
                                                                                                        Padding(
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 10.0, 0.0),
                                                                                                          child: Column(
                                                                                                            mainAxisSize: MainAxisSize.max,
                                                                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                            children: [
                                                                                                              Padding(
                                                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                                child: SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  'Total',
                                                                                                                  style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                      ),
                                                                                                                )),
                                                                                                              ),
                                                                                                              Row(
                                                                                                                mainAxisSize: MainAxisSize.max,
                                                                                                                children: [
                                                                                                                  Padding(
                                                                                                                    padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                                    child: SelectionArea(
                                                                                                                        child: Text(
                                                                                                                      '₹',
                                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                            letterSpacing: 0.0,
                                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                          ),
                                                                                                                    )),
                                                                                                                  ),
                                                                                                                  SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    saleRefItem.finalBillAmt.toString(),
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  )),
                                                                                                                ],
                                                                                                              ),
                                                                                                            ],
                                                                                                          ),
                                                                                                        ),
                                                                                                        Column(
                                                                                                          mainAxisSize: MainAxisSize.max,
                                                                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                                                                          children: [
                                                                                                            Padding(
                                                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 1.0),
                                                                                                              child: SelectionArea(
                                                                                                                  child: Text(
                                                                                                                'Balance',
                                                                                                                style: FlutterFlowTheme.of(context).bodySmall.override(
                                                                                                                      fontFamily: FlutterFlowTheme.of(context).bodySmallFamily,
                                                                                                                      letterSpacing: 0.0,
                                                                                                                      useGoogleFonts: !FlutterFlowTheme.of(context).bodySmallIsCustom,
                                                                                                                    ),
                                                                                                              )),
                                                                                                            ),
                                                                                                            Row(
                                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                                              children: [
                                                                                                                Padding(
                                                                                                                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 2.0, 0.0),
                                                                                                                  child: SelectionArea(
                                                                                                                      child: Text(
                                                                                                                    '₹',
                                                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                          letterSpacing: 0.0,
                                                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                        ),
                                                                                                                  )),
                                                                                                                ),
                                                                                                                SelectionArea(
                                                                                                                    child: Text(
                                                                                                                  saleRefItem.balanceDue.toString(),
                                                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                        letterSpacing: 0.0,
                                                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                                      ),
                                                                                                                )),
                                                                                                              ],
                                                                                                            ),
                                                                                                          ],
                                                                                                        ),
                                                                                                      ],
                                                                                                    ),
                                                                                                  ),
                                                                                                  Row(
                                                                                                    mainAxisSize: MainAxisSize.max,
                                                                                                    children: [
                                                                                                      FFButtonWidget(
                                                                                                        onPressed: () {
                                                                                                          print('Button pressed ...');
                                                                                                        },
                                                                                                        text: valueOrDefault<String>(
                                                                                                          () {
                                                                                                            if (saleRefItem.status == 1) {
                                                                                                              return 'Requested';
                                                                                                            } else if (saleRefItem.status == 2) {
                                                                                                              return 'Confirmed';
                                                                                                            } else if (saleRefItem.status == 3) {
                                                                                                              return 'Canceled';
                                                                                                            } else {
                                                                                                              return '';
                                                                                                            }
                                                                                                          }(),
                                                                                                          '1',
                                                                                                        ),
                                                                                                        options: FFButtonOptions(
                                                                                                          height: 25.0,
                                                                                                          padding: EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                                                                                                          iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                                                                                                          color: () {
                                                                                                            if (saleRefItem.status == 1) {
                                                                                                              return FlutterFlowTheme.of(context).warning;
                                                                                                            } else if (saleRefItem.status == 2) {
                                                                                                              return FlutterFlowTheme.of(context).success;
                                                                                                            } else if (saleRefItem.status == 3) {
                                                                                                              return FlutterFlowTheme.of(context).primary;
                                                                                                            } else {
                                                                                                              return null;
                                                                                                            }
                                                                                                          }(),
                                                                                                          textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).titleSmallFamily,
                                                                                                                color: Colors.white,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).titleSmallIsCustom,
                                                                                                              ),
                                                                                                          elevation: 3.0,
                                                                                                          borderSide: BorderSide(
                                                                                                            color: Colors.transparent,
                                                                                                            width: 1.0,
                                                                                                          ),
                                                                                                          borderRadius: BorderRadius.circular(8.0),
                                                                                                        ),
                                                                                                      ),
                                                                                                    ],
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                            Row(
                                                                                              mainAxisSize: MainAxisSize.max,
                                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                                              children: [
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'CreatedBy :',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<UserProfileRecord>>(
                                                                                                      stream: queryUserProfileRecord(
                                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                          'id',
                                                                                                          isEqualTo: saleRefItem.createdBy,
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
                                                                                                        List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUserProfileRecord?.name,
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                                Row(
                                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                                  children: [
                                                                                                    Text(
                                                                                                      'Approved By :',
                                                                                                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                            fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                            color: FlutterFlowTheme.of(context).primary,
                                                                                                            letterSpacing: 0.0,
                                                                                                            useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                          ),
                                                                                                    ),
                                                                                                    StreamBuilder<List<UserProfileRecord>>(
                                                                                                      stream: queryUserProfileRecord(
                                                                                                        queryBuilder: (userProfileRecord) => userProfileRecord.where(
                                                                                                          'id',
                                                                                                          isEqualTo: saleRefItem.authorizedBy,
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
                                                                                                        List<UserProfileRecord> textUserProfileRecordList = snapshot.data!;
                                                                                                        // Return an empty Container when the item does not exist.
                                                                                                        if (snapshot.data!.isEmpty) {
                                                                                                          return Container();
                                                                                                        }
                                                                                                        final textUserProfileRecord = textUserProfileRecordList.isNotEmpty ? textUserProfileRecordList.first : null;

                                                                                                        return Text(
                                                                                                          valueOrDefault<String>(
                                                                                                            textUserProfileRecord?.name,
                                                                                                            '0',
                                                                                                          ),
                                                                                                          style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                                                fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                                                letterSpacing: 0.0,
                                                                                                                useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                                              ),
                                                                                                        );
                                                                                                      },
                                                                                                    ),
                                                                                                  ],
                                                                                                ),
                                                                                              ],
                                                                                            ),
                                                                                          ],
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
                                                      );
                                                    },
                                                  ),
                                              ],
                                            );
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
