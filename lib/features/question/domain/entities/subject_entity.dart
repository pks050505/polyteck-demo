import 'package:equatable/equatable.dart';

class SubjectEntity extends Equatable {
  final String subjectId;
  final String subjectName;
  const SubjectEntity({required this.subjectId, required this.subjectName});
  @override
  List<Object?> get props => [subjectName];
  @override
  bool? get stringify => true;
}
