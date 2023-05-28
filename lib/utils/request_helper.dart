import 'dart:convert';
import 'package:flutter_template/utils/api.dart';
import 'package:flutter_template/utils/pref.dart';
import 'package:http/http.dart' as http;

class RequestHelper extends http.BaseClient {
  final http.Client _httpClient = http.Client();

  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    request.headers.addAll({
      'x-access-token': Prefs.getString("access_token") ?? "",
    });
    return _httpClient.send(request).timeout(const Duration(seconds: 40));
  }

  @override
  Future<http.Response> post(url,
      {Map<String, String>? headers, body, Encoding? encoding}) async {
    return _sendUnstreamed('POST', url, headers, body, encoding);
  }

  Future<http.Response> _sendUnstreamed(
      String method, url, Map<String, String>? headers,
      [body, Encoding? encoding]) async {
    var request = http.Request(method, _fromUriOrString(url));

    if (headers != null) request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }
    var responseData = await http.Response.fromStream(await send(request));
    // logRequest(responseData, body);
    return responseData;
  }

  Uri _fromUriOrString(uri) => uri is String ? Uri.parse(uri) : uri as Uri;

  Uri url(String urlPath) {
    final url = baseUrl + urlPath;
    return Uri.parse(url);
  }
}
