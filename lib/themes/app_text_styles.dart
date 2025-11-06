import 'package:flutter/material.dart';

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
