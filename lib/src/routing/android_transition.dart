import 'package:data_extractor/src/routing/route_transition.dart';
import 'package:flutter/material.dart';

class AndroidTransition implements RouteTransitionType {
  @override
  Duration get duration => const Duration(milliseconds: 300);

  @override
  Widget call(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }
}
