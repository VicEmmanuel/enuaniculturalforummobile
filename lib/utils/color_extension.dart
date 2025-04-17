import 'package:flutter/material.dart';

extension ColorExtension on Color {
  Color withValues({double? alpha}) {
    return Color.fromRGBO(
      red,
      green,
      blue,
      alpha ?? opacity,
    );
  }

  // Add these getters if needed by the package
  double get a => opacity;
  double get r => red / 255.0;
  double get g => green / 255.0;
  double get b => blue / 255.0;
}