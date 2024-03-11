import 'dart:ui';

import 'package:color_changer/core/helper/color_generator.dart';

abstract class ColorChangerDatasource {
  Future<Color> generateColor();
}

class ColorChangerDatasourceImpl implements ColorChangerDatasource {
  @override
  Future<Color> generateColor() async {
    return ColorGenerator.generateColor();
  }
}
