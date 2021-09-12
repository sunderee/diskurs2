import 'dart:convert';

import 'package:diskursv2/api/api.exception.dart';
import 'package:diskursv2/api/api.provider.dart';
import 'package:diskursv2/api/models/query.model.dart';
import 'package:diskursv2/api/models/request.model.dart';
import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:diskursv2/utils/helpers/config.helper.dart';
import 'package:flutter/foundation.dart';

abstract class _IQueryRepository {
  Future<Iterable<QueryModel>> fetchQueries(
    LanguageEnum language,
    String query,
  );
}

class QueryRepository implements _IQueryRepository {
  static Future<Iterable<QueryModel>> _fetchQueriesIsolate(
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
      config.queryEndpoint,
      {'q': requestModel.query, 'lang': requestModel.language.language},
    );
    if (result.statusCode != 200) {
      throw ApiException(
        'API error',
        statusCode: result.statusCode,
        rawBody: result.body,
      );
    }

    return ((json.decode(result.body) as JSON)['result']['sims']
                as List<dynamic>?)
            ?.cast<Map<String, dynamic>>()
            .map((JSON json) => QueryModel.fromJson(json)) ??
        const Iterable.empty();
  }

  @override
  Future<Iterable<QueryModel>> fetchQueries(
    LanguageEnum language,
    String query,
  ) async =>
      compute<RequestModel, Iterable<QueryModel>>(
        _fetchQueriesIsolate,
        RequestModel(language, query),
      );
}
