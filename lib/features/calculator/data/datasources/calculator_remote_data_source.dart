import 'dart:convert';

import '../../../../core/api/api_interceptor.dart';
import '../../../../core/api/endpoints.dart';
import '../../../../core/api/url_creator.dart';
import '../../../../core/device/network_info.dart';
import '../../../../core/erros/exception.dart';
import '../models/combination_model.dart';

abstract class ICalculatorRemoteDataSource {
  Future<CombinationModel> calculateLove(String first, String second);
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
      String firstName, String secondName) async {
    final combination =
        '${EndPoints.url}${EndPoints.percentage}?fname=$firstName&sname=$secondName';
    if (await iNetworkInfo.isConnected) {
      final response = await client.get(combination);
      switch (response.statusCode) {
        case 200:
          final responseJson = jsonDecode(response.body);
          return CombinationModel.fromJson(responseJson);
        default:
          throw ServerException();
      }
    } else {
      throw NetworkException();
    }
  }
}
