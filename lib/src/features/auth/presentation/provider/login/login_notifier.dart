import 'package:data_extractor/src/core/formz/formz.dart';
import 'package:data_extractor/src/features/auth/auth.dart';
import 'package:data_extractor/src/features/auth/presentation/provider/login/login_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  LoginNotifier({
    required SaveToken saveToken,
  })  : _saveToken = saveToken,
        super(LoginState.initial());

  final SaveToken _saveToken;

  void updateEmail(String email) {
    state = state.copyWith(email: EmailFormz.dirty(value: email));
  }

  void updatePassword(String password) {
    state = state.copyWith(password: PasswordFormz.dirty(value: password));
  }

  Future<void> loginDone() async {
    if (state.status == LoginStatus.loading) return;

    state = state.copyWith(status: LoginStatus.loading);

    await Future.delayed(const Duration(seconds: 2));

    const token = 'asd4564jbkds094-_dasn53sdfs';
    final saveTokenCall = await _saveToken(token);

    saveTokenCall.fold(
      (l) => state = state.copyWith(status: LoginStatus.error),
      (r) {
        state = state.copyWith(status: LoginStatus.success);
      },
    );
  }
}
