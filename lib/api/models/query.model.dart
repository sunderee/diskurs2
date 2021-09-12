import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

typedef JSON = Map<String, dynamic>;

@immutable
class QueryModel extends Equatable {
  final String? term;
  final double? similarity;
  final double? frequency;

  const QueryModel._(this.term, this.similarity, this.frequency);
  factory QueryModel.fromJson(
    JSON json, {
    bool isSlovene = true,
  }) =>
      QueryModel._(
        json['term'],
        isSlovene ? json['prob'] / 100 : json['freq'],
        isSlovene ? json['avg'] / 100 : json['avg'],
      );

  @override
  List<Object?> get props => [term, frequency, similarity];
}
