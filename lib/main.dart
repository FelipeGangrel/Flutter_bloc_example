import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<ThemeBloc>(
      builder: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeData>(
        builder: (context, theme) {
          return MaterialApp(
            title: 'Flutter BLoC Example',
            home: BlocProvider(
              builder: (context) => CounterBloc(),
              child: CounterPage(),
            ),
            theme: theme,
          );
        },
      ),
    );
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter')),
      body: BlocBuilder<CounterBloc, int>(builder: (context, count) {
        return Center(
          child: Text(
            '$count',
            style: TextStyle(fontSize: 24.0),
          ),
        );
      }),
      floatingActionButton: CounterPageButtons(),
    );
  }
}

class CounterPageButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final counterBloc = BlocProvider.of<CounterBloc>(context);
    final themeBloc = BlocProvider.of<ThemeBloc>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              counterBloc.dispatch(CounterEvent.increment);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: Icon(Icons.remove),
            onPressed: () {
              counterBloc.dispatch(CounterEvent.decrement);
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5.0),
          child: FloatingActionButton(
            child: Icon(Icons.update),
            onPressed: () {
              themeBloc.dispatch(ThemeEvent.toggle);
            },
          ),
        ),
      ],
    );
  }
}
