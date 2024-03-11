import 'package:color_changer/core/error/error_handler.dart';
import 'package:color_changer/core/error/failures.dart';
import 'package:color_changer/core/helper/types.dart';
import 'package:dartz/dartz.dart';

class RepositoryRequestHandler<T> {
  FutureFailable<T> call({
    required Future<T> Function() request,
    Failure? defaultFailure,
  }) async {
    try {
      return Right(await request());
    } catch (error) {
      final failure = await errorHandler(error, defaultFailure);

      return Left(failure);
    }
  }
}
