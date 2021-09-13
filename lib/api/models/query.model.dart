import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:diskursv2/utils/types.dart';

@immutable
class QueryModel extends Equatable {
  final String? term;
  final int? similarity;
  final double? frequency;

  const QueryModel._(this.term, this.similarity, this.frequency);
  factory QueryModel.fromJson(JSON json) => QueryModel._(
        json['term'],
        json['freq'] != null
            ? ((json['freq'] as double) * 100).toInt()
            : json['prob'] as int,
        json['avg'] as double,
      );

  @override
  List<Object?> get props => [term, frequency, similarity];
}
