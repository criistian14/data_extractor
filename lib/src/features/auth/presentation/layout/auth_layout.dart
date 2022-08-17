import 'package:data_extractor/src/features/auth/presentation/widgets/auth_link_bar.dart';
import 'package:data_extractor/src/features/auth/presentation/widgets/auth_title.dart';
import 'package:data_extractor/src/features/auth/presentation/widgets/background_twitter.dart';
import 'package:data_extractor/src/widgets/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.page,
  });

  final Widget page;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scrollbar(
        child: ListView(
          children: [
            ResponsiveLayout(
              mobileBody: _MobileBody(
                child: page,
              ),
              desktopBody: _DesktopBody(
                child: page,
              ),
            ),

            // * LinksBar
            const AuthLinkBar(),
          ],
        ),
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      height: 94.h,
      child: Row(
        children: [
          // * Twitter Background
          const Expanded(
            child: BackgroundTwitter(),
          ),

          // * View
          Container(
            width: 600,
            height: double.infinity,
            color: Colors.black,
            child: Column(
              children: [
                // * Title
                const AuthTitle(),

                const SizedBox(height: 20),
                Expanded(child: child),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileBody extends StatelessWidget {
  const _MobileBody({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.black,
      ),
      child: Column(
        children: [
          // * Title
          const SizedBox(height: 20),
          const AuthTitle(),

          // * View
          const SizedBox(height: 20),
          SizedBox(
            height: 420,
            width: double.infinity,
            child: child,
          ),

          // * Twitter Background
          const SizedBox(
            height: 400,
            width: double.infinity,
            child: BackgroundTwitter(),
          ),
        ],
      ),
    );
  }
}
