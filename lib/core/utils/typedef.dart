import 'package:untitled/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

typedef ResultFuture<Type> = Future<Either<ApiFailure,Type>>;

typedef ResultFutureVoid = Future<Either<ApiFailure,void>>;