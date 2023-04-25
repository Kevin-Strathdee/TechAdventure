import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_adventure/bloc/user/user_bloc.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/theme/colors.dart';
import 'package:tech_adventure/ui/widgets/coffee_bean.dart';

class UserInformationCard extends StatelessWidget {
  const UserInformationCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        constraints: const BoxConstraints(minHeight: 200),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            if (state is UserLoadSuccess) {
              return Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      S.of(context).overviewWelcomeMessage(state.user.firstName),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(color: jambitOrange, shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(13.0),
                              child: CoffeeBean(),
                            )),
                        Text(S.of(context).overviewPoints(state.user.score),
                            style: Theme.of(context).textTheme.headlineLarge)
                      ],
                    ),
                  ],
                ),
              );
            } else if (state is UserLoadInProgress) {
              return const Center(child: CircularProgressIndicator());
            } else
              return Container();
          },
        ),
      ),
    );
  }
}
