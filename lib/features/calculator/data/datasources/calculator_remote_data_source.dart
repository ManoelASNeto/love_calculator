import 'dart:convert';

import '../../../../core/api/api_interceptor.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/api/url_creator.dart';
import '../../../../core/device/network_info.dart';
import '../../../../core/erros/exception.dart';
import '../models/combination_model.dart';

abstract class ICalculatorRemoteDataSource {
  Future<CombinationModel> calculateLove(String? first, String? second);
}

class CalculatorRemoteDataSource implements ICalculatorRemoteDataSource {
  final IHttpClient client;
  final INetworkInfo iNetworkInfo;
  final IUrlCreator iUrlCreator;

  CalculatorRemoteDataSource(
    this.client,
    this.iNetworkInfo,
    this.iUrlCreator,
  );

  @override
  Future<CombinationModel> calculateLove(
      String? firstName, String? secondName) async {
    final isConnected = await iNetworkInfo.isConnected;
    if (isConnected) {
      final response = await client.get(
        iUrlCreator.create(
          endpoint: EndPoints.percentage,
          queryParameters: {
            'fname': firstName,
            'sname': secondName,
          },
        ),
      );

      switch (response.statusCode) {
        case 200:
          return CombinationModel.fromJson(jsonDecode(response.body));
        default:
          throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }
}
