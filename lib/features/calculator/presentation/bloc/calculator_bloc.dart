import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/erros/failure.dart';
import '../../domain/entities/combination_entity.dart';
import '../../domain/usecases/get_calculator_usecase.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  final GetCalculatorUseCase getCalculatorUseCase;

  CalculatorBloc(this.getCalculatorUseCase)
      : super(
          const CalculatorState.initial(),
        ) {
    on<CalculatorLoveEvent>(
      (event, emit) async {
        emit(
          state.loading(),
        );
        var fold =
            await getCalculatorUseCase(event.firstName, event.secondName);
        emit(
          await fold.fold(
            (failure) => state.error(
              _mapCalculatorFailureToString(failure),
            ),
            (calcLove) => state.ready(calcLove),
          ),
        );
      },
    );
  }
}

String _mapCalculatorFailureToString(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Erro ao conectar ao servidor Tente novamente';
    default:
      return 'Tente novamente';
  }
}
