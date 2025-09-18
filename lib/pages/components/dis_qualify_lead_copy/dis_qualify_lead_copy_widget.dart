import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pages/components/add_tag/add_tag_widget.dart';
import 'dart:ui';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dis_qualify_lead_copy_model.dart';
export 'dis_qualify_lead_copy_model.dart';

class DisQualifyLeadCopyWidget extends StatefulWidget {
  const DisQualifyLeadCopyWidget({
    super.key,
    this.userProfile,
    this.outletLeadDoc,
  });

  final UserProfileRecord? userProfile;
  final OutletLeadsRecord? outletLeadDoc;

  @override
  State<DisQualifyLeadCopyWidget> createState() =>
      _DisQualifyLeadCopyWidgetState();
}

class _DisQualifyLeadCopyWidgetState extends State<DisQualifyLeadCopyWidget> {
  late DisQualifyLeadCopyModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DisQualifyLeadCopyModel());

    _model.textFieldtagTextController ??= TextEditingController();

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

    return Container(
      decoration: BoxDecoration(),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<List<LeadTagRecord>>(
            stream: queryLeadTagRecord(
              parent: FFAppState().outletRef,
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
              List<LeadTagRecord> containerLeadTagRecordList = snapshot.data!;

              return Container(
                width: 600.0,
                height: 440.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                ),
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          FlutterFlowIconButton(
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor:
                                FlutterFlowTheme.of(context).customColor1,
                            icon: Icon(
                              Icons.chevron_left,
                              color: FlutterFlowTheme.of(context).primaryText,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              Navigator.pop(context);
                            },
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                30.0, 0.0, 0.0, 0.0),
                            child: Text(
                              'Tags',
                              style: FlutterFlowTheme.of(context)
                                  .titleMedium
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleMediumFamily,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleMediumIsCustom,
                                  ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Autocomplete<String>(
                                initialValue: TextEditingValue(),
                                optionsBuilder: (textEditingValue) {
                                  if (textEditingValue.text == '') {
                                    return const Iterable<String>.empty();
                                  }
                                  return containerLeadTagRecordList
                                      .map((e) => e.leadTagName)
                                      .toList()
                                      .where((option) {
                                    final lowercaseOption =
                                        option.toLowerCase();
                                    return lowercaseOption.contains(
                                        textEditingValue.text.toLowerCase());
                                  });
                                },
                                optionsViewBuilder:
                                    (context, onSelected, options) {
                                  return AutocompleteOptionsList(
                                    textFieldKey: _model.textFieldtagKey,
                                    textController:
                                        _model.textFieldtagTextController!,
                                    options: options.toList(),
                                    onSelected: onSelected,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .bodyMediumIsCustom,
                                        ),
                                    textHighlightStyle: TextStyle(),
                                    elevation: 4.0,
                                    optionBackgroundColor:
                                        FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                    optionHighlightColor:
                                        FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                    maxHeight: 200.0,
                                  );
                                },
                                onSelected: (String selection) {
                                  safeSetState(() => _model
                                      .textFieldtagSelectedOption = selection);
                                  FocusScope.of(context).unfocus();
                                },
                                fieldViewBuilder: (
                                  context,
                                  textEditingController,
                                  focusNode,
                                  onEditingComplete,
                                ) {
                                  _model.textFieldtagFocusNode = focusNode;

                                  _model.textFieldtagTextController =
                                      textEditingController;
                                  return TextFormField(
                                    key: _model.textFieldtagKey,
                                    controller: textEditingController,
                                    focusNode: focusNode,
                                    onEditingComplete: onEditingComplete,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textFieldtagTextController',
                                      Duration(milliseconds: 2000),
                                      () async {
                                        safeSetState(() {
                                          _model
                                              .simpleSearchResults = TextSearch(
                                            containerLeadTagRecordList
                                                .map(
                                                  (record) =>
                                                      TextSearchItem.fromTerms(
                                                          record, [
                                                    record.leadTagName!
                                                  ]),
                                                )
                                                .toList(),
                                          )
                                              .search(_model
                                                  .textFieldtagTextController
                                                  .text)
                                              .map((r) => r.object)
                                              .toList();
                                          ;
                                        });
                                        FFAppState().tagSearch = true;
                                        safeSetState(() {});
                                      },
                                    ),
                                    autofocus: true,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      isDense: true,
                                      hintText: 'Search Tag Here...',
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .bodyLarge
                                          .override(
                                            fontFamily:
                                                FlutterFlowTheme.of(context)
                                                    .bodyLargeFamily,
                                            letterSpacing: 0.0,
                                            useGoogleFonts:
                                                !FlutterFlowTheme.of(context)
                                                    .bodyLargeIsCustom,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .customColor1,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .primary,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                      ),
                                      filled: true,
                                      fillColor: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .titleMedium
                                        .override(
                                          fontFamily:
                                              FlutterFlowTheme.of(context)
                                                  .titleMediumFamily,
                                          letterSpacing: 0.0,
                                          useGoogleFonts:
                                              !FlutterFlowTheme.of(context)
                                                  .titleMediumIsCustom,
                                        ),
                                    maxLines: null,
                                    validator: _model
                                        .textFieldtagTextControllerValidator
                                        .asValidator(context),
                                  );
                                },
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 5.0, 0.0),
                            child: FlutterFlowIconButton(
                              borderColor:
                                  FlutterFlowTheme.of(context).customColor1,
                              borderRadius: 10.0,
                              borderWidth: 1.0,
                              buttonSize: 40.0,
                              icon: Icon(
                                Icons.close,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 22.0,
                              ),
                              onPressed: () async {
                                safeSetState(() {
                                  _model.textFieldtagTextController?.clear();
                                });
                                FFAppState().tagSearch = false;
                                safeSetState(() {});
                              },
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              _model.tag = await actions.generateTagCode(
                                containerLeadTagRecordList.toList(),
                              );
                              FFAppState().leadtagCode = _model.tag!;
                              safeSetState(() {});
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                barrierColor: Color(0x00000000),
                                enableDrag: false,
                                context: context,
                                builder: (context) {
                                  return WebViewAware(
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: AddTagWidget(
                                        codLen: FFAppState().leadtagCode,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              safeSetState(() {});
                            },
                            text: 'Add',
                            options: FFButtonOptions(
                              width: 80.0,
                              height: 35.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).tertiary,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: FlutterFlowTheme.of(context)
                                        .titleSmallFamily,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryText,
                                    letterSpacing: 0.0,
                                    useGoogleFonts:
                                        !FlutterFlowTheme.of(context)
                                            .titleSmallIsCustom,
                                  ),
                              elevation: 2.0,
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 4.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 3.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Default Tags',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmallIsCustom,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: ClipRRect(
                                        child: Container(
                                          width: 300.0,
                                          height: 160.0,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor1,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.all(5.0),
                                            child: Stack(
                                              children: [
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (!FFAppState()
                                                          .tagSearch)
                                                        Builder(
                                                          builder: (context) {
                                                            final tagLIst =
                                                                containerLeadTagRecordList
                                                                    .map((e) =>
                                                                        e)
                                                                    .toList();

                                                            return Wrap(
                                                              spacing: 0.0,
                                                              runSpacing: 0.0,
                                                              alignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  WrapCrossAlignment
                                                                      .start,
                                                              direction: Axis
                                                                  .horizontal,
                                                              runAlignment:
                                                                  WrapAlignment
                                                                      .start,
                                                              verticalDirection:
                                                                  VerticalDirection
                                                                      .down,
                                                              clipBehavior:
                                                                  Clip.none,
                                                              children: List.generate(
                                                                  tagLIst
                                                                      .length,
                                                                  (tagLIstIndex) {
                                                                final tagLIstItem =
                                                                    tagLIst[
                                                                        tagLIstIndex];
                                                                return Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          5.0),
                                                                  child:
                                                                      InkWell(
                                                                    splashColor:
                                                                        Colors
                                                                            .transparent,
                                                                    focusColor:
                                                                        Colors
                                                                            .transparent,
                                                                    hoverColor:
                                                                        Colors
                                                                            .transparent,
                                                                    highlightColor:
                                                                        Colors
                                                                            .transparent,
                                                                    onTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .addToTagList(
                                                                              getJsonField(
                                                                        functions.generateTaglDetailsJson(
                                                                            tagLIstItem.leadTagName,
                                                                            tagLIstItem.code,
                                                                            tagLIstItem.isDeleted,
                                                                            tagLIstItem.type),
                                                                        r'''$''',
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    onDoubleTap:
                                                                        () async {
                                                                      FFAppState()
                                                                          .addToTagList(
                                                                              getJsonField(
                                                                        functions.generateTaglDetailsJson(
                                                                            tagLIstItem.leadTagName,
                                                                            tagLIstItem.code,
                                                                            tagLIstItem.isDeleted,
                                                                            tagLIstItem.type),
                                                                        r'''$''',
                                                                      ));
                                                                      safeSetState(
                                                                          () {});
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          25.0,
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .secondaryBackground,
                                                                        borderRadius:
                                                                            BorderRadius.circular(5.0),
                                                                        border:
                                                                            Border.all(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondary,
                                                                        ),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.all(1.0),
                                                                        child:
                                                                            Row(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceBetween,
                                                                          children: [
                                                                            if (tagLIstItem.isDeleted ==
                                                                                false)
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  tagLIstItem.leadTagName,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                        fontSize: 11.0,
                                                                                        letterSpacing: 0.0,
                                                                                        useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                );
                                                              }),
                                                            );
                                                          },
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                                SingleChildScrollView(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      if (FFAppState()
                                                          .tagSearch)
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      5.0,
                                                                      0.0,
                                                                      0.0,
                                                                      0.0),
                                                          child: Builder(
                                                            builder: (context) {
                                                              final tagLIst = _model
                                                                  .simpleSearchResults
                                                                  .toList();

                                                              return Wrap(
                                                                spacing: 0.0,
                                                                runSpacing: 0.0,
                                                                alignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    WrapCrossAlignment
                                                                        .start,
                                                                direction: Axis
                                                                    .horizontal,
                                                                runAlignment:
                                                                    WrapAlignment
                                                                        .start,
                                                                verticalDirection:
                                                                    VerticalDirection
                                                                        .down,
                                                                clipBehavior:
                                                                    Clip.none,
                                                                children: List.generate(
                                                                    tagLIst
                                                                        .length,
                                                                    (tagLIstIndex) {
                                                                  final tagLIstItem =
                                                                      tagLIst[
                                                                          tagLIstIndex];
                                                                  return Visibility(
                                                                    visible: tagLIstItem
                                                                            .isDeleted ==
                                                                        false,
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional.fromSTEB(
                                                                          0.0,
                                                                          0.0,
                                                                          5.0,
                                                                          5.0),
                                                                      child:
                                                                          InkWell(
                                                                        splashColor:
                                                                            Colors.transparent,
                                                                        focusColor:
                                                                            Colors.transparent,
                                                                        hoverColor:
                                                                            Colors.transparent,
                                                                        highlightColor:
                                                                            Colors.transparent,
                                                                        onTap:
                                                                            () async {
                                                                          FFAppState()
                                                                              .addToTagList(getJsonField(
                                                                            functions.generateTaglDetailsJson(
                                                                                tagLIstItem.leadTagName,
                                                                                tagLIstItem.code,
                                                                                tagLIstItem.isDeleted,
                                                                                tagLIstItem.type),
                                                                            r'''$''',
                                                                          ));
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        onDoubleTap:
                                                                            () async {
                                                                          FFAppState()
                                                                              .addToTagList(getJsonField(
                                                                            functions.generateTaglDetailsJson(
                                                                                tagLIstItem.leadTagName,
                                                                                tagLIstItem.code,
                                                                                tagLIstItem.isDeleted,
                                                                                tagLIstItem.type),
                                                                            r'''$''',
                                                                          ));
                                                                          safeSetState(
                                                                              () {});
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          height:
                                                                              25.0,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            borderRadius:
                                                                                BorderRadius.circular(5.0),
                                                                            border:
                                                                                Border.all(
                                                                              color: FlutterFlowTheme.of(context).secondary,
                                                                            ),
                                                                          ),
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.all(1.0),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.min,
                                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(3.0, 0.0, 5.0, 0.0),
                                                                                  child: Text(
                                                                                    tagLIstItem.leadTagName,
                                                                                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                          fontFamily: FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                                          fontSize: 11.0,
                                                                                          letterSpacing: 0.0,
                                                                                          useGoogleFonts: !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ),
                                                                        ),
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
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    3.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 1.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    5.0, 0.0, 0.0, 0.0),
                                            child: Text(
                                              'Selected Tags',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodySmall
                                                      .override(
                                                        fontFamily:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodySmallFamily,
                                                        fontSize: 10.0,
                                                        letterSpacing: 0.0,
                                                        useGoogleFonts:
                                                            !FlutterFlowTheme
                                                                    .of(context)
                                                                .bodySmallIsCustom,
                                                      ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 0.0, 5.0),
                                      child: Container(
                                        width: 300.0,
                                        height: 160.0,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .customColor1,
                                          ),
                                        ),
                                        child: SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.all(3.0),
                                                child: Builder(
                                                  builder: (context) {
                                                    final tagL = FFAppState()
                                                        .tagList
                                                        .toList();

                                                    return Wrap(
                                                      spacing: 0.0,
                                                      runSpacing: 0.0,
                                                      alignment:
                                                          WrapAlignment.start,
                                                      crossAxisAlignment:
                                                          WrapCrossAlignment
                                                              .start,
                                                      direction:
                                                          Axis.horizontal,
                                                      runAlignment:
                                                          WrapAlignment.start,
                                                      verticalDirection:
                                                          VerticalDirection
                                                              .down,
                                                      clipBehavior: Clip.none,
                                                      children: List.generate(
                                                          tagL.length,
                                                          (tagLIndex) {
                                                        final tagLItem =
                                                            tagL[tagLIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      5.0,
                                                                      5.0),
                                                          child: Container(
                                                            height: 25.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondary,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5.0),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(1.0),
                                                              child: Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            3.0,
                                                                            0.0,
                                                                            5.0,
                                                                            0.0),
                                                                    child: Text(
                                                                      getJsonField(
                                                                        tagLItem,
                                                                        r'''$.leadTagName''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            fontFamily:
                                                                                FlutterFlowTheme.of(context).bodyMediumFamily,
                                                                            fontSize:
                                                                                11.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            useGoogleFonts:
                                                                                !FlutterFlowTheme.of(context).bodyMediumIsCustom,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  FlutterFlowIconButton(
                                                                    borderColor:
                                                                        Colors
                                                                            .transparent,
                                                                    borderRadius:
                                                                        5.0,
                                                                    buttonSize:
                                                                        22.0,
                                                                    fillColor: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryBackground,
                                                                    icon: Icon(
                                                                      Icons
                                                                          .close,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryText,
                                                                      size: 7.0,
                                                                    ),
                                                                    onPressed:
                                                                        () async {
                                                                      FFAppState()
                                                                          .removeFromTagList(
                                                                              tagLItem);
                                                                      safeSetState(
                                                                          () {});
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                        SnackBar(
                                                                          content:
                                                                              Text(
                                                                            'Removed from List..!',
                                                                            style: FlutterFlowTheme.of(context).headlineSmall.override(
                                                                                  fontFamily: FlutterFlowTheme.of(context).headlineSmallFamily,
                                                                                  color: Color(0x00000000),
                                                                                  letterSpacing: 0.0,
                                                                                  useGoogleFonts: !FlutterFlowTheme.of(context).headlineSmallIsCustom,
                                                                                ),
                                                                          ),
                                                                          duration:
                                                                              Duration(milliseconds: 4000),
                                                                          backgroundColor:
                                                                              FlutterFlowTheme.of(context).alternate,
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                                ],
                                                              ),
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StreamBuilder<List<UserProfileRecord>>(
                            stream: queryUserProfileRecord(
                              queryBuilder: (userProfileRecord) =>
                                  userProfileRecord.where(
                                'email',
                                isEqualTo: FFAppState().currentEmail != ''
                                    ? FFAppState().currentEmail
                                    : null,
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
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      size: 30.0,
                                    ),
                                  ),
                                );
                              }
                              List<UserProfileRecord>
                                  buttonUserProfileRecordList = snapshot.data!;
                              final buttonUserProfileRecord =
                                  buttonUserProfileRecordList.isNotEmpty
                                      ? buttonUserProfileRecordList.first
                                      : null;

                              return FFButtonWidget(
                                onPressed: () async {
                                  var _shouldSetState = false;
                                  if (FFAppState().tagList.length != 0) {
                                    var leadsManagementRecordReference =
                                        LeadsManagementRecord.createDoc(
                                            FFAppState().outletRef!);
                                    await leadsManagementRecordReference.set({
                                      ...createLeadsManagementRecordData(
                                        status: 'disqualified',
                                        stage: 'disqualified',
                                        createdDate: functions.timestampToMili(
                                            getCurrentTimestamp),
                                        assignedTo: FFAppState().userId,
                                        isCustomer: false,
                                        leadRefId:
                                            widget!.outletLeadDoc?.reference.id,
                                        followUpName:
                                            widget!.outletLeadDoc?.username,
                                        area: widget!.outletLeadDoc?.area,
                                        city: widget!.outletLeadDoc?.city,
                                        comments:
                                            widget!.outletLeadDoc?.comments,
                                        date: widget!.outletLeadDoc?.date,
                                        email: widget!.outletLeadDoc?.email,
                                        logId: widget!.outletLeadDoc?.logId,
                                        mobile: widget!.outletLeadDoc?.mobile,
                                        mobileAlt:
                                            widget!.outletLeadDoc?.mobileAlt,
                                        phone: widget!.outletLeadDoc?.phone,
                                        requirement:
                                            widget!.outletLeadDoc?.requirement,
                                        source: widget!.outletLeadDoc?.source,
                                        time: widget!.outletLeadDoc?.time,
                                        username:
                                            widget!.outletLeadDoc?.username,
                                        state: widget!.outletLeadDoc?.state,
                                        remarks: '#',
                                        updatedDate: functions.timestampToMili(
                                            getCurrentTimestamp),
                                        priority: valueOrDefault<String>(
                                          widget!.outletLeadDoc?.priority ==
                                                      null ||
                                                  widget!.outletLeadDoc
                                                          ?.priority ==
                                                      ''
                                              ? ''
                                              : widget!.outletLeadDoc?.priority,
                                          '\"\"',
                                        ),
                                        leadCreatedDate:
                                            functions.timestampToMili(widget!
                                                .outletLeadDoc
                                                ?.createdDateTime),
                                        leadDate: widget!.outletLeadDoc?.date,
                                        businessName:
                                            widget!.outletLeadDoc?.businessName,
                                        businessType:
                                            widget!.outletLeadDoc?.businessType,
                                        isDealerLead: false,
                                        assignedBy: FFAppState().userId,
                                        ticket: widget!.outletLeadDoc?.ticket,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'leadTag': [
                                            getLeadTagListFirestoreData(
                                              createLeadTagListStruct(
                                                code: 0,
                                                isDeleted: false,
                                                leadTagName: '',
                                                type: '',
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              true,
                                            )
                                          ],
                                          'assignedToHistory': [
                                            getAssignedToHistoryFirestoreData(
                                              createAssignedToHistoryStruct(
                                                userProfileId:
                                                    FFAppState().userId,
                                                assignedDate:
                                                    getCurrentTimestamp
                                                        .millisecondsSinceEpoch,
                                                assignedDateTime:
                                                    getCurrentTimestamp,
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              true,
                                            )
                                          ],
                                        },
                                      ),
                                    });
                                    _model.res1 = LeadsManagementRecord
                                        .getDocumentFromData({
                                      ...createLeadsManagementRecordData(
                                        status: 'disqualified',
                                        stage: 'disqualified',
                                        createdDate: functions.timestampToMili(
                                            getCurrentTimestamp),
                                        assignedTo: FFAppState().userId,
                                        isCustomer: false,
                                        leadRefId:
                                            widget!.outletLeadDoc?.reference.id,
                                        followUpName:
                                            widget!.outletLeadDoc?.username,
                                        area: widget!.outletLeadDoc?.area,
                                        city: widget!.outletLeadDoc?.city,
                                        comments:
                                            widget!.outletLeadDoc?.comments,
                                        date: widget!.outletLeadDoc?.date,
                                        email: widget!.outletLeadDoc?.email,
                                        logId: widget!.outletLeadDoc?.logId,
                                        mobile: widget!.outletLeadDoc?.mobile,
                                        mobileAlt:
                                            widget!.outletLeadDoc?.mobileAlt,
                                        phone: widget!.outletLeadDoc?.phone,
                                        requirement:
                                            widget!.outletLeadDoc?.requirement,
                                        source: widget!.outletLeadDoc?.source,
                                        time: widget!.outletLeadDoc?.time,
                                        username:
                                            widget!.outletLeadDoc?.username,
                                        state: widget!.outletLeadDoc?.state,
                                        remarks: '#',
                                        updatedDate: functions.timestampToMili(
                                            getCurrentTimestamp),
                                        priority: valueOrDefault<String>(
                                          widget!.outletLeadDoc?.priority ==
                                                      null ||
                                                  widget!.outletLeadDoc
                                                          ?.priority ==
                                                      ''
                                              ? ''
                                              : widget!.outletLeadDoc?.priority,
                                          '\"\"',
                                        ),
                                        leadCreatedDate:
                                            functions.timestampToMili(widget!
                                                .outletLeadDoc
                                                ?.createdDateTime),
                                        leadDate: widget!.outletLeadDoc?.date,
                                        businessName:
                                            widget!.outletLeadDoc?.businessName,
                                        businessType:
                                            widget!.outletLeadDoc?.businessType,
                                        isDealerLead: false,
                                        assignedBy: FFAppState().userId,
                                        ticket: widget!.outletLeadDoc?.ticket,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'leadTag': [
                                            getLeadTagListFirestoreData(
                                              createLeadTagListStruct(
                                                code: 0,
                                                isDeleted: false,
                                                leadTagName: '',
                                                type: '',
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              true,
                                            )
                                          ],
                                          'assignedToHistory': [
                                            getAssignedToHistoryFirestoreData(
                                              createAssignedToHistoryStruct(
                                                userProfileId:
                                                    FFAppState().userId,
                                                assignedDate:
                                                    getCurrentTimestamp
                                                        .millisecondsSinceEpoch,
                                                assignedDateTime:
                                                    getCurrentTimestamp,
                                                clearUnsetFields: false,
                                                create: true,
                                              ),
                                              true,
                                            )
                                          ],
                                        },
                                      ),
                                    }, leadsManagementRecordReference);
                                    _shouldSetState = true;
                                    _model.taglist = await actions.leadTagLIst(
                                      FFAppState().tagList.toList(),
                                    );
                                    _shouldSetState = true;
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Doc Created...!',
                                          style: TextStyle(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryText,
                                          ),
                                        ),
                                        duration: Duration(milliseconds: 4000),
                                        backgroundColor:
                                            FlutterFlowTheme.of(context)
                                                .secondary,
                                      ),
                                    );

                                    await _model.res1!.reference.update({
                                      ...createLeadsManagementRecordData(
                                        id: _model.res1?.reference.id,
                                      ),
                                      ...mapToFirestore(
                                        {
                                          'leadTag':
                                              getLeadTagListListFirestoreData(
                                            _model.taglist,
                                          ),
                                        },
                                      ),
                                    });

                                    await functions
                                        .getLeadDocRefFromIdCopy(
                                            widget!.outletLeadDoc?.reference.id,
                                            FFAppState().outletId)
                                        .update(createOutletLeadsRecordData(
                                          status: 'DISQUALIFIED',
                                        ));
                                    FFAppState().tagList = [];
                                    safeSetState(() {});

                                    context.pushNamed(
                                        LeadsDashboardNewWidget.routeName);
                                  } else {
                                    await showDialog(
                                      context: context,
                                      builder: (alertDialogContext) {
                                        return WebViewAware(
                                          child: AlertDialog(
                                            title: Text('Error!!!'),
                                            content: Text(
                                                'Please select tags to disqualify'),
                                            actions: [
                                              TextButton(
                                                onPressed: () => Navigator.pop(
                                                    alertDialogContext),
                                                child: Text('Ok'),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                    if (_shouldSetState) safeSetState(() {});
                                    return;
                                  }

                                  if (_shouldSetState) safeSetState(() {});
                                },
                                text: 'Save',
                                options: FFButtonOptions(
                                  width: 150.0,
                                  height: 40.0,
                                  padding: EdgeInsets.all(0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: FlutterFlowTheme.of(context).primary,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: FlutterFlowTheme.of(context)
                                            .titleSmallFamily,
                                        color: Colors.white,
                                        letterSpacing: 0.0,
                                        useGoogleFonts:
                                            !FlutterFlowTheme.of(context)
                                                .titleSmallIsCustom,
                                      ),
                                  elevation: 3.0,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
