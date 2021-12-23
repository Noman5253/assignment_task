import 'package:flutter/material.dart';

class AppColors {
  static const COLOR_PRIMARY = 0xffff9035;
  static const COLOR_PINK = 0xfffff2e7;

  static const MaterialColor kPrimaryColor = const MaterialColor(
    COLOR_PRIMARY,
    const <int, Color>{
      900: const Color(COLOR_PRIMARY),
    },
  );

  static const MaterialColor kPrimaryDarkColor = const MaterialColor(
    COLOR_PRIMARY,
    const <int, Color>{
      900: const Color(COLOR_PRIMARY),
    },
  );
}
