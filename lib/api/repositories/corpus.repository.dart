import 'dart:convert';

import 'package:diskursv2/api/api.exception.dart';
import 'package:diskursv2/api/api.provider.dart';
import 'package:diskursv2/api/models/request.model.dart';
import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:diskursv2/utils/helpers/config.helper.dart';
import 'package:flutter/foundation.dart';

abstract class _ICorpusRepository {
  Future<List<String>> retrieveCorpusEntries(
    LanguageEnum language,
    String query,
  );
}

class CorpusRepository implements _ICorpusRepository {
  static Future<List<String>> _retrieveCorpusEntriesIsolate(
    RequestModel requestModel,
  ) async {
    final ApiProvider _apiProvider = ApiProvider.instance;
    final Future<ConfigProvider> _configProvider = ConfigProvider.instance;

    if (requestModel.query.isEmpty) {
      throw const ApiException('Empty query is not allowed');
    }

    final config = (await _configProvider).getConfigInstance();
    final result = await _apiProvider.makePostRequest(
      config.host,
      config.corpusEndpoint,
      {'q': requestModel.query, 'lang': requestModel.language.language},
    );
    if (result.statusCode != 200) {
      throw ApiException(
        'API error',
        statusCode: result.statusCode,
        rawBody: result.body,
      );
    }

    return ((json.decode(result.body) as Map<String, dynamic>)['result']
                as List<dynamic>?)
            ?.cast<String>() ??
        List.empty(growable: false);
  }

  @override
  Future<List<String>> retrieveCorpusEntries(
    LanguageEnum language,
    String query,
  ) async =>
      compute<RequestModel, List<String>>(
        _retrieveCorpusEntriesIsolate,
        RequestModel(language, query),
      );
}
