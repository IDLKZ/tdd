import 'package:untitled/core/use_case/use_case.dart';
import 'package:untitled/core/utils/typedef.dart';
import 'package:untitled/src/domain/entities/fact.dart';
import 'package:untitled/src/domain/repository/data_fact_repository.dart';

class GetCatClass extends UseCaseWithoutParam<List<Fact>>{
  const GetCatClass(this._repository);



  final DataFactRepository _repository;

  ResultFuture<List<Fact>> getCatFact()async{
    return _repository.getCatFact();
  }

  @override
  ResultFuture<List<Fact>> call() {
    return _repository.getCatFact();
  }
}