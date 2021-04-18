// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/legacy.dart';
import 'package:flutter/material.dart';

import '../../features/splash/splash_view.dart';

class Routes {
  static const String splashViewRoute = '/';
  static const all = <String>{
    splashViewRoute,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashViewRoute, page: SplashView),
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
  };
}
