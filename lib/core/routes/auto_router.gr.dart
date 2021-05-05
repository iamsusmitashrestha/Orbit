// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/legacy.dart';
import 'package:flutter/material.dart';

import '../../features/categories/views/category_view.dart';
import '../../features/home/views/home_view.dart';
import '../../features/profile_setup/views/profile_setup_view.dart';
import '../../features/role/views/role_selection_view.dart';
import '../../features/signin/views/forget_password_view.dart';
import '../../features/signin/views/signin_view.dart';
import '../../features/signup/views/signup_view.dart';
import '../../features/splash/splash_view.dart';
import '../../features/upload_logo/upload_logo_view.dart';

class Routes {
  static const String splashViewRoute = '/';
  static const String homeViewRoute = '/home-view';
  static const String roleSelectionViewRoute = '/role-selection-view';
  static const String signinViewRoute = '/signin-view';
  static const String forgetPasswordViewRoute = '/forget-password-view';
  static const String signupViewRoute = '/signup-view';
  static const String profileSetupViewRoute = '/profile-setup-view';
  static const String categoryViewRoute = '/category-view';
  static const String uploadLogoViewRoute = '/upload-logo-view';
  static const all = <String>{
    splashViewRoute,
    homeViewRoute,
    roleSelectionViewRoute,
    signinViewRoute,
    forgetPasswordViewRoute,
    signupViewRoute,
    profileSetupViewRoute,
    categoryViewRoute,
    uploadLogoViewRoute,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashViewRoute, page: SplashView),
    RouteDef(Routes.homeViewRoute, page: HomeView),
    RouteDef(Routes.roleSelectionViewRoute, page: RoleSelectionView),
    RouteDef(Routes.signinViewRoute, page: SigninView),
    RouteDef(Routes.forgetPasswordViewRoute, page: ForgetPasswordView),
    RouteDef(Routes.signupViewRoute, page: SignupView),
    RouteDef(Routes.profileSetupViewRoute, page: ProfileSetupView),
    RouteDef(Routes.categoryViewRoute, page: CategoryView),
    RouteDef(Routes.uploadLogoViewRoute, page: UploadLogoView),
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
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
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
    ProfileSetupView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileSetupView(),
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
  };
}
