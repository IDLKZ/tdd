part of 'fact_bloc.dart';

abstract class FactEvent extends Equatable {
  const FactEvent();
  @override
  List<Object> get props =>[];
}

class GetFactEvent extends FactEvent {
  const GetFactEvent();
}
