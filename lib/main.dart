import 'package:diskursv2/api/repositories/query.repository.dart';
import 'package:diskursv2/ui/app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    App(
      queryRepository: QueryRepository(),
    ),
  );
}
