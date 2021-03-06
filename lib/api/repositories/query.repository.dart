import 'dart:convert';

import 'package:diskursv2/api/api.exception.dart';
import 'package:diskursv2/api/api.provider.dart';
import 'package:diskursv2/api/models/query.model.dart';
import 'package:diskursv2/api/models/request.model.dart';
import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:diskursv2/utils/constants/config.const.dart';
import 'package:diskursv2/utils/types.dart';
import 'package:flutter/foundation.dart';

Future<List<QueryModel>> _fetchQueriesIsolate(
  RequestModel requestModel,
) async {
  final ApiProvider _apiProvider = ApiProvider.instance;

  if (requestModel.query.isEmpty) {
    throw const ApiException('Empty query is not allowed');
  }

  final result = await _apiProvider.makePostRequest(
    host,
    queryEndpoint,
    {
      'q': requestModel.query,
      'lang': requestModel.language.language,
    },
  );
  if (result.statusCode != 200) {
    throw const ApiException('API error');
  }

  return ((json.decode(result.body) as JSON)['result']['sims'] as List<dynamic>)
      .cast<JSON>()
      .map((JSON json) => QueryModel.fromJson(json))
      .toList();
}

abstract class _IQueryRepository {
  Future<Iterable<QueryModel>> fetchQueries(
    LanguageEnum language,
    String query,
  );
}

class QueryRepository implements _IQueryRepository {
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
