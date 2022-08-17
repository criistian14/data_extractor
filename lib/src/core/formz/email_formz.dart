import 'package:email_validator/email_validator.dart';
import 'package:formz/formz.dart';

enum EmailFormzError { empty, invalid }

extension EmailFormzErrorExt on EmailFormzError {
  String? text() {
    switch (this) {
      case EmailFormzError.invalid:
        return 'Please ensure the email entered is valid';

      case EmailFormzError.empty:
        return 'Please enter a email';
    }
  }
}

class EmailFormz extends FormzInput<String, EmailFormzError> {
  const EmailFormz.pure() : super.pure('');

  const EmailFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  EmailFormzError? validator(String value) {
    if (value.isEmpty) {
      return EmailFormzError.empty;
    }

    if (!EmailValidator.validate(value)) {
      return EmailFormzError.invalid;
    }

    return null;
  }
}
