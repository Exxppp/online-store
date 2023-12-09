import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseApi {
  final String baseUrl = 'ostest.whitetigersoft.ru';
  final String appKey = 'phynMLgDkiG06cECKA3LJATNiUZ1ijs-eNhTf0IGq4mSpJF3bD42MjPUjWwj7sqLuPy4_nBCOyX3-fRiUl6rnoCjQ0vYyKb-LR03x9kYGq53IBQ5SrN8G1jSQjUDplXF';

  Future<dynamic> get(String relativePath, {Map<String, dynamic>? params}) async {
    final uri = _buildUri(relativePath, params: params);
    final response = await http.get(uri);
    return _handleResponse(response);
  }

  Future<dynamic> post(String relativePath, {Map<String, dynamic>? params}) async {
    final uri = _buildUri(relativePath);
    final response = await http.post(uri, body: params);
    return _handleResponse(response);
  }

  Uri _buildUri(String relativePath, {Map<String, dynamic>? params}) {
    final queryParams = params ?? {};
    queryParams['appKey'] = appKey;
    final uri = Uri.http(baseUrl, relativePath, queryParams);
    return uri;
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    if (response.statusCode == 200) {
      return jsonDecode(response.body) as Map<String, dynamic>;
    } else {
      throw Exception(
          'Failed to load data. Status code: ${response.statusCode}');
    }
  }
}
