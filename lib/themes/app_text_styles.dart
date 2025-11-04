import 'package:flutter/material.dart';

// class AppText {
//   // === Headings ===
//   static TextStyle? h1(BuildContext context) =>
//       Theme.of(context).textTheme.displayLarge;

//   static TextStyle? h2(BuildContext context) =>
//       Theme.of(context).textTheme.displayMedium;

//   static TextStyle? h3(BuildContext context) {
//     Theme.of(context).textTheme.headlineSmall;
//   }

//   // === Titles ===
//   static TextStyle? title(BuildContext context) =>
//       Theme.of(context).textTheme.titleMedium;

//   // === Body text ===
//   static TextStyle? body(BuildContext context) =>
//       Theme.of(context).textTheme.bodyLarge;

//   static TextStyle? bodySmall(BuildContext context) =>
//       Theme.of(context).textTheme.bodyMedium;

//   // === Labels / buttons ===
//   static TextStyle? label(BuildContext context) =>
//       Theme.of(context).textTheme.labelLarge;
// }

extension AppText on BuildContext {
  TextStyle get h1 => Theme.of(this).textTheme.displayLarge!.copyWith(
    color: Theme.of(this).colorScheme.onSurface,
  );

  TextStyle get h2 => Theme.of(this).textTheme.displayMedium!.copyWith(
    color: Theme.of(this).colorScheme.onSurface,
  );

  TextStyle get h3 => Theme.of(this).textTheme.headlineSmall!.copyWith(
    color: Theme.of(this).colorScheme.primary,
  );

  TextStyle get h4 => Theme.of(this).textTheme.headlineSmall!.copyWith(
    color: Theme.of(this).colorScheme.onSurface,
  );

  TextStyle get title => Theme.of(this).textTheme.titleMedium!.copyWith(
    color: Theme.of(this).colorScheme.onSurface,
  );

  TextStyle get bodyLarge => Theme.of(
    this,
  ).textTheme.bodyLarge!.copyWith(color: Theme.of(this).colorScheme.onSurface);

  TextStyle get bodyMedium => Theme.of(this).textTheme.bodyMedium!.copyWith(
    color: Theme.of(this).colorScheme.onSurface.withValues(alpha: 0.8),
  );

  TextStyle get label => Theme.of(
    this,
  ).textTheme.labelLarge!.copyWith(color: Theme.of(this).colorScheme.primary);
}
