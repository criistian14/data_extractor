import 'package:data_extractor/src/core/formz/formz.dart';

enum LoginStatus {
  initial,
  loading,
  success,
  error,
}

class LoginState {
  const LoginState({
    required this.status,
    required this.email,
    required this.password,
  });

  factory LoginState.initial() {
    return const LoginState(
      status: LoginStatus.initial,
      email: EmailFormz.pure(),
      password: PasswordFormz.pure(),
    );
  }

  final LoginStatus status;

  final EmailFormz email;
  final PasswordFormz password;

  LoginState copyWith({
    LoginStatus? status,
    EmailFormz? email,
    PasswordFormz? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
