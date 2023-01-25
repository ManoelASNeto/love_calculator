import 'package:equatable/equatable.dart';

class CombinationEntity extends Equatable {
  final String? fname;
  final String? sname;
  final String? percentage;
  final String? result;

  const CombinationEntity({
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
}
