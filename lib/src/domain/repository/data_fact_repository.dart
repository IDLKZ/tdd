import 'package:untitled/core/errors/failure.dart';
import 'package:untitled/core/utils/typedef.dart';
import 'package:untitled/src/domain/entities/fact.dart';
import 'package:dartz/dartz.dart';

abstract class DataFactRepository{
  const DataFactRepository();

  ResultFuture<List<Fact>> getCatFact();






}