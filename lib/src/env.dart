import 'package:data_extractor/src/widgets/environment_banner.dart';
import 'package:flutter/material.dart';

enum Environment {
  dev,
  staging,
  production,
}

class EnvironmentConfig {
  EnvironmentConfig({
    required this.environment,
    required this.lightTheme,
    required this.darkTheme,
    this.bannerConfig,
  }) : assert(
          environment == Environment.production || bannerConfig != null,
          'bannerConfig must be provided when environment is not production',
        );

  final Environment environment;
  final ThemeData lightTheme;
  final ThemeData darkTheme;
  final BannerConfig? bannerConfig;

  bool isProduction() => environment == Environment.production;
  bool isStaging() => environment == Environment.staging;
  bool isDevelopment() => environment == Environment.dev;
}
