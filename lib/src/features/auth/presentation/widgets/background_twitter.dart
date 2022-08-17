import 'package:data_extractor/src/constants/constants.dart';
import 'package:flutter/material.dart';

class BackgroundTwitter extends StatelessWidget {
  const BackgroundTwitter({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppAssets.bgTwitter),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        constraints: const BoxConstraints(
          maxWidth: 400,
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Image.asset(
              AppAssets.logoTwitter,
              width: 400,
            ),
          ),
        ),
      ),
    );
  }
}
