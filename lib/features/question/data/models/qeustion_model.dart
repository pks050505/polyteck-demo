import 'package:polytech/features/question/domain/entities/question_entity.dart';

class QuestionModel extends QuestionEntity {
  const QuestionModel({
    required String questionId,
    required String questionName,
    required String setId,
    required String subjectId,
  }) : super(
          questionId: questionId,
          questionName: questionName,
          setId: setId,
          subjectId: subjectId,
        );

  factory QuestionModel.fromJson(Map<String, dynamic> json) {
    return QuestionModel(
      questionId: json['questionId'],
      questionName: json['questionName'],
      setId: json['setId'],
      subjectId: json['subjectId'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "questionId": questionId,
      "setId": setId,
      "subjectId": subjectId,
      "questionName": questionName,
    };
  }
}

class AnswerModel extends AnswerEntity {
  const AnswerModel({required String answer, required bool isTrue})
      : super(answer: answer, isTrue: isTrue);

  factory AnswerModel.fromJson(Map<String, dynamic> json) {
    return AnswerModel(answer: json['answer'], isTrue: json['isTrue']);
  }
}
