import 'package:diskursv2/api/models/query.model.dart';
import 'package:diskursv2/blocs/bloc.exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@sealed
abstract class QueryState extends Equatable {
  const QueryState._();

  @protected
  const factory QueryState.initial() = InitialState;

  @protected
  const factory QueryState.loading() = LoadingState;

  @protected
  const factory QueryState.success(List<QueryModel> data) = SuccessfulState;

  @protected
  const factory QueryState.failure(BlocException exception) = FailedState;
}

class InitialState extends QueryState {
  const InitialState() : super._();

  @override
  List<Object?> get props => [];
}

class LoadingState extends QueryState {
  const LoadingState() : super._();

  @override
  List<Object?> get props => [];
}

class SuccessfulState extends QueryState {
  final List<QueryModel> queryData;

  const SuccessfulState(this.queryData) : super._();

  @override
  List<Object?> get props => [queryData];
}

class FailedState extends QueryState {
  final BlocException exception;

  const FailedState(this.exception) : super._();

  @override
  List<Object?> get props => [exception];
}
