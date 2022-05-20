import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:polytech/features/question/domain/entities/question_entity.dart';
import 'package:polytech/features/question/domain/repositories/subject_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';

class GetAllQuestionUsecase extends UseCase<List<QuestionEntity>, Params> {
  final QuestionRepository repository;
  GetAllQuestionUsecase(this.repository);
  @override
  Future<Either<Failure, List<QuestionEntity>>> call(Params params) async {
    return await repository.getAllQuestion(params.setId);
  }
}

class Params extends Equatable {
  final String setId;

  const Params(this.setId);
  @override
  List<Object?> get props => [setId];
}
