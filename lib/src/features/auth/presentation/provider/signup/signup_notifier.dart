import 'package:data_extractor/src/features/auth/presentation/provider/signup/signup_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignupNotifier extends StateNotifier<SignupState> {
  SignupNotifier() : super(SignupState.initial());

  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(password: password);
  }

  bool validateForm() {
    final isValid = state.formKey.currentState?.validate() ?? false;
    return isValid;
  }
}
