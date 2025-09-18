import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';

import '/auth/base_auth_user_provider.dart';

import '/main.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/lat_lng.dart';
import '/flutter_flow/place.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'serialization_util.dart';

import '/index.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

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
      navigatorKey: appNavigatorKey,
      errorBuilder: (context, state) =>
          appStateNotifier.loggedIn ? COutletListWidget() : CRMLoginWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) => appStateNotifier.loggedIn
              ? COutletListWidget()
              : CRMLoginWidget(),
          routes: [
            FFRoute(
              name: DeviceWidget.routeName,
              path: DeviceWidget.routePath,
              builder: (context, params) => DeviceWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: NotificationsWidget.routeName,
              path: NotificationsWidget.routePath,
              builder: (context, params) => NotificationsWidget(),
            ),
            FFRoute(
              name: SubscriptionWidget.routeName,
              path: SubscriptionWidget.routePath,
              builder: (context, params) => SubscriptionWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: ServicePointWidget.routeName,
              path: ServicePointWidget.routePath,
              builder: (context, params) => ServicePointWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EditLanguagePopUpWidget.routeName,
              path: EditLanguagePopUpWidget.routePath,
              builder: (context, params) => EditLanguagePopUpWidget(),
            ),
            FFRoute(
              name: DashboardAdminWidget.routeName,
              path: DashboardAdminWidget.routePath,
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
              name: CategoryMasterWidget.routeName,
              path: CategoryMasterWidget.routePath,
              builder: (context, params) => CategoryMasterWidget(),
            ),
            FFRoute(
              name: UnitTypeWidget.routeName,
              path: UnitTypeWidget.routePath,
              builder: (context, params) => UnitTypeWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: QRLoginWidget.routeName,
              path: QRLoginWidget.routePath,
              builder: (context, params) => QRLoginWidget(),
            ),
            FFRoute(
              name: SubCategoryMasterWidget.routeName,
              path: SubCategoryMasterWidget.routePath,
              builder: (context, params) => SubCategoryMasterWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: EmailLoginNewNotInUseWidget.routeName,
              path: EmailLoginNewNotInUseWidget.routePath,
              builder: (context, params) => EmailLoginNewNotInUseWidget(),
            ),
            FFRoute(
              name: BusinessTypeMasterWidget.routeName,
              path: BusinessTypeMasterWidget.routePath,
              builder: (context, params) => BusinessTypeMasterWidget(),
            ),
            FFRoute(
              name: LanguagesWidget.routeName,
              path: LanguagesWidget.routePath,
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
              name: BusinessMasterWidget.routeName,
              path: BusinessMasterWidget.routePath,
              builder: (context, params) => BusinessMasterWidget(),
            ),
            FFRoute(
              name: PaymentMasterWidget.routeName,
              path: PaymentMasterWidget.routePath,
              builder: (context, params) => PaymentMasterWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: UserRoleTypeWidget.routeName,
              path: UserRoleTypeWidget.routePath,
              builder: (context, params) => UserRoleTypeWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CServicePointWidget.routeName,
              path: CServicePointWidget.routePath,
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
              name: ProductMasterWidget.routeName,
              path: ProductMasterWidget.routePath,
              builder: (context, params) => ProductMasterWidget(
                list: params.getParam(
                  'list',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CPremisesWidget.routeName,
              path: CPremisesWidget.routePath,
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
              name: TaxMasterWidget.routeName,
              path: TaxMasterWidget.routePath,
              builder: (context, params) => TaxMasterWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CReportsWidget.routeName,
              path: CReportsWidget.routePath,
              builder: (context, params) => CReportsWidget(),
            ),
            FFRoute(
              name: CUserAccountWidget.routeName,
              path: CUserAccountWidget.routePath,
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
              name: CRecipeWidget.routeName,
              path: CRecipeWidget.routePath,
              builder: (context, params) => CRecipeWidget(),
            ),
            FFRoute(
              name: CProductsWidget.routeName,
              path: CProductsWidget.routePath,
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
              name: CCategoryWidget.routeName,
              path: CCategoryWidget.routePath,
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
              name: EmailLoginNotInUseWidget.routeName,
              path: EmailLoginNotInUseWidget.routePath,
              builder: (context, params) => EmailLoginNotInUseWidget(),
            ),
            FFRoute(
              name: CComboWidget.routeName,
              path: CComboWidget.routePath,
              builder: (context, params) => CComboWidget(),
            ),
            FFRoute(
              name: ContactusWidget.routeName,
              path: ContactusWidget.routePath,
              builder: (context, params) => ContactusWidget(),
            ),
            FFRoute(
              name: COutletListWidget.routeName,
              path: COutletListWidget.routePath,
              builder: (context, params) => COutletListWidget(
                emailId: params.getParam(
                  'emailId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CCummulativeReportWidget.routeName,
              path: CCummulativeReportWidget.routePath,
              builder: (context, params) => CCummulativeReportWidget(),
            ),
            FFRoute(
              name: CSubscriptionWidget.routeName,
              path: CSubscriptionWidget.routePath,
              builder: (context, params) => CSubscriptionWidget(),
            ),
            FFRoute(
              name: CItemWiseSaleReportWidget.routeName,
              path: CItemWiseSaleReportWidget.routePath,
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
              name: CDeviceWidget.routeName,
              path: CDeviceWidget.routePath,
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
              name: TermsNconditionsWidget.routeName,
              path: TermsNconditionsWidget.routePath,
              builder: (context, params) => TermsNconditionsWidget(),
            ),
            FFRoute(
              name: AboutUsWidget.routeName,
              path: AboutUsWidget.routePath,
              builder: (context, params) => AboutUsWidget(),
            ),
            FFRoute(
              name: COTPverificationWidget.routeName,
              path: COTPverificationWidget.routePath,
              builder: (context, params) => COTPverificationWidget(),
            ),
            FFRoute(
              name: DayWiseReportWidget.routeName,
              path: DayWiseReportWidget.routePath,
              builder: (context, params) => DayWiseReportWidget(),
            ),
            FFRoute(
              name: CategorySalereportNewWidget.routeName,
              path: CategorySalereportNewWidget.routePath,
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
              name: WorkInProgressWidget.routeName,
              path: WorkInProgressWidget.routePath,
              builder: (context, params) => WorkInProgressWidget(),
            ),
            FFRoute(
              name: BillWiseReportWidget.routeName,
              path: BillWiseReportWidget.routePath,
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
              name: AddNewLeadWidget.routeName,
              path: AddNewLeadWidget.routePath,
              builder: (context, params) => AddNewLeadWidget(),
            ),
            FFRoute(
              name: CDashWidget.routeName,
              path: CDashWidget.routePath,
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
              name: CallDetailsListWidget.routeName,
              path: CallDetailsListWidget.routePath,
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
              name: CustLeadsWidget.routeName,
              path: CustLeadsWidget.routePath,
              builder: (context, params) => CustLeadsWidget(),
            ),
            FFRoute(
              name: LeadQueryWidget.routeName,
              path: LeadQueryWidget.routePath,
              builder: (context, params) => LeadQueryWidget(),
            ),
            FFRoute(
              name: FollowUpsWidget.routeName,
              path: FollowUpsWidget.routePath,
              builder: (context, params) => FollowUpsWidget(),
            ),
            FFRoute(
              name: TodayDetailsWidget.routeName,
              path: TodayDetailsWidget.routePath,
              builder: (context, params) => TodayDetailsWidget(),
            ),
            FFRoute(
              name: SupportDashboardWidget.routeName,
              path: SupportDashboardWidget.routePath,
              builder: (context, params) => SupportDashboardWidget(),
            ),
            FFRoute(
              name: LeadLogWidget.routeName,
              path: LeadLogWidget.routePath,
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
              name: DemoLeadsWidget.routeName,
              path: DemoLeadsWidget.routePath,
              builder: (context, params) => DemoLeadsWidget(),
            ),
            FFRoute(
              name: UploadfileWidget.routeName,
              path: UploadfileWidget.routePath,
              builder: (context, params) => UploadfileWidget(),
            ),
            FFRoute(
              name: FollowUpLeadsWidget.routeName,
              path: FollowUpLeadsWidget.routePath,
              builder: (context, params) => FollowUpLeadsWidget(),
            ),
            FFRoute(
              name: LeadsDashboardFinalWidget.routeName,
              path: LeadsDashboardFinalWidget.routePath,
              builder: (context, params) => LeadsDashboardFinalWidget(),
            ),
            FFRoute(
              name: LeadReportTodayWidget.routeName,
              path: LeadReportTodayWidget.routePath,
              builder: (context, params) => LeadReportTodayWidget(),
            ),
            FFRoute(
              name: LeadSummaryWidget.routeName,
              path: LeadSummaryWidget.routePath,
              builder: (context, params) => LeadSummaryWidget(),
            ),
            FFRoute(
              name: CDealerAccountWidget.routeName,
              path: CDealerAccountWidget.routePath,
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
              name: DealerAssignmentWidget.routeName,
              path: DealerAssignmentWidget.routePath,
              builder: (context, params) => DealerAssignmentWidget(),
            ),
            FFRoute(
              name: COutletListUser4Widget.routeName,
              path: COutletListUser4Widget.routePath,
              builder: (context, params) => COutletListUser4Widget(
                emailId: params.getParam(
                  'emailId',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CRMLoginWidget.routeName,
              path: CRMLoginWidget.routePath,
              builder: (context, params) => CRMLoginWidget(),
            ),
            FFRoute(
              name: AdminUserManualViewWidget.routeName,
              path: AdminUserManualViewWidget.routePath,
              builder: (context, params) => AdminUserManualViewWidget(),
            ),
            FFRoute(
              name: UserManualAdminWidget.routeName,
              path: UserManualAdminWidget.routePath,
              builder: (context, params) => UserManualAdminWidget(),
            ),
            FFRoute(
              name: EditUserManualWidget.routeName,
              path: EditUserManualWidget.routePath,
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
              name: UserManualUserViewWidget.routeName,
              path: UserManualUserViewWidget.routePath,
              builder: (context, params) => UserManualUserViewWidget(
                update: params.getParam(
                  'update',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CAddProductDetailsNewWidget.routeName,
              path: CAddProductDetailsNewWidget.routePath,
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
              name: CEditProductDetailsNewWidget.routeName,
              path: CEditProductDetailsNewWidget.routePath,
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
              name: ContactUsNewWidget.routeName,
              path: ContactUsNewWidget.routePath,
              builder: (context, params) => ContactUsNewWidget(),
            ),
            FFRoute(
              name: ImageWidget.routeName,
              path: ImageWidget.routePath,
              builder: (context, params) => ImageWidget(),
            ),
            FFRoute(
              name: UrlImageWidget.routeName,
              path: UrlImageWidget.routePath,
              builder: (context, params) => UrlImageWidget(),
            ),
            FFRoute(
              name: DemoActivityWidget.routeName,
              path: DemoActivityWidget.routePath,
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
              name: LeadReportMonthlyWidget.routeName,
              path: LeadReportMonthlyWidget.routePath,
              builder: (context, params) => LeadReportMonthlyWidget(),
            ),
            FFRoute(
              name: LeadEmployeeReportFinalWidget.routeName,
              path: LeadEmployeeReportFinalWidget.routePath,
              builder: (context, params) => LeadEmployeeReportFinalWidget(),
            ),
            FFRoute(
              name: TodayDetailsCopyWidget.routeName,
              path: TodayDetailsCopyWidget.routePath,
              builder: (context, params) => TodayDetailsCopyWidget(),
            ),
            FFRoute(
              name: EmployeewiseRecordListFinalWidget.routeName,
              path: EmployeewiseRecordListFinalWidget.routePath,
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
              name: LeadDeleteWidget.routeName,
              path: LeadDeleteWidget.routePath,
              builder: (context, params) => LeadDeleteWidget(),
            ),
            FFRoute(
              name: LanguagesCopyWidget.routeName,
              path: LanguagesCopyWidget.routePath,
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
              name: DemosWidget.routeName,
              path: DemosWidget.routePath,
              builder: (context, params) => DemosWidget(),
            ),
            FFRoute(
              name: UserManualDocReqKioskWidget.routeName,
              path: UserManualDocReqKioskWidget.routePath,
              builder: (context, params) => UserManualDocReqKioskWidget(),
            ),
            FFRoute(
              name: DealerDasboardWidget.routeName,
              path: DealerDasboardWidget.routePath,
              builder: (context, params) => DealerDasboardWidget(),
            ),
            FFRoute(
              name: UploadfilegetLinkWidget.routeName,
              path: UploadfilegetLinkWidget.routePath,
              builder: (context, params) => UploadfilegetLinkWidget(),
            ),
            FFRoute(
              name: UserManualAdminCopyWidget.routeName,
              path: UserManualAdminCopyWidget.routePath,
              builder: (context, params) => UserManualAdminCopyWidget(),
            ),
            FFRoute(
              name: AppSettingsMasterWidget.routeName,
              path: AppSettingsMasterWidget.routePath,
              builder: (context, params) => AppSettingsMasterWidget(
                name: params.getParam(
                  'name',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: LogInCRMNotInUseWidget.routeName,
              path: LogInCRMNotInUseWidget.routePath,
              builder: (context, params) => LogInCRMNotInUseWidget(),
            ),
            FFRoute(
              name: StateWidget.routeName,
              path: StateWidget.routePath,
              builder: (context, params) => StateWidget(
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
              name: CityWidget.routeName,
              path: CityWidget.routePath,
              builder: (context, params) => CityWidget(
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
              name: LeadStagesMasterWidget.routeName,
              path: LeadStagesMasterWidget.routePath,
              builder: (context, params) => LeadStagesMasterWidget(),
            ),
            FFRoute(
              name: LeadStatusMasterWidget.routeName,
              path: LeadStatusMasterWidget.routePath,
              builder: (context, params) => LeadStatusMasterWidget(),
            ),
            FFRoute(
              name: LeadStagesMasterNewWidget.routeName,
              path: LeadStagesMasterNewWidget.routePath,
              builder: (context, params) => LeadStagesMasterNewWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: LeadStatusMasterNewWidget.routeName,
              path: LeadStatusMasterNewWidget.routePath,
              builder: (context, params) => LeadStatusMasterNewWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: SPDashboardWidget.routeName,
              path: SPDashboardWidget.routePath,
              builder: (context, params) => SPDashboardWidget(
                partyDoc: params.getParam(
                  'partyDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PARTY'],
                ),
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PARTY'],
                ),
                leadManagement: params.getParam(
                  'leadManagement',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'LEADS_MANAGEMENT'],
                ),
                currentEmail: params.getParam(
                  'currentEmail',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: SalesOrderdetailsWidget.routeName,
              path: SalesOrderdetailsWidget.routePath,
              builder: (context, params) => SalesOrderdetailsWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                saleRef: params.getParam(
                  'saleRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'SALE'],
                ),
              ),
            ),
            FFRoute(
              name: AddPartyWidget.routeName,
              path: AddPartyWidget.routePath,
              builder: (context, params) => AddPartyWidget(
                codeLen: params.getParam(
                  'codeLen',
                  ParamType.int,
                ),
                np: params.getParam(
                  'np',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: EditPartyWidget.routeName,
              path: EditPartyWidget.routePath,
              builder: (context, params) => EditPartyWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                docRef: params.getParam(
                  'docRef',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PARTY'],
                ),
              ),
            ),
            FFRoute(
              name: CreateSaleDirectSaleWidget.routeName,
              path: CreateSaleDirectSaleWidget.routePath,
              builder: (context, params) => CreateSaleDirectSaleWidget(
                id: params.getParam(
                  'id',
                  ParamType.String,
                ),
                leadRefId: params.getParam(
                  'leadRefId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'LEADS_MANAGEMENT'],
                ),
                partyDoc11: params.getParam(
                  'partyDoc11',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PARTY'],
                ),
              ),
            ),
            FFRoute(
              name: SaleProductSelectionNewCopyWidget.routeName,
              path: SaleProductSelectionNewCopyWidget.routePath,
              builder: (context, params) => SaleProductSelectionNewCopyWidget(),
            ),
            FFRoute(
              name: AddProductMaterialSaleWidget.routeName,
              path: AddProductMaterialSaleWidget.routePath,
              builder: (context, params) => AddProductMaterialSaleWidget(
                np: params.getParam(
                  'np',
                  ParamType.int,
                ),
              ),
            ),
            FFRoute(
              name: RawMCategoriesSaleWidget.routeName,
              path: RawMCategoriesSaleWidget.routePath,
              builder: (context, params) => RawMCategoriesSaleWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: EditProductMaterialSaleWidget.routeName,
              path: EditProductMaterialSaleWidget.routePath,
              asyncParams: {
                'docPro':
                    getDoc(['OUTLET', 'PRODUCT'], ProductRecord.fromSnapshot),
              },
              builder: (context, params) => EditProductMaterialSaleWidget(
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
                docPro: params.getParam(
                  'docPro',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: RequestedOrderWidget.routeName,
              path: RequestedOrderWidget.routePath,
              builder: (context, params) => RequestedOrderWidget(),
            ),
            FFRoute(
              name: SPDashboardNewWidget.routeName,
              path: SPDashboardNewWidget.routePath,
              builder: (context, params) => SPDashboardNewWidget(),
            ),
            FFRoute(
              name: IntegrationMasterWidget.routeName,
              path: IntegrationMasterWidget.routePath,
              builder: (context, params) => IntegrationMasterWidget(),
            ),
            FFRoute(
              name: PartyTransactionWidget.routeName,
              path: PartyTransactionWidget.routePath,
              builder: (context, params) => PartyTransactionWidget(
                partyDoc: params.getParam(
                  'partyDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PARTY'],
                ),
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PARTY'],
                ),
                leadManagement: params.getParam(
                  'leadManagement',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'PARTY'],
                ),
              ),
            ),
            FFRoute(
              name: EmployeeWiseSalesOrderReportWidget.routeName,
              path: EmployeeWiseSalesOrderReportWidget.routePath,
              builder: (context, params) =>
                  EmployeeWiseSalesOrderReportWidget(),
            ),
            FFRoute(
              name: DealerDasboardCopyWidget.routeName,
              path: DealerDasboardCopyWidget.routePath,
              builder: (context, params) => DealerDasboardCopyWidget(),
            ),
            FFRoute(
              name: LeadDeleteCopyWidget.routeName,
              path: LeadDeleteCopyWidget.routePath,
              builder: (context, params) => LeadDeleteCopyWidget(),
            ),
            FFRoute(
              name: LeadReportMonthlSourceWiseWidget.routeName,
              path: LeadReportMonthlSourceWiseWidget.routePath,
              builder: (context, params) => LeadReportMonthlSourceWiseWidget(),
            ),
            FFRoute(
              name: DeyeAddComplaintsWidget.routeName,
              path: DeyeAddComplaintsWidget.routePath,
              builder: (context, params) => DeyeAddComplaintsWidget(),
            ),
            FFRoute(
              name: ZoneWidget.routeName,
              path: ZoneWidget.routePath,
              builder: (context, params) => ZoneWidget(
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
              name: TeamTreeMasterWidget.routeName,
              path: TeamTreeMasterWidget.routePath,
              builder: (context, params) => TeamTreeMasterWidget(
                list: params.getParam(
                  'list',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: CComplaintReportWidget.routeName,
              path: CComplaintReportWidget.routePath,
              builder: (context, params) => CComplaintReportWidget(),
            ),
            FFRoute(
              name: DeyeComplaintDetailViewWidget.routeName,
              path: DeyeComplaintDetailViewWidget.routePath,
              asyncParams: {
                'leadManagementDoc': getDoc(['OUTLET', 'LEADS_MANAGEMENT'],
                    LeadsManagementRecord.fromSnapshot),
              },
              builder: (context, params) => DeyeComplaintDetailViewWidget(
                leadManagementDocId: params.getParam(
                  'leadManagementDocId',
                  ParamType.String,
                ),
                leadManagementDoc: params.getParam(
                  'leadManagementDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: LeadsDashboardNewWidget.routeName,
              path: LeadsDashboardNewWidget.routePath,
              builder: (context, params) => LeadsDashboardNewWidget(),
            ),
            FFRoute(
              name: LeadReportMonthlyCRMWidget.routeName,
              path: LeadReportMonthlyCRMWidget.routePath,
              builder: (context, params) => LeadReportMonthlyCRMWidget(),
            ),
            FFRoute(
              name: LeadEmployeeReportFinalCRMWidget.routeName,
              path: LeadEmployeeReportFinalCRMWidget.routePath,
              builder: (context, params) => LeadEmployeeReportFinalCRMWidget(),
            ),
            FFRoute(
              name: DeyeDashboard2Widget.routeName,
              path: DeyeDashboard2Widget.routePath,
              builder: (context, params) => DeyeDashboard2Widget(),
            ),
            FFRoute(
              name: RegisterComplaint1Widget.routeName,
              path: RegisterComplaint1Widget.routePath,
              builder: (context, params) => RegisterComplaint1Widget(),
            ),
            FFRoute(
              name: DeyeThankyouPageWidget.routeName,
              path: DeyeThankyouPageWidget.routePath,
              builder: (context, params) => DeyeThankyouPageWidget(),
            ),
            FFRoute(
              name: DeyeTeamTreeWidget.routeName,
              path: DeyeTeamTreeWidget.routePath,
              builder: (context, params) => DeyeTeamTreeWidget(),
            ),
            FFRoute(
              name: DeyeComplaintEditDetailsWidget.routeName,
              path: DeyeComplaintEditDetailsWidget.routePath,
              asyncParams: {
                'leadManagementDoc': getDoc(['OUTLET', 'LEADS_MANAGEMENT'],
                    LeadsManagementRecord.fromSnapshot),
              },
              builder: (context, params) => DeyeComplaintEditDetailsWidget(
                mobile: params.getParam(
                  'mobile',
                  ParamType.String,
                ),
                leadManagementDoc: params.getParam(
                  'leadManagementDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: DeyeLeadStagesMasterWidget.routeName,
              path: DeyeLeadStagesMasterWidget.routePath,
              builder: (context, params) => DeyeLeadStagesMasterWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: DeyeLeadStatusMasterWidget.routeName,
              path: DeyeLeadStatusMasterWidget.routePath,
              builder: (context, params) => DeyeLeadStatusMasterWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: DeyeComplaintReportWidget.routeName,
              path: DeyeComplaintReportWidget.routePath,
              builder: (context, params) => DeyeComplaintReportWidget(),
            ),
            FFRoute(
              name: DeyeEmployeeReportWidget.routeName,
              path: DeyeEmployeeReportWidget.routePath,
              builder: (context, params) => DeyeEmployeeReportWidget(),
            ),
            FFRoute(
              name: DeyeCityWiseReportWidget.routeName,
              path: DeyeCityWiseReportWidget.routePath,
              builder: (context, params) => DeyeCityWiseReportWidget(),
            ),
            FFRoute(
              name: DeyeDashboardSupportWidget.routeName,
              path: DeyeDashboardSupportWidget.routePath,
              builder: (context, params) => DeyeDashboardSupportWidget(),
            ),
            FFRoute(
              name: DeyeCategoryWidget.routeName,
              path: DeyeCategoryWidget.routePath,
              builder: (context, params) => DeyeCategoryWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: DeyeProductsWidget.routeName,
              path: DeyeProductsWidget.routePath,
              builder: (context, params) => DeyeProductsWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: DeyeDashboardWidget.routeName,
              path: DeyeDashboardWidget.routePath,
              builder: (context, params) => DeyeDashboardWidget(),
            ),
            FFRoute(
              name: DeyeEditProfileAdminWidget.routeName,
              path: DeyeEditProfileAdminWidget.routePath,
              asyncParams: {
                'profileDoc':
                    getDoc(['USER_PROFILE'], UserProfileRecord.fromSnapshot),
              },
              builder: (context, params) => DeyeEditProfileAdminWidget(
                profileDoc: params.getParam(
                  'profileDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: NavigationTestWidget.routeName,
              path: NavigationTestWidget.routePath,
              builder: (context, params) => NavigationTestWidget(),
            ),
            FFRoute(
              name: CheckInStatusWidget.routeName,
              path: CheckInStatusWidget.routePath,
              builder: (context, params) => CheckInStatusWidget(),
            ),
            FFRoute(
              name: DeyeEmployeeDetailReportWidget.routeName,
              path: DeyeEmployeeDetailReportWidget.routePath,
              builder: (context, params) => DeyeEmployeeDetailReportWidget(
                userProfileId: params.getParam(
                  'userProfileId',
                  ParamType.String,
                ),
                employeeName: params.getParam(
                  'employeeName',
                  ParamType.String,
                ),
              ),
            ),
            FFRoute(
              name: LeadLogNewWidget.routeName,
              path: LeadLogNewWidget.routePath,
              asyncParams: {
                'leadDoc': getDoc(['OUTLET', 'LEADS_MANAGEMENT'],
                    LeadsManagementRecord.fromSnapshot),
              },
              builder: (context, params) => LeadLogNewWidget(
                leadDoc: params.getParam(
                  'leadDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: DeyeFeedbackForm2Widget.routeName,
              path: DeyeFeedbackForm2Widget.routePath,
              asyncParams: {
                'leadDoc': getDoc(['OUTLET', 'LEADS_MANAGEMENT'],
                    LeadsManagementRecord.fromSnapshot),
              },
              builder: (context, params) => DeyeFeedbackForm2Widget(
                leadDoc: params.getParam(
                  'leadDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: DeyeAdminFeedbackWidget.routeName,
              path: DeyeAdminFeedbackWidget.routePath,
              builder: (context, params) => DeyeAdminFeedbackWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: DeyeUserAccountWidget.routeName,
              path: DeyeUserAccountWidget.routePath,
              builder: (context, params) => DeyeUserAccountWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
                ),
              ),
            ),
            FFRoute(
              name: DeyeTeamTree2Widget.routeName,
              path: DeyeTeamTree2Widget.routePath,
              builder: (context, params) => DeyeTeamTree2Widget(),
            ),
            FFRoute(
              name: DeyeTeamTree3Widget.routeName,
              path: DeyeTeamTree3Widget.routePath,
              builder: (context, params) => DeyeTeamTree3Widget(),
            ),
            FFRoute(
              name: DeyeStateWiseReportWidget.routeName,
              path: DeyeStateWiseReportWidget.routePath,
              builder: (context, params) => DeyeStateWiseReportWidget(),
            ),
            FFRoute(
              name: DeyeStatewiseDetailReportWidget.routeName,
              path: DeyeStatewiseDetailReportWidget.routePath,
              asyncParams: {
                'docs': getDocList(['OUTLET', 'LEADS_MANAGEMENT'],
                    LeadsManagementRecord.fromSnapshot),
              },
              builder: (context, params) => DeyeStatewiseDetailReportWidget(
                state: params.getParam(
                  'state',
                  ParamType.String,
                ),
                docs: params.getParam<LeadsManagementRecord>(
                  'docs',
                  ParamType.Document,
                  isList: true,
                ),
              ),
            ),
            FFRoute(
              name: DeyeAddComplaintsCopyWidget.routeName,
              path: DeyeAddComplaintsCopyWidget.routePath,
              builder: (context, params) => DeyeAddComplaintsCopyWidget(),
            ),
            FFRoute(
              name: DeyeDashboardCopyWidget.routeName,
              path: DeyeDashboardCopyWidget.routePath,
              builder: (context, params) => DeyeDashboardCopyWidget(),
            ),
            FFRoute(
              name: DeyeNewComplaintEditWidget.routeName,
              path: DeyeNewComplaintEditWidget.routePath,
              asyncParams: {
                'leadDoc': getDoc(
                    ['OUTLET', 'OUTLET_LEADS'], OutletLeadsRecord.fromSnapshot),
              },
              builder: (context, params) => DeyeNewComplaintEditWidget(
                leadDoc: params.getParam(
                  'leadDoc',
                  ParamType.Document,
                ),
              ),
            ),
            FFRoute(
              name: RingingLeadsWidget.routeName,
              path: RingingLeadsWidget.routePath,
              builder: (context, params) => RingingLeadsWidget(),
            ),
            FFRoute(
              name: AddNewDealerWidget.routeName,
              path: AddNewDealerWidget.routePath,
              builder: (context, params) => AddNewDealerWidget(),
            ),
            FFRoute(
              name: EditNewDealerWidget.routeName,
              path: EditNewDealerWidget.routePath,
              builder: (context, params) => EditNewDealerWidget(
                dealerDoc: params.getParam(
                  'dealerDoc',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET', 'DEALERS'],
                ),
              ),
            ),
            FFRoute(
              name: DealerDashboardWidget.routeName,
              path: DealerDashboardWidget.routePath,
              builder: (context, params) => DealerDashboardWidget(),
            ),
            FFRoute(
              name: LeadSummaryCopyWidget.routeName,
              path: LeadSummaryCopyWidget.routePath,
              builder: (context, params) => LeadSummaryCopyWidget(),
            ),
            FFRoute(
              name: DealerOnboardWidget.routeName,
              path: DealerOnboardWidget.routePath,
              builder: (context, params) => DealerOnboardWidget(),
            ),
            FFRoute(
              name: DealerDashboard1Widget.routeName,
              path: DealerDashboard1Widget.routePath,
              builder: (context, params) => DealerDashboard1Widget(),
            ),
            FFRoute(
              name: DeyeAttendanceAdminWidget.routeName,
              path: DeyeAttendanceAdminWidget.routePath,
              builder: (context, params) => DeyeAttendanceAdminWidget(),
            ),
            FFRoute(
              name: DeyeLeaveAdminWidget.routeName,
              path: DeyeLeaveAdminWidget.routePath,
              builder: (context, params) => DeyeLeaveAdminWidget(),
            ),
            FFRoute(
              name: UsersAllActivitiesWidget.routeName,
              path: UsersAllActivitiesWidget.routePath,
              builder: (context, params) => UsersAllActivitiesWidget(),
            ),
            FFRoute(
              name: UsersDemoActivityWidget.routeName,
              path: UsersDemoActivityWidget.routePath,
              builder: (context, params) => UsersDemoActivityWidget(),
            ),
            FFRoute(
              name: AttendanceAdminWidget.routeName,
              path: AttendanceAdminWidget.routePath,
              builder: (context, params) => AttendanceAdminWidget(),
            ),
            FFRoute(
              name: RegisterComplaintDemoWidget.routeName,
              path: RegisterComplaintDemoWidget.routePath,
              builder: (context, params) => RegisterComplaintDemoWidget(),
            ),
            FFRoute(
              name: RegisterComplaintWidget.routeName,
              path: RegisterComplaintWidget.routePath,
              builder: (context, params) => RegisterComplaintWidget(),
            ),
            FFRoute(
              name: DeleteLeadReportWidget.routeName,
              path: DeleteLeadReportWidget.routePath,
              builder: (context, params) => DeleteLeadReportWidget(),
            ),
            FFRoute(
              name: DashboardGraphWidget.routeName,
              path: DashboardGraphWidget.routePath,
              builder: (context, params) => DashboardGraphWidget(),
            ),
            FFRoute(
              name: AllUserAccountWidget.routeName,
              path: AllUserAccountWidget.routePath,
              builder: (context, params) => AllUserAccountWidget(
                outletId: params.getParam(
                  'outletId',
                  ParamType.DocumentReference,
                  isList: false,
                  collectionNamePath: ['OUTLET'],
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
            return '/CRM-Login';
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
                    width: 30.0,
                    height: 30.0,
                    child: SpinKitRing(
                      color: FlutterFlowTheme.of(context).primary,
                      size: 30.0,
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
