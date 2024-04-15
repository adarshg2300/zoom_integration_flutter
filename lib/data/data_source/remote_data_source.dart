import 'dart:convert';

import '../../core/network/network_handler.dart';

class RemoteDataSource {
  final NetworkHandler networkHandler;

  RemoteDataSource(this.networkHandler);

  Future<dynamic> fetchData(String url, Map<String, String> headers) async {

    final response = await networkHandler.get(url, headers);
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
