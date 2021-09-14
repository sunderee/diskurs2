import 'package:diskursv2/api/models/query.model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
class QueryState extends Equatable {
  final List<QueryModel> data;
  final Exception? exception;
  final bool isLoading;

  const QueryState({
    this.data = const <QueryModel>[],
    this.exception,
    this.isLoading = false,
  });

  @override
  List<Object?> get props => [data, exception, isLoading];

  @doNotStore
  QueryState copyWith({
    List<QueryModel>? newData,
    Exception? newException,
    bool? newIsLoading,
  }) =>
      QueryState(
        data: newData ?? data,
        exception: newException,
        isLoading: newIsLoading ?? isLoading,
      );
}
