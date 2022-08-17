import 'package:data_extractor/src/constants/constants.dart';
import 'package:data_extractor/src/widgets/link_text.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AuthLinkBar extends StatelessWidget {
  const AuthLinkBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizerUtil.width < mobileWidth ? null : 6.h,
      width: double.infinity,
      color: Colors.black,
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          LinkText(
            text: 'About',
            onTap: () {},
          ),
          const LinkText(text: 'Help'),
          const LinkText(text: 'Terms of Service'),
          const LinkText(text: 'Privacy Policy'),
          const LinkText(text: 'Cookie Policy'),
          const LinkText(text: 'Ads info'),
          const LinkText(text: 'Blog'),
          const LinkText(text: 'Status'),
          const LinkText(text: 'Careers'),
          const LinkText(text: 'Brand Resources'),
          const LinkText(text: 'Advertising'),
          const LinkText(text: 'Marketing'),
        ],
      ),
    );
  }
}
