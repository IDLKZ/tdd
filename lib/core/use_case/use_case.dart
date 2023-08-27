import 'package:untitled/core/utils/typedef.dart';

abstract class UseCaseWithParam<T,Params>{
  const UseCaseWithParam();
  ResultFuture<T> call(Params);
}

abstract class UseCaseWithoutParam<T>{
  const UseCaseWithoutParam();
  ResultFuture<T> call();
}