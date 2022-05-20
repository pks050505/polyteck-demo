import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:polytech/features/question/domain/entities/set_entity.dart';
import 'package:polytech/features/question/domain/usecases/get_all_set_usecase.dart';

part 'set_event.dart';
part 'set_state.dart';

class SetBloc extends Bloc<SetEvent, SetState> {
  final GetAllSetUseCase useCase;
  SetBloc(this.useCase) : super(SetInitial()) {
    on<SetEvent>((event, emit) async {
      if (event is GetAllSetEvent) {
        emit(SetLoading());
        var data = await useCase.call(Params(event.subjectId));
        data.fold(
          (l) {
            emit(SetError());
          },
          (r) {
            emit(SetLoaded(r));
          },
        );
      }
    });
  }
}
