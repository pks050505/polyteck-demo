part of 'questionlist_bloc.dart';

abstract class QuestionlistEvent extends Equatable {
  const QuestionlistEvent();

  @override
  List<Object> get props => [];
}

class GetAllQuestionEvent extends QuestionlistEvent {
  final String setId;
  const GetAllQuestionEvent(this.setId);
  @override
  List<Object> get props => [setId];
}
