import 'package:data_extractor/src/routing/route_transition.dart';
import 'package:flutter/cupertino.dart';

class IOSTransition implements RouteTransitionType {
  @override
  Duration get duration => const Duration(milliseconds: 300);

  @override
  Widget call(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return CupertinoPageTransition(
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      linearTransition: true,
      child: child,
    );
  }
}
