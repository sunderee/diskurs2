import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:diskursv2/utils/types.dart';

@immutable
class QueryModel extends Equatable {
  final String? term;
  final double? similarity;
  final double? frequency;

  const QueryModel._(this.term, this.similarity, this.frequency);
  factory QueryModel.fromJson(JSON json) => QueryModel._(
        json['term'],
        json['freq'] != null ? (json['freq'] as double) * 100 : json['prob'],
        json['avg'],
      );

  @override
  List<Object?> get props => [term, frequency, similarity];
}
