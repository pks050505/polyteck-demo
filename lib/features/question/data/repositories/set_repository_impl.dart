import 'package:polytech/core/error/exceptions.dart';
import 'package:polytech/features/question/data/datasources/set_firebase_data_source.dart';
import 'package:polytech/features/question/domain/entities/set_entity.dart';
import 'package:polytech/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:polytech/features/question/domain/repositories/subject_repository.dart';

class SetRepositoryImpl implements SetRepository {
  final SetFirebaseDataSource dataSource;
  SetRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<SetEntity>>> getAllSet(String subjectId) async {
    try {
      final data = await dataSource.getAllSet(subjectId);
      return Right(data);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'something went wrong ....'));
    }
  }
}
