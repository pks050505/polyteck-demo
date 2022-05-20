import 'package:equatable/equatable.dart';

class QuestionEntity extends Equatable {
  final String subjectId;
  final String setId;
  final String questionId;
  final String questionName;

  const QuestionEntity({
    required this.questionId,
    required this.questionName,
    required this.setId,
    required this.subjectId,
  });
  @override
  List<Object?> get props => [subjectId, setId, questionId, questionName];
  @override
  bool? get stringify => true;
}

class AnswerEntity extends Equatable {
  final String answer;
  final bool isTrue;
  const AnswerEntity({required this.answer, required this.isTrue});
  @override
  List<Object?> get props => [answer, isTrue];
}
