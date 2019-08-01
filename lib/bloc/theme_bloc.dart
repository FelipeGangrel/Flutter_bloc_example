import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import './bloc.dart';

// BLoC para o tema
// ThemeEvent é o tipo de dado que entra pelo sink
// ThemeData é o tipo de dado que sai pela stream
class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  @override
  ThemeData get initialState => ThemeData.light();

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    switch (event) {
      case ThemeEvent.toggle:
        yield currentState == ThemeData.light()
            ? ThemeData.dark()
            : ThemeData.light();
        break;
    }
  }
}
