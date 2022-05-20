import 'package:polytech/features/question/domain/entities/subject_entity.dart';

class SubjectModel extends SubjectEntity {
  const SubjectModel({
    required String subjectId,
    required String subjectName,
  }) : super(subjectId: subjectId, subjectName: subjectName);
  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
        subjectId: json['subjectId'], subjectName: json['subjectName']);
  }

  Map<String, dynamic> toJson() {
    return {
      "subjectId": subjectId,
      "subjectName": subjectName,
    };
  }
}
