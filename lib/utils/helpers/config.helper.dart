import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';

@immutable
class Config {
  final String host;
  final String queryEndpoint;
  final String corpusEndpoint;

  @literal
  const Config(
    this.host,
    this.queryEndpoint,
    this.corpusEndpoint,
  );
}

class ConfigProvider {
  static ConfigProvider? _instance;
  static Future<ConfigProvider> get instance async {
    final configInstance = await _readConfigFromAssets();
    return _instance ??= ConfigProvider._(configInstance);
  }

  static Future<Config> _readConfigFromAssets() async =>
      compute<String, Config>(
        _readConfigFromAssetsIsolate,
        'assets/config.json',
      );

  static Future<Config> _readConfigFromAssetsIsolate(String path) async {
    String data = await rootBundle.loadString(path);
    return json.decode(data) as Config;
  }

  final Config _configInstance;

  ConfigProvider._(this._configInstance);

  @doNotStore
  Config getConfigInstance() => _configInstance;
}
