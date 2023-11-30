// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedNavigatorGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:flutter/material.dart' as _i4;
import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/data/models/home_enum.dart';
import 'package:sdg_hackaton_app/ui/views/auth/login/login_view.dart';
import 'package:sdg_hackaton_app/ui/views/auth/signup/signup_view.dart';
import 'package:sdg_hackaton_app/ui/views/auth/splash/splash_view.dart';
import 'package:sdg_hackaton_app/ui/views/home/home_view.dart' as _i2;
import 'package:sdg_hackaton_app/ui/views/startup/startup_view.dart' as _i3;
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i5;

class Routes {
  static const homeView = '/home-view';

  static const startupView = '/startup-view';

  static const splashView = '/splash-view';

  static const loginView = '/login-view';

  static const signupView = '/signup-view';

  static const all = <String>{
    homeView,
    startupView,
    splashView,
    signupView,
    loginView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.homeView,
      page: _i2.HomeView,
    ),
    _i1.RouteDef(
      Routes.startupView,
      page: _i3.StartupView,
    ),
    _i1.RouteDef(
      Routes.splashView,
      page: SplashView,
    ),
    _i1.RouteDef(
      Routes.loginView,
      page: LoginView,
    ),
    _i1.RouteDef(
      Routes.signupView,
      page: SignupView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.HomeView: (data) {
      var args = data.getArgs<_i2.HomeViewArguments>(
        orElse: () =>
            _i2.HomeViewArguments(homeViewEnum: HomeViewEnum.dashboard),
      );
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => _i2.HomeView(homeViewEnum: args.homeViewEnum),
        settings: data,
      );
    },
    _i3.StartupView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.StartupView(),
        settings: data,
      );
    },
    SplashView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const SplashView(),
        settings: data,
      );
    },
    LoginView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const LoginView(),
        settings: data,
      );
    },
    SignupView: (data) {
      return _i4.MaterialPageRoute<dynamic>(
        builder: (context) => const SignupView(),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;

  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

extension NavigatorStateExtension on _i5.NavigationService {
  Future<dynamic> navigateToHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithHomeView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.homeView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> replaceWithStartupView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return replaceWith<dynamic>(Routes.startupView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
