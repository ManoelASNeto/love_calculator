part of 'calculator_bloc.dart';

abstract class CalculatorEvent {}

class CalculatorLoveEvent extends CalculatorEvent {
  String firstName;
  String secondName;

  CalculatorLoveEvent(this.firstName, this.secondName);
}
