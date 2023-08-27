import 'package:get_it/get_it.dart';
import 'package:untitled/src/data/data_sources/fact_remote_data_source.dart';
import 'package:untitled/src/data/repository/data_fact_repository_impl.dart';
import 'package:untitled/src/presentation/bloc/fact_bloc.dart';
import '../../src/domain/repository/data_fact_repository.dart';
import '../../src/domain/use_cases/get_cat_fact.dart';
import "package:http/http.dart" as http;


final sl = GetIt.instance;

Future<void> init()async{
  //bloc
  sl.registerFactory(() => FactBloc(getFact: sl()));


  //use case
  sl.registerLazySingleton(() => GetCatClass(sl()));

  //Repository
  sl.registerLazySingleton<DataFactRepository>(() => DataFactRepositoryImpl(sl()));

  //Remote Data Source
  sl.registerLazySingleton<FactRemoteDataSource>(() => FactRemoteDataSourceImpl(sl()));

  //Other service
  sl.registerLazySingleton(http.Client.new);

}