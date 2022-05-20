import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:polytech/core/error/failure.dart';
import 'package:polytech/core/usecase/usecase.dart';
import 'package:polytech/features/question/domain/entities/subject_entity.dart';

import '../../domain/usecases/get_all_subject_tiles_usecase.dart';

part 'subject_event.dart';
part 'subject_state.dart';

class SubjectBloc extends Bloc<SubjectEvent, SubjectState> {
  final GetAllSubjectTiles usecase;

  SubjectBloc(this.usecase) : super(SubjectInitial()) {
    on<SubjectEvent>((event, emit) async {
      if (event is GetAllSubjectEvent) {
        emit(SubjectLoading());

        Either<Failure, List<SubjectEntity>> data =
            await usecase.call(NoParams());
        data.fold(
          (l) {
            emit(SubjectError(l.errorMessage));
          },
          (r) {
            emit(SubjectLoaded(r));
          },
        );
      }
    });
  }
}
