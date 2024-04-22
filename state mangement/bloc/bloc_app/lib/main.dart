import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  Bloc.observer = const CustomObserver();
  runApp(const CustomApp());
}

class CustomCubit extends Cubit<int> {
  CustomCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

class CustomPage extends StatelessWidget {
  const CustomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CustomCubit(),
      child: const CustomView(),
    );
  }
}

class CustomView extends StatelessWidget {
  const CustomView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      body: Center(
        child: BlocBuilder<CustomCubit, int>(
          builder: (context, state) {
            return Text('$state', style: textTheme.headline4);
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            key: const Key('customView_increment_floatingActionButton'),
            child: const Icon(Icons.add),
            onPressed: () => context.read<CustomCubit>().increment(),
          ),
          const SizedBox(height: 8),
          FloatingActionButton(
            key: const Key('customView_decrement_floatingActionButton'),
            child: const Icon(Icons.remove),
            onPressed: () => context.read<CustomCubit>().decrement(),
          ),
        ],
      ),
    );
  }
}

class CustomApp extends MaterialApp {
  const CustomApp({Key? key}) : super(home: const CustomPage());
}

class CustomObserver extends BlocObserver {
  const CustomObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    // ignore: avoid_print
    print('${bloc.runtimeType} $change');
  }
}