import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/fact.dart';
import '../../domain/use_cases/get_cat_fact.dart';

part 'fact_event.dart';
part 'fact_state.dart';

class FactBloc extends Bloc<FactEvent, FactState> {
  FactBloc(
  {
      required GetCatClass getFact
  }) :
        _getFact = getFact,
        super(FactInitial()) {
    on<GetFactEvent>(getFactEventHandler);
  }
  //use cases domain level
  final GetCatClass _getFact;

  Future<void> getFactEventHandler(GetFactEvent event, Emitter<FactState> emit) async{
    emit(const FactLoading());
    final results = await _getFact.getCatFact();
    results.fold(
            (failure) => emit(FactFailed("${failure.statusCode.toString()}: ${failure.message}")),
            (right) => emit(FactLoaded(right)));

  }


}
