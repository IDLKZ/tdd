import 'package:equatable/equatable.dart';
import 'package:untitled/core/errors/exceptions.dart';

abstract class Failure extends Equatable{

  const Failure({required this.message, required this.statusCode});
  final String message;
  final int statusCode;

  @override
  // TODO: implement props
  List<Object?> get props => [message,statusCode];
}


class ApiFailure extends Failure{
  const ApiFailure({required super.message, required super.statusCode});

  ApiFailure.fromException(ServerException exception) : this(message: exception.message, statusCode: exception.statusCode);
}