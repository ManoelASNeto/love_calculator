part of 'calculator_bloc.dart';

enum CalculatorStatus {
  loading,
  ready,
  error,
}

class CalculatorState extends Equatable {
  final CalculatorStatus? status;
  final CombinationEntity? combinationEntity;
  final String? message;

  const CalculatorState._(this.status, this.combinationEntity, this.message);

  const CalculatorState.initial()
      : this._(CalculatorStatus.loading, null, null);

  CalculatorState loading() {
    return CalculatorState._(
        CalculatorStatus.loading, combinationEntity, message);
  }

  CalculatorState ready(CombinationEntity? combinationEntity) {
    return CalculatorState._(
        CalculatorStatus.ready, combinationEntity, message);
  }

  CalculatorState error(String? msgError) {
    return CalculatorState._(
        CalculatorStatus.error, combinationEntity, msgError);
  }

  @override
  List<Object?> get props => [status, combinationEntity, message];
}
