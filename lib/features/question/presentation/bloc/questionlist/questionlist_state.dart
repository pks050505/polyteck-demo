part of 'questionlist_bloc.dart';

abstract class QuestionlistState extends Equatable {
  const QuestionlistState();

  @override
  List<Object> get props => [];
}

class QuestionlistInitial extends QuestionlistState {}

class QuestionlistLoading extends QuestionlistState {}

class QuestionListLoaded extends QuestionlistState {
  final List<QuestionEntity> questions;
  const QuestionListLoaded(this.questions);
  @override
  List<Object> get props => [questions];
}

class QuestionListError extends QuestionlistState {}
