import 'dart:io' show Platform;

import 'package:data_extractor/src/routing/android_transition.dart';
import 'package:data_extractor/src/routing/ios_transition.dart';
import 'package:data_extractor/src/routing/web_transition.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';

mixin RouteTransitionType {
  Duration get duration;

  Widget call(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  );
}

class TransitionApp {
  RouteTransitionType getTransition() {
    if (kIsWeb) {
      return WebTransition();
    }

    if (Platform.isAndroid) {
      return AndroidTransition();
    }

    return IOSTransition();
  }
}
