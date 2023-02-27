import '../../../../core/erros/exception.dart';
import '../../../../core/erros/failure.dart';
import 'package:dartz/dartz.dart';
import '../datasources/calculator_remote_data_source.dart';
import '../../domain/entities/combination_entity.dart';
import '../../domain/repositories/i_calculator_repository.dart';

class CalculatorRepository implements ICalculatorRepository {
  final ICalculatorRemoteDataSource iCalculatorRemoteDataSource;

  CalculatorRepository(this.iCalculatorRemoteDataSource);

  @override
  Future<Either<Failure, CombinationEntity>> getCombination(
      String firstName, String secondName) async {
    try {
      var calcLove = await iCalculatorRemoteDataSource.calculateLove(
          firstName, secondName);
      final entity = calcLove.toEntity();
      return Right(entity);
    } on ServerException {
      throw Left(ServerFailure());
    }
  }
}
