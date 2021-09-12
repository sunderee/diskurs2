import 'package:meta/meta.dart';

@immutable
class ResultModel {
  final int statusCode;
  final String body;

  @literal
  const ResultModel(this.statusCode, this.body);
}
