import 'package:data_extractor/src/constants/constants.dart';
import 'package:data_extractor/src/core/formz/formz.dart';
import 'package:data_extractor/src/features/auth/auth.dart';
import 'package:data_extractor/src/features/auth/presentation/provider/login/login_provider.dart';
import 'package:data_extractor/src/features/dashboard/dashboard.dart';
import 'package:data_extractor/src/injection_container.dart';
import 'package:data_extractor/src/localization/l10n.dart';
import 'package:data_extractor/src/routing/router.dart';
import 'package:data_extractor/src/widgets/custom_outlined_button.dart';
import 'package:data_extractor/src/widgets/link_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  static const String route = '/login';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final _formKey = GlobalKey<FormState>();

    ref.listen<LoginStatus>(
      loginProvider.select((value) => value.status),
      (previous, next) {
        if (next == LoginStatus.success) {
          ref.read(authProvider.notifier).successfulLogin();
          sl<NavigationService>().replaceTo(DashboardView.route);
        }
      },
    );

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
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // * Email
                const _Email(),

                // * Password
                const SizedBox(height: 20),
                const _Password(),

                // * Login Button
                const SizedBox(height: 20),
                _SubmitButton(
                  formKey: _formKey,
                ),

                // * Signup Button
                const SizedBox(height: 20),
                LinkText(
                  text: l10n.signup,
                  onTap: () {
                    Navigator.pushNamed(context, SignupView.route);
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

class _Email extends HookConsumerWidget {
  const _Email();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final email = ref.watch(loginProvider.select((value) => value.email));

    return TextFormField(
      onChanged: (value) => ref.read(loginProvider.notifier).updateEmail(
            value,
          ),
      validator: (_) => email.error?.text(),
      style: const TextStyle(
        color: Colors.white,
      ),
      keyboardType: TextInputType.emailAddress,
      decoration: AppInputStyles.loginInputDecoration(
        label: l10n.email,
        hint: l10n.enterEmail,
        icon: Icons.email,
        errorText: email.invalid ? email.error?.text() : null,
      ),
    );
  }
}

class _Password extends HookConsumerWidget {
  const _Password();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final password = ref.watch(loginProvider.select((value) => value.password));

    return TextFormField(
      onChanged: (value) => ref.read(loginProvider.notifier).updatePassword(
            value,
          ),
      validator: (_) => password.error?.text(),
      style: const TextStyle(
        color: Colors.white,
      ),
      obscureText: true,
      decoration: AppInputStyles.loginInputDecoration(
        label: l10n.password,
        hint: l10n.enterPassword,
        icon: Icons.lock,
        errorText: password.invalid ? password.error?.text() : null,
      ),
    );
  }
}

class _SubmitButton extends HookConsumerWidget {
  const _SubmitButton({
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;

    return CustomOutlinedButton(
      onPressed: () {
        final isValid = formKey.currentState?.validate() ?? false;
        if (!isValid) return;

        ref.read(loginProvider.notifier).loginDone();
      },
      text: l10n.login,
      isLoading: ref.watch(
            loginProvider.select((value) => value.status),
          ) ==
          LoginStatus.loading,
    );
  }
}
