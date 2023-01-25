import 'package:dartz/dartz.dart';
import 'package:love_calculator/core/erros/failure.dart';
import 'package:love_calculator/features/calculator/domain/entities/combination_entity.dart';
import 'package:love_calculator/features/calculator/domain/repositories/i_calculator_repository.dart';

class GetCalculatorUseCase {
  final ICalculatorRepository iCalculatorRepository;

  GetCalculatorUseCase(this.iCalculatorRepository);

  Future<Either<Failure, CombinationEntity>> call(
      String firstName, String secondName) async {
    return await iCalculatorRepository.getCombination(firstName, secondName);
  }
}
