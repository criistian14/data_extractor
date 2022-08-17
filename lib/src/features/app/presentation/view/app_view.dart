import 'package:data_extractor/src/features/app/presentation/layout/splash_layout.dart';
import 'package:data_extractor/src/features/auth/auth.dart';
import 'package:data_extractor/src/features/dashboard/dashboard.dart';
import 'package:data_extractor/src/injection_container.dart';
import 'package:data_extractor/src/localization/l10n.dart';
import 'package:data_extractor/src/routing/router.dart';
import 'package:data_extractor/src/widgets/environment_banner.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: DevicePreview(
        enabled: !sl<EnvironmentConfig>().isProduction(),
        builder: (context) => EnvironmentBanner(
          bannerConfig: sl<EnvironmentConfig>().bannerConfig,
          child: Sizer(
            builder: (context, orientation, deviceType) => _App(
              themeMode: ThemeMode.light,
              lightTheme: sl<EnvironmentConfig>().lightTheme,
              darkTheme: sl<EnvironmentConfig>().darkTheme,
              locale: DevicePreview.locale(context),
            ),
          ),
        ),
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App({
    super.key,
    required this.themeMode,
    required this.lightTheme,
    required this.darkTheme,
    this.locale,
  });

  final ThemeMode themeMode;
  final ThemeData lightTheme;
  final ThemeData darkTheme;

  final Locale? locale;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
      debugShowCheckedModeBanner: false,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: themeMode,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      locale: locale,
      initialRoute: '/',
      onGenerateRoute: sl<RouterApp>().generateRoute,
      navigatorKey: sl<NavigationService>().navigatorKey,
      builder: (context, child) {
        return Consumer(
          builder: (context, ref, _) {
            ref.watch(authProvider);

            if (ref.watch(authProvider).status == AuthStatus.loading) {
              return const SplashLayout();
            }

            if (ref.watch(authProvider).isAuthenticated) {
              return DashboardLayout(
                child: child ?? Container(),
              );
            }
            return AuthLayout(
              page: child ?? Container(),
            );
          },
        );
      },
    );
  }
}
