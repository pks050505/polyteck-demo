import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:polytech/features/question/domain/entities/question_entity.dart';
import 'package:polytech/features/question/domain/usecases/get_all_question_of_set.dart';

part 'questionlist_event.dart';
part 'questionlist_state.dart';

class QuestionlistBloc extends Bloc<QuestionlistEvent, QuestionlistState> {
  final GetAllQuestionUsecase usecase;

  QuestionlistBloc(this.usecase) : super(QuestionlistInitial()) {
    on<GetAllQuestionEvent>((event, emit) async {
      emit(QuestionlistLoading());
      var data = await usecase.call(Params(event.setId));
      data.fold((l) {
        emit(QuestionListError());
      }, (r) {
        emit(QuestionListLoaded(r));
      });
    });
  }
}
