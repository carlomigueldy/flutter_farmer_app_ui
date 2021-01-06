// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/views/category_detail/category_detail_view.dart';
import '../ui/views/farmer_detail/farmer_detail_view.dart';
import '../ui/views/getting_started/getting_started_view.dart';
import '../ui/views/home/home_view.dart';
import '../ui/views/main/main_view.dart';
import '../ui/views/splash/splash_view.dart';

class Routes {
  static const String splashView = '/';
  static const String mainView = '/main';
  static const String gettingStartedView = '/getting-started';
  static const String homeView = '/home';
  static const String _categoryDetailView = '/categories/:categoryId';
  static String categoryDetailView({@required dynamic categoryId}) =>
      '/categories/$categoryId';
  static const String _farmerDetailView = '/farmers/:farmerId';
  static String farmerDetailView({@required dynamic farmerId}) =>
      '/farmers/$farmerId';
  static const all = <String>{
    splashView,
    mainView,
    gettingStartedView,
    homeView,
    _categoryDetailView,
    _farmerDetailView,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.mainView, page: MainView),
    RouteDef(Routes.gettingStartedView, page: GettingStartedView),
    RouteDef(Routes.homeView, page: HomeView),
    RouteDef(Routes._categoryDetailView, page: CategoryDetailView),
    RouteDef(Routes._farmerDetailView, page: FarmerDetailView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SplashView(),
        settings: data,
      );
    },
    MainView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MainView(),
        settings: data,
      );
    },
    GettingStartedView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => GettingStartedView(),
        settings: data,
      );
    },
    HomeView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeView(),
        settings: data,
      );
    },
    CategoryDetailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CategoryDetailView(),
        settings: data,
      );
    },
    FarmerDetailView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FarmerDetailView(),
        settings: data,
      );
    },
  };
}
