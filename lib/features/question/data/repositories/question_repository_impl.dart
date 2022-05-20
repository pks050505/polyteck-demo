import 'package:polytech/core/error/exceptions.dart';
import 'package:polytech/features/question/data/datasources/question_firebase_data_source.dart';
import 'package:polytech/features/question/domain/entities/question_entity.dart';
import 'package:polytech/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:polytech/features/question/domain/repositories/subject_repository.dart';

class QuestionRepositoryImpl implements QuestionRepository {
  final QuestionFirebaseDataSource dataSource;
  QuestionRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<QuestionEntity>>> getAllQuestion(
      String setId) async {
    try {
      final data = await dataSource.getAllQuestion(setId);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'something went wrong ....'));
    }
  }
}
