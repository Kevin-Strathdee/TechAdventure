import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user/user_bloc.dart';
import '../widgets/coffee_bean_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profile")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                return Container(
                  padding: const EdgeInsets.all(30),
                  child: Text(
                    (state.numCoffeeBeans > 0)
                        ? 'You have ${state.numCoffeeBeans} coffee beans.'
                        : "You haven't collected any coffee beans yet. Scan a code to play!",
                    textAlign: TextAlign.center,
                  )
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: svgCoffeeBean,
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    return Text(
                      '${state.numCoffeeBeans}',
                      style: Theme.of(context).textTheme.headlineMedium,
                    );
                  },
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () => BlocProvider.of<UserBloc>(context).add(CoffeeBeansIncremented(5)),
                child: const Text("Increment")),
            ElevatedButton(
                onPressed: () => BlocProvider.of<UserBloc>(context).add(CoffeeBeansIncremented(-5)),
                child: const Text("Decrement"))
          ],
        ),
      ),
    );
  }
}
