import 'package:flutter/material.dart';

final TextTheme appTextTheme = TextTheme(
  displayLarge: TextStyle(
    // Use for very large headlines
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.5,
    height: 1.2,
  ),
  displayMedium: TextStyle(
    // Section titles
    fontSize: 26,
    fontWeight: FontWeight.w600,
    height: 1.3,
  ),
  headlineSmall: TextStyle(
    // Smaller headings
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
  ),
  titleMedium: TextStyle(
    // For subtitles, list titles
    fontSize: 16,
    fontWeight: FontWeight.w500,
  ),
  bodyLarge: TextStyle(
    // Main body text
    fontSize: 16,
    fontWeight: FontWeight.normal,
  ),
  bodyMedium: TextStyle(
    // Secondary body text
    fontSize: 14,
    fontWeight: FontWeight.normal,
    color: Colors.grey[700],
  ),
  labelLarge: TextStyle(
    // Buttons / labels
    fontSize: 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  ),
);
