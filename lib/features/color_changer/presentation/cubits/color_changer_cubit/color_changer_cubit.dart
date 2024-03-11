import 'package:color_changer/core/error/failures.dart';
import 'package:color_changer/features/color_changer/data/datasources/color_changer_datasource.dart';
import 'package:color_changer/features/color_changer/domain/repositories/color_changer_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'color_changer_state.dart.dart';

class ColorChangerCubit extends Cubit<ColorChangerState> {
  final ColorChangerRepository repository;
  ColorChangerCubit({
    required this.repository,
  }) : super(const ColorChangerInitial());

  Future<void> generateColor() async {
    final result = await repository.generateColor();
    result.fold(
      (failure) => emit(ColorChangerFailure(failure: failure)),
      (color) => emit(ColorChangerSucess(color: color)),
    );
  }
}
