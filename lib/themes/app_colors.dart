import 'package:flutter/material.dart';

// Also define different levels of shadow (small, medium, big), so it's easy to play around with
// Make selected UI element lighter or darker than the rest, and increase shadow to push it forward

// Define main colors and lighter variants of the same color for highlighting, shadows, and depth in the design
// different shades of background color

class AppColorsLight {
  static const textColor = Color(0xFF0c0b19);
  static const backgroundColor = Color(0xFFf4f3fc);
  static const primaryColor = Color(0xFF3f2ed6);
  static const primaryFgColor = Color(0xFFf4f3fc);
  static const secondaryColor = Color(0xFF9488f2);
  static const secondaryFgColor = Color(0xFF0c0b19);
  static const accentColor = Color(0xFF5843f9);
  static const accentFgColor = Color(0xFFf4f3fc);

  static const colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: primaryColor,
    onPrimary: primaryFgColor,
    secondary: secondaryColor,
    onSecondary: secondaryFgColor,
    tertiary: accentColor,
    onTertiary: accentFgColor,
    surface: backgroundColor,
    onSurface: textColor,
    error:
        Brightness.light == Brightness.light
            ? Color(0xffB3261E)
            : Color(0xffF2B8B5),
    onError:
        Brightness.light == Brightness.light
            ? Color(0xffFFFFFF)
            : Color(0xff601410),
  );
}

class AppColorsDark {
  static const textColor = Color(0xFFe7e6f4);
  static const backgroundColor = Color(0xFF04030c);
  static const primaryColor = Color(0xFF3a29d1);
  static const primaryFgColor = Color(0xFFe7e6f4);
  static const secondaryColor = Color(0xFF1a0d77);
  static const secondaryFgColor = Color(0xFFe7e6f4);
  static const accentColor = Color(0xFF1b06bc);
  static const accentFgColor = Color(0xFFe7e6f4);

  static const colorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: primaryColor,
    onPrimary: primaryFgColor,
    secondary: secondaryColor,
    onSecondary: secondaryFgColor,
    tertiary: accentColor,
    onTertiary: accentFgColor,
    surface: backgroundColor,
    onSurface: textColor,
    error:
        Brightness.dark == Brightness.light
            ? Color(0xffB3261E)
            : Color(0xffF2B8B5),
    onError:
        Brightness.dark == Brightness.light
            ? Color(0xffFFFFFF)
            : Color(0xff601410),
  );
}
