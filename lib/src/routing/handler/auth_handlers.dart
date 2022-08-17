import 'package:data_extractor/src/features/auth/auth.dart';
import 'package:data_extractor/src/features/counter/counter.dart';
import 'package:data_extractor/src/features/dashboard/dashboard.dart';
import 'package:fluro/fluro.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthHandlers {
  static Handler get counter {
    return Handler(
      handlerFunc: (context, parameters) {
        final base = parameters['base']?[0] ?? '0';

        return CounterPage(base: base);
      },
    );
  }

  static Handler get login {
    return Handler(
      handlerFunc: (context, parameters) {
        return Consumer(
          builder: (context, ref, child) {
            if (ref.watch(authProvider).isAuthenticated) {
              return const DashboardView();
            }

            return const LoginView();
          },
        );
      },
    );
  }

  static Handler get signup {
    return Handler(
      handlerFunc: (context, parameters) {
        return Consumer(
          builder: (context, ref, child) {
            if (ref.watch(authProvider).isAuthenticated) {
              return const DashboardView();
            }

            return const SignupView();
          },
        );
      },
    );
  }
}
