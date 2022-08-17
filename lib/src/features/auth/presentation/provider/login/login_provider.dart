import 'package:data_extractor/src/features/auth/presentation/provider/login/login_notifier.dart';
import 'package:data_extractor/src/features/auth/presentation/provider/login/login_state.dart';
import 'package:data_extractor/src/injection_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'login_notifier.dart';
export 'login_state.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(
    saveToken: sl(),
  );
});
