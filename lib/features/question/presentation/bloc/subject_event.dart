part of 'subject_bloc.dart';

abstract class SubjectEvent extends Equatable {
  const SubjectEvent();

  @override
  List<Object> get props => [];
}

class GetAllSubjectEvent extends SubjectEvent {
  const GetAllSubjectEvent();
}
