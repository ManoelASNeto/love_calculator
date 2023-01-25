import 'package:love_calculator/core/erros/exception.dart';
import 'package:love_calculator/core/erros/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:love_calculator/features/calculator/data/datasources/calculator_remote_data_source.dart';
import 'package:love_calculator/features/calculator/domain/entities/combination_entity.dart';
import 'package:love_calculator/features/calculator/domain/repositories/i_calculator_repository.dart';

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
