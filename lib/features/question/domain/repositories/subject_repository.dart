import 'package:dartz/dartz.dart';

import 'package:polytech/core/error/failure.dart';
import 'package:polytech/features/question/domain/entities/question_entity.dart';
import 'package:polytech/features/question/domain/entities/set_entity.dart';
import 'package:polytech/features/question/domain/entities/subject_entity.dart';

abstract class SubjectRepository {
  Future<Either<Failure, List<SubjectEntity>>> getAllSubjectTiles();
}

abstract class SetRepository {
  Future<Either<Failure, List<SetEntity>>> getAllSet(String subjectId);
}

abstract class QuestionRepository {
  Future<Either<Failure, List<QuestionEntity>>> getAllQuestion(String setId);
}
