import 'dart:math';
import 'dart:ui';

abstract class ColorGenerator {
  ///generate random color
  static Color generateColor() {
    final random = Random();
    return Color.fromARGB(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
    );
  }
}
