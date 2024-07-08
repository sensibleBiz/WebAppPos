import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/index.dart';
import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  AppStateNotifier._();

  static AppStateNotifier? _instance;
  static AppStateNotifier get instance => _instance ??= AppStateNotifier._();

  BaseAuthUser? initialUser;
  BaseAuthUser? user;
  bool showSplashImage = true;
  String? _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation!;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(BaseAuthUser newUser) {
    final shouldUpdate =
        user?.uid == null || newUser.uid == null || user?.uid != newUser.uid;
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    // No need to update unless the user has changed.
    if (notifyOnAuthChange && shouldUpdate) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? CDashWidget() : LoginNewFinalWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? CDashWidget() : LoginNewFinalWidget(),
          routes: [
            FFRoute(
              name: 'Device',
              path: 'device',
              builder: (context, params) => DeviceWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'Notifications',
              path: 'notifications',
              builder: (context, params) => NotificationsWidget(),
            ),
            FFRoute(
              name: 'Subscription',
              path: 'subscription',
              builder: (context, params) => SubscriptionWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'ServicePoint',
              path: 'servicePoint',
              builder: (context, params) => ServicePointWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'EditLanguagePopUp',
              path: 'editLanguagePopUp',
              builder: (context, params) => EditLanguagePopUpWidget(),
            ),
            FFRoute(
              name: 'DashboardAdmin',
              path: 'dashboardAdmin',
              builder: (context, params) => DashboardAdminWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
                shiftRef: params.getParam(
                  'shiftRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'SHIFT'],
                ),
                userId: params.getParam(
                  'userId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'CategoryMaster',
              path: 'categoryMaster',
              builder: (context, params) => CategoryMasterWidget(),
            ),
            FFRoute(
              name: 'UnitType',
              path: 'unitType',
              builder: (context, params) => UnitTypeWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'QRLogin',
              path: 'qRLogin',
              builder: (context, params) => QRLoginWidget(),
            ),
            FFRoute(
              name: 'SubCategoryMaster',
              path: 'subCategoryMaster',
              builder: (context, params) => SubCategoryMasterWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'EmailLoginNew',
              path: 'emailLoginNew',
              builder: (context, params) => EmailLoginNewWidget(),
            ),
            FFRoute(
              name: 'BusinessTypeMaster',
              path: 'businessTypeMaster',
              builder: (context, params) => BusinessTypeMasterWidget(),
            ),
            FFRoute(
              name: 'Languages',
              path: 'languages',
              builder: (context, params) => LanguagesWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'BusinessMaster',
              path: 'businessMaster',
              builder: (context, params) => BusinessMasterWidget(),
            ),
            FFRoute(
              name: 'PaymentMaster',
              path: 'paymentMaster',
              builder: (context, params) => PaymentMasterWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'UserRoleType',
              path: 'userRoleType',
              builder: (context, params) => UserRoleTypeWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'cServicePoint',
              path: 'cServicePoint',
              builder: (context, params) => CServicePointWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'ProductMaster',
              path: 'productMaster',
              builder: (context, params) => ProductMasterWidget(
                list: params.getParam(
                  'list',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'cPremises',
              path: 'cPremises',
              builder: (context, params) => CPremisesWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'TaxMaster',
              path: 'taxMaster',
              builder: (context, params) => TaxMasterWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'cReports',
              path: 'cReports',
              builder: (context, params) => CReportsWidget(),
            ),
            FFRoute(
              name: 'cUserAccount',
              path: 'cUserAccount',
              builder: (context, params) => CUserAccountWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'cRecipe',
              path: 'cRecipe',
              builder: (context, params) => CRecipeWidget(),
            ),
            FFRoute(
              name: 'cProducts',
              path: 'cProducts',
              builder: (context, params) => CProductsWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'cCategory',
              path: 'cCategory',
              builder: (context, params) => CCategoryWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'EmailLogin',
              path: 'emailLogin',
              builder: (context, params) => EmailLoginWidget(),
            ),
            FFRoute(
              name: 'cCombo',
              path: 'cCombo',
              builder: (context, params) => CComboWidget(),
            ),
            FFRoute(
              name: 'Contactus',
              path: 'contactus',
              builder: (context, params) => ContactusWidget(),
            ),
            FFRoute(
              name: 'cOutletList',
              path: 'cOutletList',
              builder: (context, params) => COutletListWidget(
                emailId: params.getParam(
                  'emailId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'cCummulativeReport',
              path: 'cCummulativeReport',
              builder: (context, params) => CCummulativeReportWidget(),
            ),
            FFRoute(
              name: 'cSubscription',
              path: 'cSubscription',
              builder: (context, params) => CSubscriptionWidget(),
            ),
            FFRoute(
              name: 'cItemWiseSaleReport',
              path: 'cItemWiseSaleReport',
              builder: (context, params) => CItemWiseSaleReportWidget(
                dayId: params.getParam(
                  'dayId',
                  ParamType.String,
                ),
                shiftId: params.getParam(
                  'shiftId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'cDevice',
              path: 'cDevice',
              asyncParams: {
                'doc': getDoc(['USER_PROFILE'], UserProfileRecord.fromSnapshot),
              },
              builder: (context, params) => CDeviceWidget(
                doc: params.getParam(
                  'doc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'termsNconditions',
              path: 'termsNconditions',
              builder: (context, params) => TermsNconditionsWidget(),
            ),
            FFRoute(
              name: 'AboutUs',
              path: 'aboutUs',
              builder: (context, params) => AboutUsWidget(),
            ),
            FFRoute(
              name: 'cOTPverification',
              path: 'cOTPverification',
              builder: (context, params) => COTPverificationWidget(),
            ),
            FFRoute(
              name: 'dayWiseReport',
              path: 'dayWiseReport',
              builder: (context, params) => DayWiseReportWidget(),
            ),
            FFRoute(
              name: 'categorySalereportNew',
              path: 'categorySalereportNew',
              builder: (context, params) => CategorySalereportNewWidget(
                dayId: params.getParam(
                  'dayId',
                  ParamType.String,
                ),
                shiftId: params.getParam(
                  'shiftId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'WorkInProgress',
              path: 'workInProgress',
              builder: (context, params) => WorkInProgressWidget(),
            ),
            FFRoute(
              name: 'BillWiseReport',
              path: 'BillWiseReport',
              builder: (context, params) => BillWiseReportWidget(
                dayId: params.getParam(
                  'dayId',
                  ParamType.String,
                ),
                shiftId: params.getParam(
                  'shiftId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'AddNewLead',
              path: 'addNewLead',
              builder: (context, params) => AddNewLeadWidget(),
            ),
            FFRoute(
              name: 'cDash',
              path: 'cDash',
              builder: (context, params) => CDashWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
                shiftRef: params.getParam(
                  'shiftRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'SHIFT'],
                ),
                userId: params.getParam(
                  'userId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'callDetailsList',
              path: 'callDetailsList',
              builder: (context, params) => CallDetailsListWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                username: params.getParam(
                  'username',
                  ParamType.String,
                ),
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'custLeads',
              path: 'custLeads',
              builder: (context, params) => CustLeadsWidget(),
            ),
            FFRoute(
              name: 'leadQuery',
              path: 'leadQuery',
              builder: (context, params) => LeadQueryWidget(),
            ),
            FFRoute(
              name: 'FollowUps',
              path: 'FollowUps',
              builder: (context, params) => FollowUpsWidget(),
            ),
            FFRoute(
              name: 'TodayDetails',
              path: 'todayDetails',
              builder: (context, params) => TodayDetailsWidget(),
            ),
            FFRoute(
              name: 'SupportDashboard',
              path: 'supportDashboard',
              builder: (context, params) => SupportDashboardWidget(),
            ),
            FFRoute(
              name: 'LeadLog',
              path: 'leadLog',
              builder: (context, params) => LeadLogWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                username: params.getParam(
                  'username',
                  ParamType.String,
                ),
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
                state: params.getParam(
                  'state',
                  ParamType.String,
                ),
                source: params.getParam(
                  'source',
                  ParamType.String,
                ),
                priority: params.getParam(
                  'priority',
                  ParamType.String,
                ),
                requirement: params.getParam(
                  'requirement',
                  ParamType.String,
                ),
                area: params.getParam(
                  'area',
                  ParamType.String,
                ),
                city: params.getParam(
                  'city',
                  ParamType.String,
                ),
                leadRefId: params.getParam(
                  'leadRefId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'DemoLeads',
              path: 'demoLeads',
              builder: (context, params) => DemoLeadsWidget(),
            ),
            FFRoute(
              name: 'uploadfile',
              path: 'uploadfile',
              builder: (context, params) => UploadfileWidget(),
            ),
            FFRoute(
              name: 'FollowUpLeads',
              path: 'followUpLeads',
              builder: (context, params) => FollowUpLeadsWidget(),
            ),
            FFRoute(
              name: 'LeadsDashboardFinal',
              path: 'leadsDashboard',
              builder: (context, params) => LeadsDashboardFinalWidget(),
            ),
            FFRoute(
              name: 'leadReportToday',
              path: 'leadReportToday',
              builder: (context, params) => LeadReportTodayWidget(),
            ),
            FFRoute(
              name: 'leadSummary',
              path: 'leadSummary',
              builder: (context, params) => LeadSummaryWidget(),
            ),
            FFRoute(
              name: 'cDealerAccount',
              path: 'cDealerAccount',
              builder: (context, params) => CDealerAccountWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'DealerAssignment',
              path: 'DealerAssignment',
              builder: (context, params) => DealerAssignmentWidget(),
            ),
            FFRoute(
              name: 'cOutletListUser4',
              path: 'cOutletListUser4',
              builder: (context, params) => COutletListUser4Widget(
                emailId: params.getParam(
                  'emailId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'LoginNewFinal',
              path: 'loginNewFinal',
              builder: (context, params) => LoginNewFinalWidget(),
            ),
            FFRoute(
              name: 'AdminUserManualView',
              path: 'adminUserManualView',
              builder: (context, params) => AdminUserManualViewWidget(),
            ),
            FFRoute(
              name: 'UserManualAdmin',
              path: 'userManualAdmin',
              builder: (context, params) => UserManualAdminWidget(),
            ),
            FFRoute(
              name: 'EditUserManual',
              path: 'editUserManual',
              asyncParams: {
                'userDoc':
                    getDoc(['USER_MANUAL'], UserManualRecord.fromSnapshot),
                'subHeaderDoc': getDoc(['USER_MANUAL', 'SUB_HEADER'],
                    SubHeaderRecord.fromSnapshot),
              },
              builder: (context, params) => EditUserManualWidget(
                userDoc: params.getParam(
                  'userDoc',
                  ParamType.Document,
                ),
                subHeaderDoc: params.getParam(
                  'subHeaderDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: 'UserManualUserView',
              path: 'userManualUserView',
              builder: (context, params) => UserManualUserViewWidget(
                update: params.getParam(
                  'update',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'cAddProductDetailsNew',
              path: 'cAddProductDetailsNew',
              builder: (context, params) => CAddProductDetailsNewWidget(
                codeLen: params.getParam(
                  'codeLen',
                  ParamType.int,
                ),
                proRef: params.getParam(
                  'proRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PRODUCT'],
                ),
              ),
            ),
            FFRoute(
              name: 'cEditProductDetailsNew',
              path: 'cEditProductDetailsNew',
              builder: (context, params) => CEditProductDetailsNewWidget(
                proRef: params.getParam(
                  'proRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PRODUCT'],
                ),
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                codeLen: params.getParam(
                  'codeLen',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: 'ContactUsNew',
              path: 'contactUsNew',
              builder: (context, params) => ContactUsNewWidget(),
            ),
            FFRoute(
              name: 'image',
              path: 'image',
              builder: (context, params) => ImageWidget(),
            ),
            FFRoute(
              name: 'urlImage',
              path: 'urlImage',
              builder: (context, params) => UrlImageWidget(),
            ),
            FFRoute(
              name: 'DemoActivity',
              path: 'demoActivity',
              asyncParams: {
                'leadActivityDoc': getDoc(['OUTLET', 'LEAD_ACTIVITIES'],
                    LeadActivitiesRecord.fromSnapshot),
              },
              builder: (context, params) => DemoActivityWidget(
                leadActivityDoc: params.getParam(
                  'leadActivityDoc',
                  ParamType.Document,
                ),
                leadMId: params.getParam(
                  'leadMId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'leadReportMonthly',
              path: 'leadReportMonthly',
              builder: (context, params) => LeadReportMonthlyWidget(),
            ),
            FFRoute(
              name: 'leadEmployeeReportFinal',
              path: 'leadEmployeeReportFinal',
              builder: (context, params) => LeadEmployeeReportFinalWidget(),
            ),
            FFRoute(
              name: 'TodayDetailsCopy',
              path: 'todayDetailsCopy',
              builder: (context, params) => TodayDetailsCopyWidget(),
            ),
            FFRoute(
              name: 'employeewiseRecordListFinal',
              path: 'employeewiseRecordListFinal',
              builder: (context, params) => EmployeewiseRecordListFinalWidget(
                assignedTo: params.getParam(
                  'assignedTo',
                  ParamType.String,
                ),
                employeeName: params.getParam(
                  'employeeName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: 'leadDelete',
              path: 'leadDelete',
              builder: (context, params) => LeadDeleteWidget(),
            ),
            FFRoute(
              name: 'LanguagesCopy',
              path: 'languagesCopy',
              builder: (context, params) => LanguagesCopyWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: 'Demos',
              path: 'Demos',
              builder: (context, params) => DemosWidget(),
            ),
            FFRoute(
              name: 'UserManualDocReqKiosk',
              path: 'userManualDocReqKiosk',
              builder: (context, params) => UserManualDocReqKioskWidget(),
            ),
            FFRoute(
              name: 'DealerDasboard',
              path: 'dealerDasboard',
              builder: (context, params) => DealerDasboardWidget(),
            ),
            FFRoute(
              name: 'UploadfilegetLink',
              path: 'uploadfilegetLink',
              builder: (context, params) => UploadfilegetLinkWidget(),
            ),
            FFRoute(
              name: 'UserManualAdminCopy',
              path: 'userManualAdminCopy',
              builder: (context, params) => UserManualAdminCopyWidget(),
            ),
            FFRoute(
              name: 'LeadDasboardChart',
              path: 'leadDasboardChart',
              builder: (context, params) => LeadDasboardChartWidget(),
            ),
            FFRoute(
              name: 'AppSettingsMaster',
              path: 'appSettingsMaster',
              builder: (context, params) => AppSettingsMasterWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ),
      ].map((r) => r.toRoute(appStateNotifier)).toList(),
      observers: [routeObserver],
    );

extension NavParamExtensions on Map<String, String?> {
  Map<String, String> get withoutNulls => Map.fromEntries(
        entries
            .where((e) => e.value != null)
            .map((e) => MapEntry(e.key, e.value!)),
      );
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> pathParameters = const <String, String>{},
    Map<String, String> queryParameters = const <String, String>{},
    Object? extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              pathParameters: pathParameters,
              queryParameters: queryParameters,
              extra: extra,
            );

  void safePop() {
    // If there is only one route on the stack, navigate to the initial
    // page instead of popping.
    if (canPop()) {
      pop();
    } else {
      go('/');
    }
  }
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState => AppStateNotifier.instance;
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void clearRedirectLocation() => appState.clearRedirectLocation();
  void setRedirectLocationIfUnset(String location) =>
      appState.updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(pathParameters)
    ..addAll(uri.queryParameters)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  // Parameters are empty if the params map is empty or if the only parameter
  // present is the special extra parameter reserved for the transition info.
  bool get isEmpty =>
      state.allParams.isEmpty ||
      (state.allParams.length == 1 &&
          state.extraMap.containsKey(kTransitionInfoKey));
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key]!(param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam<T>(
    String paramName,
    ParamType type, {
    bool isList = false,
    List<String>? collectionNamePath,
    StructBuilder<T>? structBuilder,
  }) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam<T>(
      param,
      type,
      isList,
      collectionNamePath: collectionNamePath,
      structBuilder: structBuilder,
    );
  }
}

class FFRoute {
  const FFRoute({
    required this.name,
    required this.path,
    required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (context, state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.uri.toString());
            return '/loginNewFinal';
          }
          return null;
        },
        pageBuilder: (context, state) {
          fixStatusBarOniOS16AndBelow(context);
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Center(
                  child: SizedBox(
                    width: 35.0,
                    height: 35.0,
                    child: SpinKitPulse(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 35.0,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) =>
                          PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).buildTransitions(
                    context,
                    animation,
                    secondaryAnimation,
                    child,
                  ),
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    required this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment? alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 450),
      );
}

class RootPageContext {
  const RootPageContext(this.isRootPage, [this.errorRoute]);
  final bool isRootPage;
  final String? errorRoute;

  static bool isInactiveRootPage(BuildContext context) {
    final rootPageContext = context.read<RootPageContext?>();
    final isRootPage = rootPageContext?.isRootPage ?? false;
    final location = GoRouterState.of(context).uri.toString();
    return isRootPage &&
        location != '/' &&
        location != rootPageContext?.errorRoute;
  }

  static Widget wrap(Widget child, {String? errorRoute}) => Provider.value(
        value: RootPageContext(true, errorRoute),
        child: child,
      );
}

extension GoRouterLocationExtension on GoRouter {
  String getCurrentLocation() {
    final RouteMatch lastMatch = routerDelegate.currentConfiguration.last;
    final RouteMatchList matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }
}
