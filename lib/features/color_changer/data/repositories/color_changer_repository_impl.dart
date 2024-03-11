import 'dart:ui';

import 'package:color_changer/core/error/failures.dart';
import 'package:color_changer/core/error/repository_request_handler.dart';
import 'package:color_changer/core/helper/types.dart';
import 'package:color_changer/features/color_changer/data/datasources/color_changer_datasource.dart';
import 'package:color_changer/features/color_changer/domain/repositories/color_changer_repository.dart';

class ColorChangerRepositoryImpl implements ColorChangerRepository {
  final ColorChangerDatasource datasource;

  ColorChangerRepositoryImpl({required this.datasource});

  @override
  FutureFailable<Color> generateColor() {
    return RepositoryRequestHandler<Color>()(
      request: datasource.generateColor,
      defaultFailure: const ColorGeneratingFailure(),
    );
  }
}
