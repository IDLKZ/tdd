import 'dart:convert';

import 'package:untitled/core/errors/exceptions.dart';
import 'package:untitled/src/data/models/fact_model.dart';
import 'package:untitled/src/domain/entities/fact.dart';
import "package:http/http.dart" as http;

import '../../../core/utils/app_constants.dart';
abstract class FactRemoteDataSource{
  //Return Models
  Future<List<FactModel>> getCatFact();
}

class FactRemoteDataSourceImpl implements FactRemoteDataSource{

  const FactRemoteDataSourceImpl(this._client);
  final http.Client _client;

  @override
  Future<List<FactModel>> getCatFact() async {
    try{
      final response = await _client.get(Uri.parse(baseApiUri + "/facts"));
      if(response.statusCode != 200){
        throw ServerException(message: "Error occured: ${response.body}", statusCode: response.statusCode);
      }
      return  List<Map<String,dynamic>>.from(jsonDecode(response.body) as List)
          .map((e) => FactModel.fromMap(e)).toList();
    }
    catch(e){
      throw ServerException(message: e.toString(), statusCode: 500);
    }



  }

}