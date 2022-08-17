import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  void navigateTo(String routeName) {
    _navigatorKey.currentState!.pushNamed(routeName);
  }

  void replaceTo(String routeName) {
    _navigatorKey.currentState!.pushReplacementNamed(routeName);
  }
}
