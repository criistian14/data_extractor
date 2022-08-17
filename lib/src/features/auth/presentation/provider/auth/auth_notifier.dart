import 'package:data_extractor/src/core/usecase.dart';
import 'package:data_extractor/src/features/auth/auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({
    required Reader read,
    required GetToken getToken,
  })  : _read = read,
        _getToken = getToken,
        super(AuthState.initial()) {
    validateAuth();
  }

  final Reader _read;
  final GetToken _getToken;

  void successfulLogin() {
    state = state.copyWith(isAuthenticated: true);
  }

  Future<void> validateAuth() async {
    if (state.status == AuthStatus.loading) return;
    state = state.copyWith(status: AuthStatus.loading);

    await Future.delayed(const Duration(seconds: 2));

    final getTokenCall = await _getToken(NoParams());

    getTokenCall.fold(
      (l) => state = state.copyWith(
        status: AuthStatus.error,
        isAuthenticated: false,
      ),
      (r) {
        final isAValidToken = r != null && r.isNotEmpty;
        _read(tokenProvider.notifier).state = r;

        state = state.copyWith(
          status: AuthStatus.success,
          isAuthenticated: isAValidToken,
        );
      },
    );
  }
}
