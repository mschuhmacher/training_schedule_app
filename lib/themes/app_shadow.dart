import 'package:flutter/material.dart';

const Offset _offset = Offset(0, 4);

extension AppShadow on BuildContext {
  List<BoxShadow> get shadowSmall => [
    BoxShadow(
      color: Theme.of(this).colorScheme.primary.withValues(alpha: 0.12),
      spreadRadius: 0,
      blurRadius: 2,
      offset: _offset,
    ),
    BoxShadow(
      color: Theme.of(this).colorScheme.primary.withValues(alpha: 0.06),
      spreadRadius: 0,
      blurRadius: 4,
      offset: _offset,
    ),
  ];
  List<BoxShadow> get shadowMedium => [
    BoxShadow(
      color: Theme.of(this).colorScheme.primary.withValues(alpha: 0.14),
      spreadRadius: 0,
      blurRadius: 4,
      offset: _offset,
    ),
    BoxShadow(
      color: Theme.of(this).colorScheme.primary.withValues(alpha: 0.08),
      spreadRadius: 0,
      blurRadius: 8,
      offset: _offset,
    ),
  ];
  List<BoxShadow> get shadowLarge => [
    BoxShadow(
      color: Theme.of(this).colorScheme.primary.withValues(alpha: 0.16),
      spreadRadius: 0,
      blurRadius: 6,
      offset: _offset,
    ),
    BoxShadow(
      color: Theme.of(this).colorScheme.primary.withValues(alpha: 0.10),
      spreadRadius: 0,
      blurRadius: 12,
      offset: _offset,
    ),
  ];
}
