import 'package:data_extractor/src/features/auth/auth.dart';
import 'package:data_extractor/src/features/counter/counter.dart';
import 'package:data_extractor/src/features/dashboard/dashboard.dart';
import 'package:data_extractor/src/routing/handler/handler.dart';
import 'package:data_extractor/src/routing/route_transition.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

export 'navigation_service.dart';
export 'route_transition.dart';

class RouterApp {
  RouterApp({
    required FluroRouter router,
    required RouteTransitionType transition,
  })  : _router = router,
        _transition = transition;

  final FluroRouter _router;
  final RouteTransitionType _transition;

  void configureRoutes() {
    _router
      ..define(
        '/',
        handler: AuthHandlers.login,
        transitionBuilder: _transition,
        transitionType: TransitionType.none,
      )
      ..define(
        LoginView.route,
        handler: AuthHandlers.login,
        transitionBuilder: _transition,
        transitionType: TransitionType.none,
      )
      ..define(
        SignupView.route,
        handler: AuthHandlers.signup,
        transitionBuilder: _transition,
        transitionType: TransitionType.none,
      )

      // ! Dashboard
      ..define(
        DashboardView.route,
        handler: DashboardHandlers.dashboard,
        transitionBuilder: _transition,
        transitionType: TransitionType.custom,
        transitionDuration: _transition.duration,
      )

      // ! Counter
      ..define(
        '${CounterPage.route}/:base',
        handler: AuthHandlers.counter,
        transitionBuilder: _transition,
        transitionType: TransitionType.custom,
        transitionDuration: _transition.duration,
      )

      // ! Not found page
      ..notFoundHandler = NotPageFoundHandlers.notFound;
  }

  Route<dynamic>? generateRoute(RouteSettings settings) {
    return _router.generator(settings);
  }
}
