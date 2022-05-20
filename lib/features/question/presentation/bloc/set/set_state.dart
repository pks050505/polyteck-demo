part of 'set_bloc.dart';

abstract class SetState extends Equatable {
  const SetState();

  @override
  List<Object> get props => [];
}

class SetInitial extends SetState {}

class SetLoading extends SetState {}

class SetLoaded extends SetState {
  final List<SetEntity> sets;
  const SetLoaded(this.sets);
  @override
  List<Object> get props => [sets];
}

class SetError extends SetState {}
