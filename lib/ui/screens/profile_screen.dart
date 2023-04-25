import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/user/user_bloc.dart';
import '../widgets/coffee_bean.dart';

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
                if (state is UserLoadFailure) {
                  return Text("Could not load user info");
                }
                return Container(
                    padding: const EdgeInsets.all(30),
                    child: Text(
                      (state is UserLoadSuccess && state.user.score > 0)
                          ? 'Hi ${state.user.firstName}. \n You have ${state.user.score} coffee beans.'
                          : "You haven't collected any coffee beans yet. Scan a code to play!",
                      textAlign: TextAlign.center,
                    ));
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(right: 10),
                  child: CoffeeBean(),
                ),
                BlocBuilder<UserBloc, UserState>(
                  builder: (context, state) {
                    if (state is UserLoadSuccess) {
                      return Text(
                        '${state.user.score}',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    } else {
                      return Text(
                        '0',
                        style: Theme.of(context).textTheme.headlineMedium,
                      );
                    }
                  },
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () => BlocProvider.of<UserBloc>(context)
                    .add(UserRequested()),
                child: const Text("Get user information"))
          ],
        ),
      ),
    );
  }
}
