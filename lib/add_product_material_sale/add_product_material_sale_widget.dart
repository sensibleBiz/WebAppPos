import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'add_product_material_sale_model.dart';
export 'add_product_material_sale_model.dart';

class AddProductMaterialSaleWidget extends StatefulWidget {
  const AddProductMaterialSaleWidget({
    super.key,
    this.np,
  });

  final int? np;

  static String routeName = 'AddProductMaterialSale';
  static String routePath = 'addProductMaterialSale';

  @override
  State<AddProductMaterialSaleWidget> createState() =>
      _AddProductMaterialSaleWidgetState();
}

class _AddProductMaterialSaleWidgetState
    extends State<AddProductMaterialSaleWidget> {
  late AddProductMaterialSaleModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddProductMaterialSaleModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().gstAmt = 0.0;
      safeSetState(() {});
      FFAppState().allinclusive = true;
      safeSetState(() {});
      FFAppState().allinclusive = true;
      safeSetState(() {});
    });

    _model.textFieldMrpPriceTextController ??= TextEditingController();
    _model.textFieldMrpPriceFocusNode ??= FocusNode();

    _model.textFieldDeliveryChrgTextController ??= TextEditingController();
    _model.textFieldDeliveryChrgFocusNode ??= FocusNode();

    _model.switchValue1 = FFAppState().allinclusive;
    _model.textFieldStockTextController ??= TextEditingController();
    _model.textFieldStockFocusNode ??= FocusNode();

    _model.textFielLeadTimeTextController ??= TextEditingController();
    _model.textFielLeadTimeFocusNode ??= FocusNode();

    _model.textFieldDiscountPerTextController ??= TextEditingController();
    _model.textFieldDiscountPerFocusNode ??= FocusNode();

    _model.switchValue2 = FFAppState().isDealer;
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
        title: 'AddProductMaterialSale',
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
                                    context.pop();
                                    FFAppState().totalPrice = 0.0;
                                    FFAppState().gstAmt = 0.0;
                                    FFAppState().disAmt = 0.0;
                                    safeSetState(() {});
                                  },
                                ),
                                AutoSizeText(
                                  'Add Sale Product',
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
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .headlineMediumFamily),
                                      ),
                                ),
                                FlutterFlowIconButton(
                                  borderColor: Colors.transparent,
                                  borderRadius: 30.0,
                                  borderWidth: 1.0,
                                  buttonSize: 45.0,
                                  icon: Icon(
                                    Icons.chevron_right,
                                    color: Color(0x000D0801),
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
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            320.0, 25.0, 320.0, 10.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.055,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: StreamBuilder<List<ProductMasterRecord>>(
                                  stream: queryProductMasterRecord(
                                    queryBuilder: (productMasterRecord) =>
                                        productMasterRecord.where(
                                      'type',
                                      isEqualTo: 1,
                                    ),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 30.0,
                                          height: 30.0,
                                          child: SpinKitRing(
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            size: 30.0,
                                          ),
                                        ),
                                      );
                                    }
                                    List<ProductMasterRecord>
                                        productDropDownProductMasterRecordList =
                                        snapshot.data!;

                                    return FlutterFlowDropDown<String>(
                                      controller: _model
                                              .productDropDownValueController ??=
                                          FormFieldController<String>(null),
                                      options:
                                          productDropDownProductMasterRecordList
                                              .map((e) => e.name)
                                              .toList(),
                                      onChanged: (val) => safeSetState(() =>
                                          _model.productDropDownValue = val),
                                      width: double.infinity,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.06,
                                      searchTextStyle: FlutterFlowTheme.of(
                                              context)
                                          .bodyMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMediumFamily),
                                          ),
                                      textStyle: FlutterFlowTheme.of(context)
                                          .titleMedium
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .titleMediumFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts: GoogleFonts.asMap()
                                                .containsKey(
                                                    FlutterFlowTheme.of(context)
                                                        .titleMediumFamily),
                                          ),
                                      hintText: 'Select Product',
                                      icon: Icon(
                                        Icons.search,
                                        size: 15.0,
                                      ),
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      elevation: 0.0,
                                      borderColor: FlutterFlowTheme.of(context)
                                          .customColor2,
                                      borderWidth: 0.0,
                                      borderRadius: 5.0,
                                      margin: EdgeInsetsDirectional.fromSTEB(
                                          12.0, 4.0, 12.0, 4.0),
                                      hidesUnderline: true,
                                      isSearchable: true,
                                      isMultiSelect: false,
                                    );
                                  },
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 5.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: _model
                                            .textFieldMrpPriceTextController,
                                        focusNode:
                                            _model.textFieldMrpPriceFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textFieldMrpPriceTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            _model.res11 =
                                                await actions.discountAmt(
                                              double.tryParse(_model
                                                  .textFieldDiscountPerTextController
                                                  .text),
                                              double.tryParse(_model
                                                  .textFieldMrpPriceTextController
                                                  .text),
                                            );
                                            FFAppState().disAmt = _model.res11!;
                                            FFAppState().update(() {});
                                            _model.gstAmount =
                                                await actions.gstAmt(
                                              double.tryParse(_model
                                                  .textFieldMrpPriceTextController
                                                  .text),
                                              valueOrDefault<double>(
                                                () {
                                                  if (_model.dropDownValue ==
                                                      '12') {
                                                    return 12.0;
                                                  } else if (_model
                                                          .dropDownValue ==
                                                      '18') {
                                                    return 18.0;
                                                  } else if (_model
                                                          .dropDownValue ==
                                                      '0') {
                                                    return 0.0;
                                                  } else if (_model
                                                          .dropDownValue ==
                                                      '5') {
                                                    return 5.0;
                                                  } else if (_model
                                                          .dropDownValue ==
                                                      '28') {
                                                    return 28.0;
                                                  } else {
                                                    return 18.0;
                                                  }
                                                }(),
                                                18.0,
                                              ),
                                            );
                                            FFAppState().gstAmt =
                                                _model.gstAmount!;
                                            safeSetState(() {});
                                            _model.res12 =
                                                await actions.getTotal(
                                              double.tryParse(_model
                                                  .textFieldMrpPriceTextController
                                                  .text),
                                              FFAppState().disAmt,
                                              double.tryParse(_model
                                                  .textFieldDeliveryChrgTextController
                                                  .text),
                                              FFAppState().gstAmt,
                                            );
                                            FFAppState().totalPrice =
                                                _model.res12!;
                                            FFAppState().update(() {});

                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Mrp Price',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .textFieldMrpPriceTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      decoration: BoxDecoration(),
                                      child: TextFormField(
                                        controller: _model
                                            .textFieldDeliveryChrgTextController,
                                        focusNode: _model
                                            .textFieldDeliveryChrgFocusNode,
                                        onChanged: (_) => EasyDebounce.debounce(
                                          '_model.textFieldDeliveryChrgTextController',
                                          Duration(milliseconds: 2000),
                                          () async {
                                            _model.res13 =
                                                await actions.getTotal(
                                              double.tryParse(_model
                                                  .textFieldMrpPriceTextController
                                                  .text),
                                              valueOrDefault<double>(
                                                FFAppState().disAmt,
                                                0.0,
                                              ),
                                              double.tryParse(_model
                                                  .textFieldDeliveryChrgTextController
                                                  .text),
                                              FFAppState().gstAmt,
                                            );
                                            FFAppState().totalPrice =
                                                _model.res13!;
                                            FFAppState().update(() {});

                                            safeSetState(() {});
                                          },
                                        ),
                                        autofocus: false,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Delivery Charges',
                                          hintStyle: FlutterFlowTheme.of(
                                                  context)
                                              .bodySmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .bodySmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .bodySmallFamily),
                                              ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondary,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: Color(0x00000000),
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                          filled: true,
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                        ),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                        validator: _model
                                            .textFieldDeliveryChrgTextControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Text(
                                  'If All Inclusive :',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .bodyMediumFamily,
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
                                        fontSize: 12.0,
                                        letterSpacing: 0.0,
                                        useGoogleFonts: GoogleFonts.asMap()
                                            .containsKey(
                                                FlutterFlowTheme.of(context)
                                                    .bodyMediumFamily),
                                      ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.switchValue1!,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.switchValue1 = newValue!);
                                      if (newValue!) {
                                        FFAppState().allinclusive = true;
                                        safeSetState(() {});
                                        _model.res110 =
                                            await actions.discountAmt(
                                          double.tryParse(_model
                                              .textFieldDiscountPerTextController
                                              .text),
                                          double.tryParse(_model
                                              .textFieldMrpPriceTextController
                                              .text),
                                        );
                                        FFAppState().disAmt = _model.res110!;
                                        FFAppState().update(() {});
                                        _model.gstAmount0 =
                                            await actions.gstAmt(
                                          double.tryParse(_model
                                              .textFieldMrpPriceTextController
                                              .text),
                                          valueOrDefault<double>(
                                            () {
                                              if (_model.dropDownValue ==
                                                  '12') {
                                                return 12.0;
                                              } else if (_model.dropDownValue ==
                                                  '18') {
                                                return 18.0;
                                              } else if (_model.dropDownValue ==
                                                  '0') {
                                                return 0.0;
                                              } else if (_model.dropDownValue ==
                                                  'GST5') {
                                                return 5.0;
                                              } else if (_model.dropDownValue ==
                                                  '28') {
                                                return 28.0;
                                              } else {
                                                return 18.0;
                                              }
                                            }(),
                                            18.0,
                                          ),
                                        );
                                        FFAppState().gstAmt =
                                            _model.gstAmount0!;
                                        safeSetState(() {});
                                        _model.res120 = await actions.getTotal(
                                          double.tryParse(_model
                                              .textFieldMrpPriceTextController
                                              .text),
                                          FFAppState().disAmt,
                                          double.tryParse(_model
                                              .textFieldDeliveryChrgTextController
                                              .text),
                                          FFAppState().gstAmt,
                                        );
                                        FFAppState().totalPrice =
                                            _model.res120!;
                                        FFAppState().update(() {});

                                        safeSetState(() {});
                                      } else {
                                        FFAppState().allinclusive = false;
                                        safeSetState(() {});
                                        _model.res111 =
                                            await actions.discountAmt(
                                          double.tryParse(_model
                                              .textFieldDiscountPerTextController
                                              .text),
                                          double.tryParse(_model
                                              .textFieldMrpPriceTextController
                                              .text),
                                        );
                                        FFAppState().disAmt = _model.res111!;
                                        FFAppState().update(() {});
                                        _model.gstAmount11 =
                                            await actions.gstAmt(
                                          double.tryParse(_model
                                              .textFieldMrpPriceTextController
                                              .text),
                                          valueOrDefault<double>(
                                            () {
                                              if (_model.dropDownValue ==
                                                  '12') {
                                                return 12.0;
                                              } else if (_model.dropDownValue ==
                                                  '18') {
                                                return 18.0;
                                              } else if (_model.dropDownValue ==
                                                  '0') {
                                                return 0.0;
                                              } else if (_model.dropDownValue ==
                                                  'GST5') {
                                                return 5.0;
                                              } else if (_model.dropDownValue ==
                                                  '28') {
                                                return 28.0;
                                              } else {
                                                return 18.0;
                                              }
                                            }(),
                                            18.0,
                                          ),
                                        );
                                        FFAppState().gstAmt =
                                            _model.gstAmount11!;
                                        safeSetState(() {});
                                        _model.res121 = await actions.getTotal(
                                          double.tryParse(_model
                                              .textFieldMrpPriceTextController
                                              .text),
                                          FFAppState().disAmt,
                                          double.tryParse(_model
                                              .textFieldDeliveryChrgTextController
                                              .text),
                                          FFAppState().gstAmt,
                                        );
                                        FFAppState().totalPrice =
                                            _model.res121!;
                                        FFAppState().update(() {});

                                        safeSetState(() {});
                                      }
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ],
                            ),
                            if (responsiveVisibility(
                              context: context,
                              phone: false,
                              tablet: false,
                              tabletLandscape: false,
                              desktop: false,
                            ))
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 5.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.07,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: TextFormField(
                                          controller: _model
                                              .textFieldStockTextController,
                                          focusNode:
                                              _model.textFieldStockFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Add Stock',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily),
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          validator: _model
                                              .textFieldStockTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.07,
                                      decoration: BoxDecoration(),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 10.0),
                                        child: TextFormField(
                                          controller: _model
                                              .textFielLeadTimeTextController,
                                          focusNode:
                                              _model.textFielLeadTimeFocusNode,
                                          autofocus: false,
                                          obscureText: false,
                                          decoration: InputDecoration(
                                            hintText: 'Lead Time',
                                            hintStyle:
                                                FlutterFlowTheme.of(context)
                                                    .bodySmall
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodySmallFamily,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts: GoogleFonts
                                                              .asMap()
                                                          .containsKey(
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .bodySmallFamily),
                                                    ),
                                            enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondary,
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00000000),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5.0),
                                            ),
                                          ),
                                          style: FlutterFlowTheme.of(context)
                                              .titleSmall
                                              .override(
                                                fontFamily:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmallFamily,
                                                letterSpacing: 0.0,
                                                useGoogleFonts: GoogleFonts
                                                        .asMap()
                                                    .containsKey(
                                                        FlutterFlowTheme.of(
                                                                context)
                                                            .titleSmallFamily),
                                              ),
                                          keyboardType: TextInputType.number,
                                          validator: _model
                                              .textFielLeadTimeTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            if (FFAppState().hide)
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 10.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.45,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  5.0, 0.0, 5.0, 0.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                flex: 5,
                                                child: Padding(
                                                  padding: EdgeInsets.all(3.0),
                                                  child: TextFormField(
                                                    controller: _model
                                                        .textFieldDiscountPerTextController,
                                                    focusNode: _model
                                                        .textFieldDiscountPerFocusNode,
                                                    onChanged: (_) =>
                                                        EasyDebounce.debounce(
                                                      '_model.textFieldDiscountPerTextController',
                                                      Duration(
                                                          milliseconds: 2000),
                                                      () async {
                                                        _model.res15 =
                                                            await actions
                                                                .discountAmt(
                                                          double.tryParse(_model
                                                              .textFieldDiscountPerTextController
                                                              .text),
                                                          double.tryParse(_model
                                                              .textFieldMrpPriceTextController
                                                              .text),
                                                        );
                                                        FFAppState().disAmt =
                                                            _model.res15!;
                                                        FFAppState()
                                                            .update(() {});
                                                        _model.res16 =
                                                            await actions
                                                                .getTotal(
                                                          double.tryParse(_model
                                                              .textFieldMrpPriceTextController
                                                              .text),
                                                          FFAppState().disAmt,
                                                          double.tryParse(_model
                                                              .textFieldDeliveryChrgTextController
                                                              .text),
                                                          FFAppState().gstAmt,
                                                        );
                                                        FFAppState()
                                                                .totalPrice =
                                                            _model.res16!;
                                                        FFAppState()
                                                            .update(() {});

                                                        safeSetState(() {});
                                                      },
                                                    ),
                                                    autofocus: false,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      isDense: true,
                                                      hintText: 'Discount',
                                                      hintStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .labelLarge
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .labelLargeFamily,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .labelLargeFamily),
                                                              ),
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      errorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedErrorBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0x00000000),
                                                          width: 1.0,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                                    validator: _model
                                                        .textFieldDiscountPerTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                flex: 2,
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    borderRadius:
                                                        BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(0.0),
                                                      bottomRight:
                                                          Radius.circular(5.0),
                                                      topLeft:
                                                          Radius.circular(0.0),
                                                      topRight:
                                                          Radius.circular(5.0),
                                                    ),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SelectionArea(
                                                          child: Text(
                                                        '%',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMedium
                                                                .override(
                                                                  fontFamily: FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily,
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  useGoogleFonts: GoogleFonts
                                                                          .asMap()
                                                                      .containsKey(
                                                                          FlutterFlowTheme.of(context)
                                                                              .titleMediumFamily),
                                                                ),
                                                      )),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.sizeOf(context).width *
                                                0.45,
                                        height:
                                            MediaQuery.sizeOf(context).height *
                                                0.05,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          borderRadius:
                                              BorderRadius.circular(5.0),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .secondary,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10.0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              SelectionArea(
                                                  child: Text(
                                                '₹',
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .headlineSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .headlineSmallFamily,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryText,
                                                          fontSize: 16.0,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .headlineSmallFamily),
                                                        ),
                                              )),
                                              Text(
                                                FFAppState().disAmt.toString(),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleMediumFamily),
                                                        ),
                                              ),
                                            ].divide(SizedBox(width: 10.0)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(width: 10.0)),
                                ),
                              ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.05,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5.0, 0.0, 5.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 2,
                                              child: Container(
                                                width: 100.0,
                                                height: 100.0,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  borderRadius:
                                                      BorderRadius.only(
                                                    bottomLeft:
                                                        Radius.circular(0.0),
                                                    bottomRight:
                                                        Radius.circular(5.0),
                                                    topLeft:
                                                        Radius.circular(0.0),
                                                    topRight:
                                                        Radius.circular(5.0),
                                                  ),
                                                ),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      'GST',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMediumFamily,
                                                                fontSize: 15.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                useGoogleFonts: GoogleFonts
                                                                        .asMap()
                                                                    .containsKey(
                                                                        FlutterFlowTheme.of(context)
                                                                            .bodyMediumFamily),
                                                              ),
                                                    ),
                                                    Expanded(
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5.0,
                                                                    0.0,
                                                                    0.0,
                                                                    0.0),
                                                        child:
                                                            FlutterFlowDropDown<
                                                                String>(
                                                          controller: _model
                                                                  .dropDownValueController ??=
                                                              FormFieldController<
                                                                  String>(
                                                            _model.dropDownValue ??=
                                                                '18',
                                                          ),
                                                          options: [
                                                            '0',
                                                            '5',
                                                            '12',
                                                            '18',
                                                            '28'
                                                          ],
                                                          onChanged:
                                                              (val) async {
                                                            safeSetState(() =>
                                                                _model.dropDownValue =
                                                                    val);
                                                            _model.gstAmount1 =
                                                                await actions
                                                                    .gstAmt(
                                                              double.tryParse(_model
                                                                  .textFieldMrpPriceTextController
                                                                  .text),
                                                              valueOrDefault<
                                                                  double>(
                                                                () {
                                                                  if (_model
                                                                          .dropDownValue ==
                                                                      '12') {
                                                                    return 12.0;
                                                                  } else if (_model
                                                                          .dropDownValue ==
                                                                      '18') {
                                                                    return 18.0;
                                                                  } else if (_model
                                                                          .dropDownValue ==
                                                                      '0') {
                                                                    return 0.0;
                                                                  } else if (_model
                                                                          .dropDownValue ==
                                                                      '5') {
                                                                    return 5.0;
                                                                  } else if (_model
                                                                          .dropDownValue ==
                                                                      '28') {
                                                                    return 28.0;
                                                                  } else if (_model
                                                                          .dropDownValue ==
                                                                      '9') {
                                                                    return 9.0;
                                                                  } else {
                                                                    return 18.0;
                                                                  }
                                                                }(),
                                                                18.0,
                                                              ),
                                                            );
                                                            FFAppState()
                                                                    .gstAmt =
                                                                _model
                                                                    .gstAmount1!;
                                                            safeSetState(() {});
                                                            _model.res20 =
                                                                await actions
                                                                    .getTotal(
                                                              double.tryParse(_model
                                                                  .textFieldMrpPriceTextController
                                                                  .text),
                                                              FFAppState()
                                                                  .disAmt,
                                                              double.tryParse(_model
                                                                  .textFieldDeliveryChrgTextController
                                                                  .text),
                                                              _model.gstAmount1,
                                                            );
                                                            FFAppState()
                                                                    .totalPrice =
                                                                _model.res20!;
                                                            FFAppState()
                                                                .update(() {});

                                                            safeSetState(() {});
                                                          },
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .width *
                                                                  0.28,
                                                          height: 56.0,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        FlutterFlowTheme.of(context)
                                                                            .titleMediumFamily,
                                                                    letterSpacing:
                                                                        0.0,
                                                                    useGoogleFonts: GoogleFonts
                                                                            .asMap()
                                                                        .containsKey(
                                                                            FlutterFlowTheme.of(context).titleMediumFamily),
                                                                  ),
                                                          icon: Icon(
                                                            Icons
                                                                .keyboard_arrow_down_rounded,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryText,
                                                            size: 24.0,
                                                          ),
                                                          fillColor: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          elevation: 2.0,
                                                          borderColor:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .secondary,
                                                          borderWidth: 1.0,
                                                          borderRadius: 8.0,
                                                          margin:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      16.0,
                                                                      4.0,
                                                                      16.0,
                                                                      4.0),
                                                          hidesUnderline: true,
                                                          isOverButton: false,
                                                          isSearchable: false,
                                                          isMultiSelect: false,
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                      SizedBox(width: 10.0)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.45,
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.05,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(5.0),
                                        border: Border.all(
                                          color: FlutterFlowTheme.of(context)
                                              .secondary,
                                        ),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SelectionArea(
                                                child: Text(
                                              '₹',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .headlineSmallFamily,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .secondaryText,
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .headlineSmallFamily),
                                                      ),
                                            )),
                                            Text(
                                              functions
                                                  .roundOff1(
                                                      FFAppState().gstAmt)
                                                  .toString(),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMedium
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .titleMediumFamily,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts: GoogleFonts
                                                                .asMap()
                                                            .containsKey(
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .titleMediumFamily),
                                                      ),
                                            ),
                                          ].divide(SizedBox(width: 10.0)),
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(width: 10.0)),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: Container(
                                width: double.infinity,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.055,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color:
                                        FlutterFlowTheme.of(context).secondary,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 10.0, 0.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      SelectionArea(
                                          child: Text(
                                        'Total Price :',
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                      )),
                                      SelectionArea(
                                          child: Text(
                                        '₹',
                                        style: FlutterFlowTheme.of(context)
                                            .headlineSmall
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .headlineSmallFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primary,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .headlineSmallFamily),
                                            ),
                                      )),
                                      Text(
                                        functions
                                            .roundOff1(FFAppState().totalPrice)
                                            .toString(),
                                        style: FlutterFlowTheme.of(context)
                                            .titleMedium
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily,
                                              letterSpacing: 0.0,
                                              useGoogleFonts: GoogleFonts
                                                      .asMap()
                                                  .containsKey(
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleMediumFamily),
                                            ),
                                      ),
                                    ].divide(SizedBox(width: 10.0)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: StreamBuilder<List<CategoryRecord>>(
                                stream: queryCategoryRecord(
                                  parent: FFAppState().outletRef,
                                  queryBuilder: (categoryRecord) =>
                                      categoryRecord.where(
                                    'type',
                                    isEqualTo: 1,
                                  ),
                                ),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: SpinKitRing(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<CategoryRecord>
                                      dropDownCategoryCategoryRecordList =
                                      snapshot.data!;

                                  return FlutterFlowDropDown<String>(
                                    controller: _model
                                            .dropDownCategoryValueController ??=
                                        FormFieldController<String>(null),
                                    options: dropDownCategoryCategoryRecordList
                                        .map((e) => e.name)
                                        .toList(),
                                    onChanged: (val) => safeSetState(() =>
                                        _model.dropDownCategoryValue = val),
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily),
                                        ),
                                    hintText: 'Select Category',
                                    icon: Icon(
                                      Icons.search,
                                      size: 15.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .customColor2,
                                    borderWidth: 0.0,
                                    borderRadius: 5.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 10.0),
                              child: StreamBuilder<List<UnitTypeRecord>>(
                                stream: queryUnitTypeRecord(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: SpinKitRing(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<UnitTypeRecord>
                                      dropDownUnitTypeUnitTypeRecordList =
                                      snapshot.data!;

                                  return FlutterFlowDropDown<String>(
                                    controller: _model
                                            .dropDownUnitTypeValueController ??=
                                        FormFieldController<String>(null),
                                    options: dropDownUnitTypeUnitTypeRecordList
                                        .map((e) => e.name)
                                        .toList(),
                                    onChanged: (val) => safeSetState(() =>
                                        _model.dropDownUnitTypeValue = val),
                                    width: double.infinity,
                                    height: MediaQuery.sizeOf(context).height *
                                        0.05,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .titleMediumFamily),
                                        ),
                                    hintText: 'Select Unit Type',
                                    icon: Icon(
                                      Icons.search,
                                      size: 15.0,
                                    ),
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    elevation: 2.0,
                                    borderColor: FlutterFlowTheme.of(context)
                                        .customColor2,
                                    borderWidth: 0.0,
                                    borderRadius: 5.0,
                                    margin: EdgeInsetsDirectional.fromSTEB(
                                        12.0, 4.0, 12.0, 4.0),
                                    hidesUnderline: true,
                                    isSearchable: false,
                                    isMultiSelect: false,
                                  );
                                },
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15.0, 0.0, 0.0, 0.0),
                                  child: Text(
                                    'isDealer',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          fontSize: 15.0,
                                          letterSpacing: 0.0,
                                          useGoogleFonts: GoogleFonts.asMap()
                                              .containsKey(
                                                  FlutterFlowTheme.of(context)
                                                      .bodyMediumFamily),
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 0.0, 0.0, 0.0),
                                  child: Switch.adaptive(
                                    value: _model.switchValue2!,
                                    onChanged: (newValue) async {
                                      safeSetState(() =>
                                          _model.switchValue2 = newValue!);
                                    },
                                    activeColor:
                                        FlutterFlowTheme.of(context).primary,
                                    activeTrackColor:
                                        FlutterFlowTheme.of(context).accent1,
                                    inactiveTrackColor:
                                        FlutterFlowTheme.of(context).alternate,
                                    inactiveThumbColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryText,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: double.infinity,
                              height: MediaQuery.sizeOf(context).height * 0.12,
                              decoration: BoxDecoration(),
                              child: StreamBuilder<List<UnitTypeRecord>>(
                                stream: queryUnitTypeRecord(
                                  queryBuilder: (unitTypeRecord) =>
                                      unitTypeRecord.where(
                                    'name',
                                    isEqualTo: _model.dropDownUnitTypeValue,
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
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          size: 30.0,
                                        ),
                                      ),
                                    );
                                  }
                                  List<UnitTypeRecord> rowUnitTypeRecordList =
                                      snapshot.data!;
                                  final rowUnitTypeRecord =
                                      rowUnitTypeRecordList.isNotEmpty
                                          ? rowUnitTypeRecordList.first
                                          : null;

                                  return Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      StreamBuilder<List<CategoryRecord>>(
                                        stream: queryCategoryRecord(
                                          parent: FFAppState().outletRef,
                                          queryBuilder: (categoryRecord) =>
                                              categoryRecord.where(
                                            'name',
                                            isEqualTo:
                                                _model.dropDownCategoryValue,
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
                                          List<CategoryRecord>
                                              containerCategoryRecordList =
                                              snapshot.data!;
                                          final containerCategoryRecord =
                                              containerCategoryRecordList
                                                      .isNotEmpty
                                                  ? containerCategoryRecordList
                                                      .first
                                                  : null;

                                          return Container(
                                            width: MediaQuery.sizeOf(context)
                                                    .width *
                                                0.4,
                                            height: MediaQuery.sizeOf(context)
                                                    .height *
                                                0.067,
                                            decoration: BoxDecoration(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .secondaryBackground,
                                            ),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                      .width *
                                                  0.4,
                                              height: MediaQuery.sizeOf(context)
                                                      .height *
                                                  0.032,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryBackground,
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 20.0, 0.0, 0.0),
                                                child: FFButtonWidget(
                                                  onPressed: () async {
                                                    var _shouldSetState = false;
                                                    if (_model.productDropDownValue !=
                                                            null &&
                                                        _model.productDropDownValue !=
                                                            '') {
                                                      var productRecordReference =
                                                          ProductRecord.createDoc(
                                                              FFAppState()
                                                                  .outletRef!);
                                                      await productRecordReference
                                                          .set(
                                                              createProductRecordData(
                                                        name: _model
                                                            .productDropDownValue,
                                                        type: 1,
                                                        unitRef:
                                                            rowUnitTypeRecord
                                                                ?.reference,
                                                        categoryRef:
                                                            containerCategoryRecord
                                                                ?.reference,
                                                        stock: int.tryParse(_model
                                                            .textFieldStockTextController
                                                            .text),
                                                        delliveryChrg: double
                                                            .tryParse(_model
                                                                .textFieldDeliveryChrgTextController
                                                                .text),
                                                        discountPer: double
                                                            .tryParse(_model
                                                                .textFieldDiscountPerTextController
                                                                .text),
                                                        discountAmt:
                                                            FFAppState().disAmt,
                                                        code: 0,
                                                        mrpPrice: double
                                                            .tryParse(_model
                                                                .textFieldMrpPriceTextController
                                                                .text),
                                                        sellingPrice:
                                                            FFAppState()
                                                                .totalPrice,
                                                        leadTime: _model
                                                            .textFielLeadTimeTextController
                                                            .text,
                                                        isDeleted: false,
                                                        gstPer: _model
                                                            .dropDownValue,
                                                        gstAmt:
                                                            functions.roundOff1(
                                                                FFAppState()
                                                                    .gstAmt),
                                                        netTotal: double
                                                            .tryParse(_model
                                                                .textFieldMrpPriceTextController
                                                                .text),
                                                        id: '',
                                                        isDealer:
                                                            _model.switchValue2,
                                                        inclusiveGST:
                                                            FFAppState()
                                                                .allinclusive,
                                                      ));
                                                      _model.proDoc1 = ProductRecord
                                                          .getDocumentFromData(
                                                              createProductRecordData(
                                                                name: _model
                                                                    .productDropDownValue,
                                                                type: 1,
                                                                unitRef:
                                                                    rowUnitTypeRecord
                                                                        ?.reference,
                                                                categoryRef:
                                                                    containerCategoryRecord
                                                                        ?.reference,
                                                                stock: int.tryParse(
                                                                    _model
                                                                        .textFieldStockTextController
                                                                        .text),
                                                                delliveryChrg: double
                                                                    .tryParse(_model
                                                                        .textFieldDeliveryChrgTextController
                                                                        .text),
                                                                discountPer: double
                                                                    .tryParse(_model
                                                                        .textFieldDiscountPerTextController
                                                                        .text),
                                                                discountAmt:
                                                                    FFAppState()
                                                                        .disAmt,
                                                                code: 0,
                                                                mrpPrice: double
                                                                    .tryParse(_model
                                                                        .textFieldMrpPriceTextController
                                                                        .text),
                                                                sellingPrice:
                                                                    FFAppState()
                                                                        .totalPrice,
                                                                leadTime: _model
                                                                    .textFielLeadTimeTextController
                                                                    .text,
                                                                isDeleted:
                                                                    false,
                                                                gstPer: _model
                                                                    .dropDownValue,
                                                                gstAmt: functions
                                                                    .roundOff1(
                                                                        FFAppState()
                                                                            .gstAmt),
                                                                netTotal: double
                                                                    .tryParse(_model
                                                                        .textFieldMrpPriceTextController
                                                                        .text),
                                                                id: '',
                                                                isDealer: _model
                                                                    .switchValue2,
                                                                inclusiveGST:
                                                                    FFAppState()
                                                                        .allinclusive,
                                                              ),
                                                              productRecordReference);
                                                      _shouldSetState = true;

                                                      await _model
                                                          .proDoc1!.reference
                                                          .update(
                                                              createProductRecordData(
                                                        id: _model.proDoc1
                                                            ?.reference.id,
                                                      ));
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title: Text(
                                                                  'Successfull'),
                                                              content: Text(
                                                                  'Sale Product added successfully'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      FFAppState().disAmt = 0.0;
                                                      FFAppState().totalPrice =
                                                          0.0;
                                                      FFAppState()
                                                          .update(() {});
                                                      if (widget!.np == 1
                                                          ? true
                                                          : false) {
                                                        context.pushNamed(
                                                            SPDashboardWidget
                                                                .routeName);
                                                      } else {
                                                        context.pop();
                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                    } else {
                                                      await showDialog(
                                                        context: context,
                                                        builder:
                                                            (alertDialogContext) {
                                                          return WebViewAware(
                                                            child: AlertDialog(
                                                              title:
                                                                  Text('Alert'),
                                                              content: Text(
                                                                  'Please fill Details'),
                                                              actions: [
                                                                TextButton(
                                                                  onPressed: () =>
                                                                      Navigator.pop(
                                                                          alertDialogContext),
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                              ],
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      if (_shouldSetState)
                                                        safeSetState(() {});
                                                      return;
                                                    }

                                                    if (_shouldSetState)
                                                      safeSetState(() {});
                                                  },
                                                  text: 'Save',
                                                  options: FFButtonOptions(
                                                    width: 150.0,
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
                                                        .primary,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          useGoogleFonts: GoogleFonts
                                                                  .asMap()
                                                              .containsKey(
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .titleSmallFamily),
                                                        ),
                                                    elevation: 2.0,
                                                    borderSide: BorderSide(
                                                      color: Colors.transparent,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.0),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ].divide(SizedBox(height: 10.0)),
                        ),
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
