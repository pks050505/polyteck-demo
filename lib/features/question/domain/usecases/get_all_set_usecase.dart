import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:polytech/features/question/domain/entities/set_entity.dart';
import 'package:polytech/features/question/domain/repositories/subject_repository.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';

class GetAllSetUseCase extends UseCase<List<SetEntity>, Params> {
  final SetRepository repository;
  GetAllSetUseCase(this.repository);
  @override
  Future<Either<Failure, List<SetEntity>>> call(Params params) async {
    return await repository.getAllSet(params.subjectId);
  }
}

class Params extends Equatable {
  final String subjectId;

  const Params(this.subjectId);
  @override
  List<Object?> get props => [subjectId];
}
