import 'package:diskursv2/api/repositories/language.enum.dart';
import 'package:meta/meta.dart';

@immutable
class RequestModel {
  final LanguageEnum language;
  final String query;

  @literal
  const RequestModel(this.language, this.query);
}
