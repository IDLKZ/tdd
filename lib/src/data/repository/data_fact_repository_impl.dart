import 'package:untitled/core/errors/exceptions.dart';
import 'package:untitled/core/utils/typedef.dart';
import 'package:untitled/src/data/data_sources/fact_remote_data_source.dart';
import 'package:dartz/dartz.dart';
import 'package:untitled/src/domain/entities/fact.dart';
import '../../../core/errors/failure.dart';
import '../../domain/repository/data_fact_repository.dart';

class DataFactRepositoryImpl implements DataFactRepository{

  const DataFactRepositoryImpl(this._factRemoteDataSource);

  final FactRemoteDataSource _factRemoteDataSource;


  @override
  ResultFuture<List<Fact>> getCatFact() async {
    // TODO: implement getCatFact
    try{
      final facts = await _factRemoteDataSource.getCatFact();
      return Right(facts);
    }
    on ServerException catch(e){
      return Left(ApiFailure.fromException(e));
    }


  }

}