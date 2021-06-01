// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/legacy.dart';
import 'package:flutter/material.dart';

import '../../features/categories/views/category_view.dart';
import '../../features/profile_setup/views/inventory_view.dart';
import '../../features/profile_setup/views/map_view.dart';
import '../../features/profile_setup/views/payment_method_view.dart';
import '../../features/profile_setup/views/profile_setup_view.dart';
import '../../features/profile_setup/views/settings_view.dart';
import '../../features/profile_setup/views/store_details_view.dart';
import '../../features/profile_setup/views/store_profile_view.dart';
import '../../features/role/views/role_selection_view.dart';
import '../../features/signin/views/forget_password_view.dart';
import '../../features/signin/views/signin_view.dart';
import '../../features/signup/views/signup_view.dart';
import '../../features/signup/views/verify_code_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/upload_logo/upload_logo_view.dart';

class Routes {
  static const String splashViewRoute = '/';
  static const String roleSelectionViewRoute = '/role-selection-view';
  static const String signinViewRoute = '/signin-view';
  static const String forgetPasswordViewRoute = '/forget-password-view';
  static const String signupViewRoute = '/signup-view';
  static const String verifyCodeViewRoute = '/verify-code-view';
  static const String profileSetupViewRoute = '/profile-setup-view';
  static const String mapViewRoute = '/map-view';
  static const String categoryViewRoute = '/category-view';
  static const String uploadLogoViewRoute = '/upload-logo-view';
  static const String storeProfileViewRoute = '/store-profile-view';
  static const String inventoryViewRoute = '/inventory-view';
  static const String storeDetailsViewRoute = '/store-details-view';
  static const String paymentMethodViewRoute = '/payment-method-view';
  static const String settingsViewRoute = '/settings-view';
  static const all = <String>{
    splashViewRoute,
    roleSelectionViewRoute,
    signinViewRoute,
    forgetPasswordViewRoute,
    signupViewRoute,
    verifyCodeViewRoute,
    profileSetupViewRoute,
    mapViewRoute,
    categoryViewRoute,
    uploadLogoViewRoute,
    storeProfileViewRoute,
    inventoryViewRoute,
    storeDetailsViewRoute,
    paymentMethodViewRoute,
    settingsViewRoute,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashViewRoute, page: SplashView),
    RouteDef(Routes.roleSelectionViewRoute, page: RoleSelectionView),
    RouteDef(Routes.signinViewRoute, page: SigninView),
    RouteDef(Routes.forgetPasswordViewRoute, page: ForgetPasswordView),
    RouteDef(Routes.signupViewRoute, page: SignupView),
    RouteDef(Routes.verifyCodeViewRoute, page: VerifyCodeView),
    RouteDef(Routes.profileSetupViewRoute, page: ProfileSetupView),
    RouteDef(Routes.mapViewRoute, page: MapView),
    RouteDef(Routes.categoryViewRoute, page: CategoryView),
    RouteDef(Routes.uploadLogoViewRoute, page: UploadLogoView),
    RouteDef(Routes.storeProfileViewRoute, page: StoreProfileView),
    RouteDef(Routes.inventoryViewRoute, page: InventoryView),
    RouteDef(Routes.storeDetailsViewRoute, page: StoreDetailsView),
    RouteDef(Routes.paymentMethodViewRoute, page: PaymentMethodView),
    RouteDef(Routes.settingsViewRoute, page: SettingsView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    RoleSelectionView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => RoleSelectionView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    SigninView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SigninView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    ForgetPasswordView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ForgetPasswordView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    SignupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignupView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    VerifyCodeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => VerifyCodeView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    ProfileSetupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileSetupView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    MapView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MapView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    CategoryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CategoryView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    UploadLogoView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UploadLogoView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    StoreProfileView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StoreProfileView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    InventoryView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => InventoryView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    StoreDetailsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => StoreDetailsView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    PaymentMethodView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => PaymentMethodView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
    SettingsView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsView(),
        settings: data,
        fullscreenDialog: false,
        maintainState: true,
      );
    },
  };
}
