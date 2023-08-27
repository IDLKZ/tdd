part of 'fact_bloc.dart';

abstract class FactState extends Equatable {
  const FactState();
}

class FactInitial extends FactState {
  @override
  List<Object> get props => [];
}

class FactLoading extends FactState{
  const FactLoading();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class FactLoaded extends FactState{
    const FactLoaded(this.facts);
    final List<Fact> facts;
    @override
    // TODO: implement props
    List<Object?> get props => facts.map((fact)=>fact.sId).toList();
}


class FactFailed extends FactState{
  const FactFailed(this.message);
  final String message;
  @override
  // TODO: implement props
  List<Object?> get props => [this.message];

}