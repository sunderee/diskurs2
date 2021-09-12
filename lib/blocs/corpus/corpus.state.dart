import 'package:diskursv2/blocs/bloc.exception.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@sealed
abstract class CorpusState extends Equatable {
  const CorpusState._();

  @protected
  const factory CorpusState.initial() = InitialState;

  @protected
  const factory CorpusState.loading() = LoadingState;

  @protected
  const factory CorpusState.success(List<String> data) = SuccessfulState;

  @protected
  const factory CorpusState.failure(BlocException exception) = FailedState;
}

class InitialState extends CorpusState {
  const InitialState() : super._();

  @override
  List<Object?> get props => [];
}

class LoadingState extends CorpusState {
  const LoadingState() : super._();

  @override
  List<Object?> get props => [];
}

class SuccessfulState extends CorpusState {
  final List<String> corpusData;

  const SuccessfulState(this.corpusData) : super._();

  @override
  List<Object?> get props => [corpusData];
}

class FailedState extends CorpusState {
  final BlocException exception;

  const FailedState(this.exception) : super._();

  @override
  List<Object?> get props => [exception];
}
