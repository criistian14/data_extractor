import 'dart:ui' as ui;

import 'package:data_extractor/src/injection_container.dart';
import 'package:flutter/material.dart';

class EnvironmentBanner extends StatelessWidget {
  const EnvironmentBanner({
    super.key,
    required this.child,
    this.bannerConfig,
  });

  final Widget child;
  final BannerConfig? bannerConfig;

  @override
  Widget build(BuildContext context) {
    if (sl<EnvironmentConfig>().isProduction()) return child;

    assert(
      bannerConfig != null,
      'bannerConfig must be provided when environment is not production',
    );

    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Banner(
        location: bannerConfig!.location,
        message: bannerConfig!.name,
        color: bannerConfig!.color,
        child: child,
      ),
    );
  }
}

class BannerConfig {
  BannerConfig({
    required this.name,
    required this.color,
    this.location = BannerLocation.topStart,
  });

  final String name;
  final Color color;
  final BannerLocation location;
}
