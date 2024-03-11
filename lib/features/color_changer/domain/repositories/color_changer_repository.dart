import 'package:color_changer/core/helper/types.dart';
import 'package:flutter/material.dart';

abstract class ColorChangerRepository {
  FutureFailable<Color> generateColor();
}
