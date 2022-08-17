import 'package:flutter/material.dart';

class SignupState {
  const SignupState({
    required this.formKey,
    required this.name,
    required this.email,
    required this.password,
  });

  factory SignupState.initial() {
    return SignupState(
      formKey: GlobalKey<FormState>(),
      name: '',
      email: '',
      password: '',
    );
  }

  final GlobalKey<FormState> formKey;

  final String name;
  final String email;
  final String password;

  SignupState copyWith({
    GlobalKey<FormState>? formKey,
    String? name,
    String? email,
    String? password,
  }) {
    return SignupState(
      formKey: formKey ?? this.formKey,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
