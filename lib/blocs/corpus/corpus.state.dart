import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

@immutable
class CorpusState extends Equatable {
  final List<String> data;
  final Exception? exception;

  const CorpusState({
    this.data = const <String>[],
    this.exception,
  });

  @doNotStore
  CorpusState copyWith({
    List<String>? newData,
    Exception? newException,
  }) =>
      CorpusState(
        data: newData ?? data,
        exception: newException,
      );

  @override
  List<Object?> get props => [data, exception];
}
