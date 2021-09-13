import 'dart:convert';
import 'dart:io';

import 'package:diskursv2/api/models/result.model.dart';

class ApiProvider {
  static ApiProvider? _instance;
  static ApiProvider get instance {
    return _instance ??= ApiProvider._();
  }

  final HttpClient _client = HttpClient();

  ApiProvider._();

  Future<ResultModel> makePostRequest(
    String host,
    String endpoint,
    Map<String, dynamic> body,
  ) async {
    final request = await _client.postUrl(Uri.https(host, endpoint))
      ..headers.contentType = ContentType.json
      ..write(json.encode(body));
    final result = await request.close();

    final rawBody = await result
        .transform(const Utf8Decoder(allowMalformed: true))
        .reduce((accumulator, element) => accumulator + element);
    return ResultModel(
      result.statusCode,
      rawBody,
    );
  }
}
