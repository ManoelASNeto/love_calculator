import 'package:equatable/equatable.dart';

import '../../domain/entities/combination_entity.dart';

class CombinationModel extends Equatable {
  final String? fname;
  final String? sname;
  final String? percentage;
  final String? result;

  const CombinationModel({
    this.fname,
    this.sname,
    this.percentage,
    this.result,
  });

  @override
  List<Object?> get props => [
        fname,
        sname,
        percentage,
        result,
      ];

  factory CombinationModel.fromJson(Map<String, dynamic> json) =>
      CombinationModel(
        fname: json['PrimeiroNome'],
        sname: json['SegundoNome'],
        percentage: json['Porcentagem'],
        result: json['Resultado'],
      );

  factory CombinationModel.toEntity(CombinationEntity entity) =>
      CombinationModel(
        fname: entity.fname,
        sname: entity.sname,
        percentage: entity.percentage,
        result: entity.result,
      );

  CombinationEntity toEntity() => CombinationEntity(
        fname: fname,
        sname: sname,
        percentage: percentage,
        result: result,
      );
}
