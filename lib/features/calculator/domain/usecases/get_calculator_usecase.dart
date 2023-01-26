import 'package:dartz/dartz.dart';

import '../../../../core/erros/failure.dart';
import '../entities/combination_entity.dart';
import '../repositories/i_calculator_repository.dart';

class GetCalculatorUseCase {
  final ICalculatorRepository iCalculatorRepository;

  GetCalculatorUseCase(this.iCalculatorRepository);

  Future<Either<Failure, CombinationEntity>> call(
      String firstName, String secondName) async {
    return await iCalculatorRepository.getCombination(firstName, secondName);
  }
}
