import 'package:formz/formz.dart';

enum PasswordFormzError { empty, invalid }

extension PasswordFormzErrorExt on PasswordFormzError {
  String? text() {
    switch (this) {
      case PasswordFormzError.invalid:
        return 'Please ensure the password entered is valid';

      case PasswordFormzError.empty:
        return 'Please enter a password';
    }
  }
}

class PasswordFormz extends FormzInput<String, PasswordFormzError> {
  const PasswordFormz.pure() : super.pure('');

  const PasswordFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  PasswordFormzError? validator(String value) {
    if (value.isEmpty) {
      return PasswordFormzError.empty;
    }

    if (value.length < 6) {
      return PasswordFormzError.invalid;
    }

    return null;
  }
}
