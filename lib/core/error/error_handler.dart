import 'dart:io';

import 'package:color_changer/core/error/failures.dart';
import 'package:equatable/equatable.dart';

Future<Failure> errorHandler(Object error, Failure? defaultFailure) async {
  try {
    if (error is MessageException) {
      if (error is ColorGeneratingException) {
        return ColorGeneratingFailure(errorMessage: error.message);
      }
      return Failure(errorMessage: error.message);
    }
    return defaultFailure!;
  } catch (err) {
    return const Failure();
  }
}

class MessageException extends Equatable implements Exception {
  final String? message;
  const MessageException({this.message});

  @override
  List<Object?> get props => [message];
  @override
  bool? get stringify => true;
}

class ColorGeneratingException extends MessageException {
  const ColorGeneratingException({super.message});
}
