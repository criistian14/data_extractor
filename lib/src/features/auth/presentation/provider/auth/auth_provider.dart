import 'package:data_extractor/src/features/auth/presentation/provider/auth/auth_notifier.dart';
import 'package:data_extractor/src/features/auth/presentation/provider/auth/auth_state.dart';
import 'package:data_extractor/src/injection_container.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'auth_notifier.dart';
export 'auth_state.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier(
    read: ref.read,
    getToken: sl(),
  );
});
