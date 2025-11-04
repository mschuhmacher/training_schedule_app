import 'package:flutter/material.dart';
import 'package:training_schedule_app/themes/app_text_theme.dart';
import 'app_colors.dart';

final ThemeData lightAppTheme = ThemeData(
  useMaterial3: true,
  colorScheme: AppColorsLight.colorScheme,
  textTheme: appTextTheme.apply(
    bodyColor: AppColorsLight.colorScheme.onSurface,
    displayColor: AppColorsLight.colorScheme.primary,
  ),
  fontFamily: 'Poppins',
);

final ThemeData darkAppTheme = ThemeData(
  useMaterial3: true,
  colorScheme: AppColorsDark.colorScheme,
  textTheme: appTextTheme,
  fontFamily: 'Poppins',
);
