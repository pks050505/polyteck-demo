part of 'set_bloc.dart';

abstract class SetEvent extends Equatable {
  const SetEvent();

  @override
  List<Object> get props => [];
}

class GetAllSetEvent extends SetEvent {
  final String subjectId;
  const GetAllSetEvent(this.subjectId);
  @override
  List<Object> get props => [subjectId];
}
