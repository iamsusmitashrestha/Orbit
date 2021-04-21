// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/legacy.dart';
import 'package:flutter/material.dart';

import '../../features/home/views/home_view.dart';
import '../../features/signup/views/role_selection_view.dart';

class Routes {
  static const String homeViewRoute = '/home-view';
  static const String roleSelectionViewRoute = '/';
  static const all = <String>{
    homeViewRoute,
    roleSelectionViewRoute,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.homeViewRoute, page: HomeView),
    RouteDef(Routes.roleSelectionViewRoute, page: RoleSelectionView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
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
  };
}
