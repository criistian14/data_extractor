import 'package:flutter/material.dart';

class AppInputStyles {
  static InputDecoration loginInputDecoration({
    String? label,
    String? hint,
    IconData? icon,
    String? errorText,
  }) {
    return InputDecoration(
      labelText: label,
      hintText: hint,
      errorText: errorText,
      prefixIcon: icon != null
          ? Icon(
              icon,
              color: Colors.white,
            )
          : null,
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
      hintStyle: const TextStyle(
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white.withOpacity(0.3),
        ),
      ),
    );
  }
}
