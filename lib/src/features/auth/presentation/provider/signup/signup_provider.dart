import 'package:data_extractor/src/features/auth/presentation/provider/signup/signup_notifier.dart';
import 'package:data_extractor/src/features/auth/presentation/provider/signup/signup_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'signup_notifier.dart';
export 'signup_state.dart';

final signupProvider =
    StateNotifierProvider<SignupNotifier, SignupState>((ref) {
  return SignupNotifier();
});
