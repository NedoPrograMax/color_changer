import 'package:color_changer/core/error/failures.dart';
import 'package:dartz/dartz.dart';

typedef FutureFailable<T> = Future<Either<Failure, T>>;
typedef Failable<T> = Either<Failure, T>;
