import 'package:flutter/material.dart';

abstract class IUrlCreator {
  String create({
    @required String endpoint,
    Map<String, dynamic>? queryParameters,
    List<String>? pathSegments,
    String scheme,
    String? hostKey,
    int port,
  });
}

class UrlCreator implements IUrlCreator {
  static const _urlKey = 'love-calculator.p.rapidapi.com';

  @override
  String create(
      {String? endpoint,
      Map<String, dynamic>? queryParameters,
      List<String>? pathSegments,
      String scheme = 'https',
      String? hostKey,
      int? port}) {
    return Uri(
            scheme: scheme,
            host: _urlKey,
            port: port,
            pathSegments: [...endpoint!.split('/'), ...(pathSegments ?? [])],
            queryParameters: queryParameters)
        .toString();
  }
}
