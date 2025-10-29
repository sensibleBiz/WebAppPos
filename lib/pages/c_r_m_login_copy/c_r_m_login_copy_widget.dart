import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:ui';
import '/flutter_flow/custom_functions.dart' as functions;
import '/index.dart';
import 'package:flip_card/flip_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'c_r_m_login_copy_model.dart';
export 'c_r_m_login_copy_model.dart';

class CRMLoginCopyWidget extends StatefulWidget {
  const CRMLoginCopyWidget({super.key});

  static String routeName = 'CRMLoginCopy';
  static String routePath = 'CRM-Login-copy';

  @override
  State<CRMLoginCopyWidget> createState() => _CRMLoginCopyWidgetState();
}

class _CRMLoginCopyWidgetState extends State<CRMLoginCopyWidget> {
  late CRMLoginCopyModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CRMLoginCopyModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {});

    _model.textFieldEmailTextController ??= TextEditingController();
    _model.textFieldEmailFocusNode ??= FocusNode();

    _model.textFieldPwdTextController ??= TextEditingController();
    _model.textFieldPwdFocusNode ??= FocusNode();

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
        title: 'CRM-Login-copy',
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
                    child: Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: Image.asset(
                            'assets/images/Web_Login_Page_1.jpg',
                          ).image,
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 50.0, 50.0),
                            child: FlipCard(
                              fill: Fill.fillBack,
                              direction: FlipDirection.HORIZONTAL,
                              speed: 400,
                              front: Container(
                                width: MediaQuery.sizeOf(context).width * 0.35,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20.0, 100.0, 20.0, 0.0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 50.0),
                                              child: InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                      RegisterComplaintDemoWidget
                                                          .routeName);
                                                },
                                                child: Container(
                                                  width: 180.0,
                                                  height: 110.0,
                                                  decoration: BoxDecoration(
                                                    image: DecorationImage(
                                                      fit: BoxFit.contain,
                                                      image: Image.asset(
                                                        'assets/images/Sensible_Logo_Large.png',
                                                      ).image,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 15.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .textFieldEmailTextController,
                                                focusNode: _model
                                                    .textFieldEmailFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textFieldEmailTextController',
                                                  Duration(milliseconds: 2000),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: true,
                                                obscureText: false,
                                                decoration: InputDecoration(
                                                  isDense: false,
                                                  hintText: 'Email id',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallIsCustom,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      width: 0.75,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 0.75,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.75,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.75,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                                validator: _model
                                                    .textFieldEmailTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      0.0, 0.0, 0.0, 30.0),
                                              child: TextFormField(
                                                controller: _model
                                                    .textFieldPwdTextController,
                                                focusNode: _model
                                                    .textFieldPwdFocusNode,
                                                onChanged: (_) =>
                                                    EasyDebounce.debounce(
                                                  '_model.textFieldPwdTextController',
                                                  Duration(milliseconds: 2000),
                                                  () => safeSetState(() {}),
                                                ),
                                                autofocus: true,
                                                obscureText: !_model
                                                    .textFieldPwdVisibility,
                                                decoration: InputDecoration(
                                                  isDense: false,
                                                  hintText: 'Password',
                                                  hintStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .bodySmall
                                                          .override(
                                                            fontFamily:
                                                                FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallFamily,
                                                            letterSpacing: 0.0,
                                                            useGoogleFonts:
                                                                !FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodySmallIsCustom,
                                                          ),
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .customColor1,
                                                      width: 0.75,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      width: 0.75,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.75,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .error,
                                                      width: 0.75,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  filled: true,
                                                  fillColor:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .secondaryBackground,
                                                  suffixIcon: InkWell(
                                                    onTap: () => safeSetState(
                                                      () => _model
                                                              .textFieldPwdVisibility =
                                                          !_model
                                                              .textFieldPwdVisibility,
                                                    ),
                                                    focusNode: FocusNode(
                                                        skipTraversal: true),
                                                    child: Icon(
                                                      _model.textFieldPwdVisibility
                                                          ? Icons
                                                              .visibility_outlined
                                                          : Icons
                                                              .visibility_off_outlined,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 22.0,
                                                    ),
                                                  ),
                                                ),
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .titleMedium
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleMediumFamily,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleMediumIsCustom,
                                                        ),
                                                validator: _model
                                                    .textFieldPwdTextControllerValidator
                                                    .asValidator(context),
                                              ),
                                            ),
                                            FFButtonWidget(
                                              onPressed: () async {
                                                var _shouldSetState = false;
                                                if (_model.textFieldEmailTextController
                                                            .text !=
                                                        null &&
                                                    _model.textFieldEmailTextController
                                                            .text !=
                                                        '') {
                                                  GoRouter.of(context)
                                                      .prepareAuthEvent();

                                                  final user = await authManager
                                                      .signInWithEmail(
                                                    context,
                                                    _model
                                                        .textFieldEmailTextController
                                                        .text,
                                                    _model
                                                        .textFieldPwdTextController
                                                        .text,
                                                  );
                                                  if (user == null) {
                                                    return;
                                                  }

                                                  _model.fetchedRecordUserProfile =
                                                      await queryUserProfileRecordOnce(
                                                    queryBuilder:
                                                        (userProfileRecord) =>
                                                            userProfileRecord
                                                                .where(
                                                                  'email',
                                                                  isEqualTo: _model
                                                                      .textFieldEmailTextController
                                                                      .text,
                                                                )
                                                                .where(
                                                                  'password',
                                                                  isEqualTo: _model
                                                                      .textFieldPwdTextController
                                                                      .text,
                                                                ),
                                                    singleRecord: true,
                                                  ).then((s) => s.firstOrNull);
                                                  _shouldSetState = true;
                                                  if (_model
                                                          .fetchedRecordUserProfile !=
                                                      null) {
                                                    _model.cities =
                                                        await queryCitiesRecordOnce(
                                                      queryBuilder:
                                                          (citiesRecord) =>
                                                              citiesRecord
                                                                  .orderBy(
                                                                      'cityName'),
                                                    );
                                                    _shouldSetState = true;
                                                    _model.states =
                                                        await queryStateRecordOnce(
                                                      queryBuilder:
                                                          (stateRecord) =>
                                                              stateRecord
                                                                  .orderBy(
                                                                      'name'),
                                                    );
                                                    _shouldSetState = true;
                                                    FFAppState().outletId = _model
                                                        .fetchedRecordUserProfile!
                                                        .outletId;
                                                    FFAppState().role = _model
                                                        .fetchedRecordUserProfile!
                                                        .role;
                                                    FFAppState()
                                                            .userProfileRef =
                                                        _model
                                                            .fetchedRecordUserProfile
                                                            ?.reference;
                                                    FFAppState()
                                                            .loggedInUserPermisions =
                                                        _model
                                                            .fetchedRecordUserProfile!
                                                            .permissionList
                                                            .toList()
                                                            .cast<
                                                                UserAccesCStruct>();
                                                    FFAppState().currentEmail =
                                                        _model
                                                            .textFieldEmailTextController
                                                            .text;
                                                    FFAppState().userId = _model
                                                        .fetchedRecordUserProfile!
                                                        .id;
                                                    FFAppState().cities =
                                                        functions
                                                            .addCityList(_model
                                                                .cities!
                                                                .toList())
                                                            .toList()
                                                            .cast<
                                                                CityListStruct>();
                                                    FFAppState().curUserName =
                                                        _model
                                                            .fetchedRecordUserProfile!
                                                            .name;
                                                    FFAppState().isLoggedIn =
                                                        true;
                                                    safeSetState(() {});
                                                    if (_model
                                                            .fetchedRecordUserProfile
                                                            ?.outlets
                                                            ?.length ==
                                                        1) {
                                                      _model.outletDoc =
                                                          await queryOutletRecordOnce(
                                                        queryBuilder:
                                                            (outletRecord) =>
                                                                outletRecord
                                                                    .where(
                                                          'id',
                                                          isEqualTo: _model
                                                              .fetchedRecordUserProfile
                                                              ?.outletId,
                                                        ),
                                                        singleRecord: true,
                                                      ).then((s) =>
                                                              s.firstOrNull);
                                                      _shouldSetState = true;
                                                      _model.categoryDocs =
                                                          await queryCategoryRecordOnce(
                                                        parent: _model.outletDoc
                                                            ?.reference,
                                                        queryBuilder:
                                                            (categoryRecord) =>
                                                                categoryRecord
                                                                    .where(
                                                          'isDeleted',
                                                          isEqualTo: false,
                                                        ),
                                                      );
                                                      _shouldSetState = true;
                                                      _model.productDocs =
                                                          await queryProductRecordOnce(
                                                        parent: _model.outletDoc
                                                            ?.reference,
                                                        queryBuilder:
                                                            (productRecord) =>
                                                                productRecord
                                                                    .where(
                                                          'isDeleted',
                                                          isEqualTo: false,
                                                        ),
                                                      );
                                                      _shouldSetState = true;
                                                      _model.teamTree =
                                                          await queryTeamTreeRecordOnce(
                                                        parent: _model.outletDoc
                                                            ?.reference,
                                                      );
                                                      _shouldSetState = true;
                                                      FFAppState().outletRef =
                                                          _model.outletDoc
                                                              ?.reference;
                                                      FFAppState().outletId =
                                                          _model.outletDoc!.id;
                                                      FFAppState().billingType =
                                                          _model.outletDoc!
                                                              .billingType;
                                                      FFAppState().shift =
                                                          functions.getDayId();
                                                      FFAppState()
                                                              .categoryList =
                                                          functions
                                                              .addCategoryList(
                                                                  _model
                                                                      .categoryDocs!
                                                                      .toList())
                                                              .toList()
                                                              .cast<
                                                                  CategoryDataTypeStruct>();
                                                      FFAppState()
                                                              .productsList =
                                                          functions
                                                              .addProductLis(_model
                                                                  .productDocs!
                                                                  .toList())
                                                              .toList()
                                                              .cast<
                                                                  ProductDataTypeStruct>();
                                                      FFAppState()
                                                              .TeamTreeUsers =
                                                          functions
                                                              .addTeamTree(
                                                                  _model
                                                                      .teamTree!
                                                                      .toList())
                                                              .toList()
                                                              .cast<
                                                                  TeamTreeDatatypeStruct>();
                                                      FFAppState()
                                                          .update(() {});
                                                      if (_model.outletDoc
                                                              ?.billingType ==
                                                          'CRM') {
                                                        _model.teamTREE =
                                                            await queryTeamTreeRecordOnce(
                                                          parent: FFAppState()
                                                              .outletRef,
                                                          queryBuilder:
                                                              (teamTreeRecord) =>
                                                                  teamTreeRecord
                                                                      .where(
                                                            'userProfileId',
                                                            isEqualTo: _model
                                                                .fetchedRecordUserProfile
                                                                ?.id,
                                                          ),
                                                          singleRecord: true,
                                                        ).then((s) =>
                                                                s.firstOrNull);
                                                        _shouldSetState = true;
                                                        FFAppState().zone =
                                                            _model
                                                                .teamTREE!.zone;
                                                        FFAppState()
                                                                .currentUserZoneList =
                                                            _model.teamTREE!
                                                                .zoneList
                                                                .toList()
                                                                .cast<String>();
                                                        FFAppState()
                                                                .stageListPermissionState =
                                                            _model.teamTREE!
                                                                .stageAccessList
                                                                .toList()
                                                                .cast<
                                                                    StageAccessDataTypeStruct>();
                                                        FFAppState().states = functions
                                                            .addStatesList(
                                                                _model.states!
                                                                    .toList(),
                                                                FFAppState()
                                                                    .currentUserZoneList
                                                                    .toList())
                                                            .toList()
                                                            .cast<
                                                                StatesStruct>();
                                                        FFAppState()
                                                                .roleInZone =
                                                            _model.teamTREE!
                                                                .roleInZone;
                                                        FFAppState()
                                                                .currentLoggedInUserId =
                                                            _model
                                                                .fetchedRecordUserProfile!
                                                                .id;
                                                        safeSetState(() {});
                                                        if (FFAppState()
                                                                .loggedInUserPermisions
                                                                .elementAtOrNull(
                                                                    16)
                                                                ?.value ==
                                                            4) {
                                                          context.pushNamedAuth(
                                                              DeyeDashboardSupportWidget
                                                                  .routeName,
                                                              context.mounted);

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else if ((FFAppState()
                                                                    .loggedInUserPermisions
                                                                    .elementAtOrNull(
                                                                        16)
                                                                    ?.value ==
                                                                1) &&
                                                            (FFAppState()
                                                                    .role ==
                                                                'user') &&
                                                            (_model.teamTREE
                                                                    ?.roleInZone ==
                                                                'manager')) {
                                                          FFAppState()
                                                                  .readOnlyAccess =
                                                              true;
                                                          safeSetState(() {});
                                                        } else if (FFAppState()
                                                                .loggedInUserPermisions
                                                                .elementAtOrNull(
                                                                    16)
                                                                ?.value ==
                                                            3) {
                                                          context.pushNamedAuth(
                                                              DeyeAttendanceAdminWidget
                                                                  .routeName,
                                                              context.mounted);

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        } else {
                                                          context.pushNamedAuth(
                                                              DeyeDashboardWidget
                                                                  .routeName,
                                                              context.mounted);

                                                          if (_shouldSetState)
                                                            safeSetState(() {});
                                                          return;
                                                        }

                                                        context.pushNamedAuth(
                                                            DeyeDashboardWidget
                                                                .routeName,
                                                            context.mounted);
                                                      } else {
                                                        if (FFAppState().role ==
                                                            'admin') {
                                                          context.pushNamedAuth(
                                                            CDashWidget
                                                                .routeName,
                                                            context.mounted,
                                                            queryParameters: {
                                                              'outletId':
                                                                  serializeParam(
                                                                _model.outletDoc
                                                                    ?.reference,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'shiftRef':
                                                                  serializeParam(
                                                                FFAppState()
                                                                    .docRef,
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                              'userId':
                                                                  serializeParam(
                                                                _model
                                                                    .fetchedRecordUserProfile
                                                                    ?.id,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else if (FFAppState()
                                                                .role ==
                                                            'SuperAdmin') {
                                                          context.pushNamedAuth(
                                                              DashboardAdminWidget
                                                                  .routeName,
                                                              context.mounted);
                                                        } else if (((_model
                                                                        .fetchedRecordUserProfile
                                                                        ?.permissionList
                                                                        ?.elementAtOrNull(
                                                                            10))
                                                                    ?.value ==
                                                                4) ||
                                                            ((_model.fetchedRecordUserProfile
                                                                        ?.permissionList
                                                                        ?.elementAtOrNull(
                                                                            8))
                                                                    ?.value ==
                                                                2)) {
                                                          context.pushNamedAuth(
                                                            COutletListUser4Widget
                                                                .routeName,
                                                            context.mounted,
                                                            queryParameters: {
                                                              'emailId':
                                                                  serializeParam(
                                                                _model
                                                                    .textFieldEmailTextController
                                                                    .text,
                                                                ParamType
                                                                    .String,
                                                              ),
                                                            }.withoutNulls,
                                                          );
                                                        } else if (FFAppState()
                                                                .role ==
                                                            'support') {
                                                          context.pushNamedAuth(
                                                              AdminUserManualViewWidget
                                                                  .routeName,
                                                              context.mounted);
                                                        } else {
                                                          await showDialog(
                                                            context: context,
                                                            builder:
                                                                (alertDialogContext) {
                                                              return WebViewAware(
                                                                child:
                                                                    AlertDialog(
                                                                  title: Text(
                                                                      'In valid  login'),
                                                                  actions: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () =>
                                                                              Navigator.pop(alertDialogContext),
                                                                      child: Text(
                                                                          'Ok'),
                                                                    ),
                                                                  ],
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        }

                                                        if (_shouldSetState)
                                                          safeSetState(() {});
                                                        return;
                                                      }
                                                    } else {
                                                      context.pushNamedAuth(
                                                        COutletListWidget
                                                            .routeName,
                                                        context.mounted,
                                                        queryParameters: {
                                                          'emailId':
                                                              serializeParam(
                                                            FFAppState()
                                                                .currentEmail,
                                                            ParamType.String,
                                                          ),
                                                        }.withoutNulls,
                                                      );
                                                    }
                                                  } else {
                                                    await showDialog(
                                                      context: context,
                                                      builder:
                                                          (alertDialogContext) {
                                                        return WebViewAware(
                                                          child: AlertDialog(
                                                            title:
                                                                Text('Alert !'),
                                                            content: Text(
                                                                'Data  Not Found'),
                                                            actions: [
                                                              TextButton(
                                                                onPressed: () =>
                                                                    Navigator.pop(
                                                                        alertDialogContext),
                                                                child:
                                                                    Text('Ok'),
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
                                                } else {
                                                  await showDialog(
                                                    context: context,
                                                    builder:
                                                        (alertDialogContext) {
                                                      return WebViewAware(
                                                        child: AlertDialog(
                                                          title: Text('Alert'),
                                                          content: Text(
                                                              'Please Enter Email'),
                                                          actions: [
                                                            TextButton(
                                                              onPressed: () =>
                                                                  Navigator.pop(
                                                                      alertDialogContext),
                                                              child: Text('Ok'),
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
                                              text: 'Submit',
                                              options: FFButtonOptions(
                                                height: 40.0,
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        24.0, 0.0, 24.0, 0.0),
                                                iconPadding:
                                                    EdgeInsetsDirectional
                                                        .fromSTEB(
                                                            0.0, 0.0, 0.0, 0.0),
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primary,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .titleSmall
                                                        .override(
                                                          fontFamily:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .titleSmallFamily,
                                                          color: Colors.white,
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts:
                                                              !FlutterFlowTheme
                                                                      .of(context)
                                                                  .titleSmallIsCustom,
                                                        ),
                                                elevation: 3.0,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                            ),
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 5.0, 0.0, 0.0),
                                              child: Text(
                                                '1.1.28',
                                                style: FlutterFlowTheme.of(
                                                        context)
                                                    .displayLarge
                                                    .override(
                                                      fontFamily:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .displayLargeFamily,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .info,
                                                      fontSize: 12.0,
                                                      letterSpacing: 0.0,
                                                      useGoogleFonts:
                                                          !FlutterFlowTheme.of(
                                                                  context)
                                                              .displayLargeIsCustom,
                                                    ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        'Switch to QR',
                                        style: FlutterFlowTheme.of(context)
                                            .displayLarge
                                            .override(
                                              fontFamily:
                                                  FlutterFlowTheme.of(context)
                                                      .displayLargeFamily,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .customColor1,
                                              letterSpacing: 0.0,
                                              useGoogleFonts:
                                                  !FlutterFlowTheme.of(context)
                                                      .displayLargeIsCustom,
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              back: Container(
                                width: MediaQuery.sizeOf(context).width * 0.35,
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(0.0),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 250.0,
                                      height: 250.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .customColor1,
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
          ),
        ));
  }
}
