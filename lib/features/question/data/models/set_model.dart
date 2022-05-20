import 'package:polytech/features/question/domain/entities/set_entity.dart';

class SetModel extends SetEntity {
  const SetModel({
    required String setId,
    required String subjectId,
    required String setName,
  }) : super(setId: setId, subjectId: subjectId, setName: setName);

  factory SetModel.fromJson(Map<String, dynamic> json) {
    return SetModel(
      setId: json['setId'],
      subjectId: json['subjectId'],
      setName: json['setName'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'setId': setId,
      'subjectId': subjectId,
      'setName': setName,
    };
  }
}
