import 'dart:ui';

import 'package:flutter/material.dart';

extension ColorExtension on Color {
  /// get color that will look contrast on this color
  Color getOnColor() => Color.alphaBlend(
        withOpacity(0.3),
        Colors.black.withOpacity(0.8),
      );
}
