import 'package:data_extractor/src/features/auth/auth.dart';
import 'package:data_extractor/src/features/dashboard/dashboard.dart';
import 'package:fluro/fluro.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardHandlers {
  static Handler get dashboard {
    return Handler(
      handlerFunc: (context, params) => Consumer(
        builder: (context, ref, child) {
          if (ref.watch(authProvider).isAuthenticated) {
            return const DashboardView();
          }

          return const LoginView();
        },
      ),
    );
  }
}
