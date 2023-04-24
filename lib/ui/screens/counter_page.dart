import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_adventure/bloc/counter/counter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Counter"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  (state is CounterPositive) ? 'counter is positive' : 'counter is negative',
                );
              },
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return Text(
                  '${state.currentCount}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
            ElevatedButton(
                onPressed: () => BlocProvider.of<CounterBloc>(context).add(IncrementButtonTapped()),
                child: const Text("Increment")),
            ElevatedButton(
                onPressed: () => BlocProvider.of<CounterBloc>(context).add(DecrementButtonTapped()),
                child: const Text("Decrement"))
          ],
        ),
      ),
    );
  }
}
