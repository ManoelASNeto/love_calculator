// ignore_for_file: avoid_print

import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

abstract class IHttpClient {
  Future<Response> get(String? endPoint, {Map<String, dynamic>? headers});
}

class HttpClient extends IHttpClient implements InterceptorContract {
  late InterceptedHttp _client;

  HttpClient() {
    _client = InterceptedHttp.build(interceptors: [this]);
  }

  @override
  Future<Response> get(String? endPoint,
      {Map<String, dynamic>? headers}) async {
    final response = await _client.get(
      endPoint!.toUri(),
      headers: {
        'X-RapidAPI-Key': 'bcd3a735e5msh7b1052ba9d87fe8p16f375jsn83225af8e734',
        'X-RapidAPI-Host': 'love-calculator.p.rapidapi.com',
      },
    );
    return response;
  }

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({ResponseData? data}) async {
    print('Response ${data!.url}');
    print('status code:  ${data.statusCode}');
    print('headers ${data.headers}');
    print('body: ${data.body}');

    return data;
  }
}
