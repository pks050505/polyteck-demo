// import 'package:polytech/features/question/data/datasources/subject_firebase_data_source.dart';
// import 'package:polytech/features/question/domain/entities/subject_entity.dart';
// import 'package:polytech/core/error/failure.dart';
// import 'package:dartz/dartz.dart';
// import 'package:polytech/features/question/domain/repositories/subject_repository.dart';

// class SubjectRepositoryImpl implements SubjectRepository {
//   final SubjectFirebaseDataSource dataSource;
//   SubjectRepositoryImpl(this.dataSource);
//   @override
//   Future<Either<Failure, SubjectEntity>> getChemistry() async {
//     try {
//       var responce = await dataSource.getChemistry();
//       return Right(responce);
//     } catch (e) {
//       throw e;
//     }
//   }

//   @override
//   Future<Either<Failure, SubjectEntity>> getMath() async {
//     try {
//       var responce = await dataSource.getMath();
//       return Right(responce);
//     } catch (e) {
//       throw e;
//     }
//   }

//   @override
//   Future<Either<Failure, SubjectEntity>> getPhysics() async {
//     try {
//       var responce = await dataSource.getPhysics();
//       return Right(responce);
//     } catch (e) {
//       throw e;
//     }
//   }
// }
import 'package:polytech/core/error/exceptions.dart';
import 'package:polytech/features/question/data/datasources/subject_firebase_data_source.dart';
import 'package:polytech/features/question/domain/entities/subject_entity.dart';
import 'package:polytech/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:polytech/features/question/domain/repositories/subject_repository.dart';

class SubjectRepositoryImpl implements SubjectRepository {
  final SubjectFirebaseDataSource dataSource;
  SubjectRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, List<SubjectEntity>>> getAllSubjectTiles() async {
    try {
      List<SubjectEntity> data = await dataSource.getAllSubjectTiles();
      return Right(data);
    } on ServerException {
      return Left(ServerFailure(errorMessage: 'from subRepoimpl outside'));
    }
  }
}
