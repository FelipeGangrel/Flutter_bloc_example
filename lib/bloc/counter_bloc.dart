import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

// BLoC para o counter
// CounterEvent é o tipo de dado que pode entrar pelo sink
// int é o tipo de dado que pode sair da stream
class CounterBloc extends Bloc<CounterEvent, int> {
  @override
  int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield currentState + 1;
        break;
      case CounterEvent.decrement:
        yield currentState - 1;
        break;
    }
  }
}
