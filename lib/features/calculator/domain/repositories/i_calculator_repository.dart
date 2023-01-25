import 'package:dartz/dartz.dart';

import '../../../../core/erros/failure.dart';
import '../entities/combination_entity.dart';

abstract class ICalculatorRepository {
  Future<Either<Failure, CombinationEntity>> getCombination(
    String firstName,
    String secondName,
  );
}
