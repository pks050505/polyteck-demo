part of 'subject_bloc.dart';

abstract class SubjectState extends Equatable {
  const SubjectState();

  @override
  List<Object> get props => [];
}

class SubjectInitial extends SubjectState {}

class SubjectLoading extends SubjectState {}

class SubjectLoaded extends SubjectState {
  final List<SubjectEntity> subjects;
  const SubjectLoaded(this.subjects);
}

class SubjectError extends SubjectState {
  final String error;
  const SubjectError(this.error);
  @override
  List<Object> get props => [error];
}
