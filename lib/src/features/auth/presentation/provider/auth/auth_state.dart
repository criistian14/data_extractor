enum AuthStatus {
  initial,
  loading,
  success,
  error,
}

class AuthState {
  const AuthState({
    required this.status,
    required this.isAuthenticated,
  });

  factory AuthState.initial() {
    return const AuthState(
      status: AuthStatus.initial,
      isAuthenticated: false,
    );
  }

  final AuthStatus status;
  final bool isAuthenticated;

  AuthState copyWith({
    AuthStatus? status,
    bool? isAuthenticated,
  }) {
    return AuthState(
      status: status ?? this.status,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}
