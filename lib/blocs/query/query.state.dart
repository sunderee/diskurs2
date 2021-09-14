import 'package:diskursv2/api/models/query.model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class QueryState extends Equatable {
  final List<QueryModel> data;
  final Exception? exception;

  const QueryState({
    this.data = const <QueryModel>[],
    this.exception,
  });

  @override
  List<Object?> get props => [data, exception];

  @doNotStore
  QueryState copyWith({
    List<QueryModel>? newData,
    Exception? newException,
  }) =>
      QueryState(
        data: newData ?? data,
        exception: newException,
      );
}
