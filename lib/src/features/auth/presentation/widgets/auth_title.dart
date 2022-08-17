import 'package:data_extractor/src/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthTitle extends StatelessWidget {
  const AuthTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: [
          Image.asset(
            AppAssets.logoTwitter,
            width: 50,
            height: 50,
          ),

          // * Text
          const SizedBox(height: 20),
          FittedBox(
            child: Text(
              'Happening Now',
              style: GoogleFonts.montserratAlternates(
                fontSize: 60,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
