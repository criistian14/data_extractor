import 'package:data_extractor/src/constants/constants.dart';
import 'package:data_extractor/src/features/auth/auth.dart';
import 'package:data_extractor/src/features/auth/presentation/provider/signup/signup_provider.dart';
import 'package:data_extractor/src/localization/l10n.dart';
import 'package:data_extractor/src/widgets/custom_outlined_button.dart';
import 'package:data_extractor/src/widgets/link_text.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class SignupView extends HookConsumerWidget {
  const SignupView({super.key});

  static const String route = '/signup';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return Container(
      margin: EdgeInsets.only(
        top: 0.4.h,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 370,
          ),
          child: Form(
            key: ref.watch(signupProvider).formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // * Name
                TextFormField(
                  onChanged: (value) {
                    ref.read(signupProvider.notifier).updateName(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }

                    return null;
                  },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  decoration: AppInputStyles.loginInputDecoration(
                    label: l10n.name,
                    hint: l10n.enterName,
                    icon: Icons.person,
                  ),
                ),

                // * Email
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    ref.read(signupProvider.notifier).updateEmail(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }

                    if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: AppInputStyles.loginInputDecoration(
                    label: l10n.email,
                    hint: l10n.enterEmail,
                    icon: Icons.email,
                  ),
                ),

                // * Password
                const SizedBox(height: 20),
                TextFormField(
                  onChanged: (value) {
                    ref.read(signupProvider.notifier).updatePassword(value);
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }

                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }

                    return null;
                  },
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                  obscureText: true,
                  decoration: AppInputStyles.loginInputDecoration(
                    label: l10n.password,
                    hint: l10n.enterPassword,
                    icon: Icons.lock,
                  ),
                ),

                // * Signup Button
                const SizedBox(height: 20),
                CustomOutlinedButton(
                  onPressed: () {
                    ref.read(signupProvider.notifier).validateForm();
                  },
                  text: l10n.signup,
                ),

                // * Login Button
                const SizedBox(height: 20),
                LinkText(
                  text: l10n.login,
                  onTap: () {
                    Navigator.of(context).pushNamed(LoginView.route);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
