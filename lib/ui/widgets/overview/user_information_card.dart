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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).overviewWelcomeMessage,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        state.user.name,
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            height: 80,
                            width: 80,
                            decoration: const BoxDecoration(
                                color: jambitOrange, shape: BoxShape.circle),
                            child: const Padding(
                              padding: EdgeInsets.all(13.0),
                              child: CoffeeBean(),
                            )),
                        Text(
                            "${state.user.score} ${S.of(context).overviewPoints}",
                            style: Theme.of(context).textTheme.headlineLarge)
                      ],
                    ),
                  ],
                ),
              );
            } else {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 300,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.grey.shade300.withOpacity(.3)),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                height: 80,
                                width: 80,
                                decoration: const BoxDecoration(
                                    color: jambitOrange,
                                    shape: BoxShape.circle),
                                child: const Padding(
                                  padding: EdgeInsets.all(13.0),
                                  child: CoffeeBean(),
                                )),
                            Container(
                              height: 70,
                              width: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.grey.shade300.withOpacity(.3)),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (state is UserLoadInProgress)
                    const Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
