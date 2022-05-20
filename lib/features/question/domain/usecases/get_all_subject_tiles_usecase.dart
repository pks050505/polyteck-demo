import 'package:polytech/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:polytech/core/usecase/usecase.dart';
import 'package:polytech/features/question/domain/repositories/subject_repository.dart';

import '../entities/subject_entity.dart';

class GetAllSubjectTiles extends UseCase<List<SubjectEntity>, NoParams> {
  final SubjectRepository repository;
  GetAllSubjectTiles(this.repository);
  @override
  Future<Either<Failure, List<SubjectEntity>>> call(NoParams params) async {
    return await repository.getAllSubjectTiles();
  }
}
