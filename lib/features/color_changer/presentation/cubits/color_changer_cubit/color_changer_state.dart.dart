part of 'color_changer_cubit.dart';

abstract class ColorChangerState extends Equatable {
  const ColorChangerState();
}

class ColorChangerInitial extends ColorChangerState {
  const ColorChangerInitial();

  @override
  List<Object?> get props => [];
}

class ColorChangerSucess extends ColorChangerState {
  final Color color;

  const ColorChangerSucess({required this.color});

  @override
  List<Object?> get props => [color];
}

class ColorChangerFailure extends ColorChangerState {
  final Failure failure;

  const ColorChangerFailure({required this.failure});

  @override
  List<Object?> get props => [failure];
}
