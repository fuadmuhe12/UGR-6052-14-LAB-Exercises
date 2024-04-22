import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
void main() {
  Bloc.observer = const CounterObserver();
  runApp(const CounterApp());
}

class Countcu extends Cubit<int> {
  Countcu() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}


class Countlook extends StatelessWidget {
  const Countlook({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Countcu(),
      child: const Counterlook(),
    );
  }
}


class Counterlook extends StatelessWidget {
  const Counterlook({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: BlocBuilder<Countcu, int>(
          builder: (context, state) {
            return Text('$state', style: textTheme.displayMedium);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('Counterlook_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<Countcu>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('Counterlook_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<Countcu>().decrement(),
          ),
        ],
      ),
    );
  }
}


class CounterApp extends MaterialApp {
  const CounterApp({super.key}) : super(home: const Countlook());
}


class CounterObserver extends BlocObserver {
  const CounterObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
  }
}