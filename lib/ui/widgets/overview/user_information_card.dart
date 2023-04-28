import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japomo/bloc/user/user_bloc.dart';
import 'package:japomo/generated/l10n.dart';
import 'package:japomo/theme/colors.dart';
import 'package:japomo/ui/widgets/coffee_bean.dart';

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
                        Text(
                          "${S.of(context).rank}: ",
                          style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w500),
                        ),
                        Text(
                            "${state.user.rank}",
                            style: Theme.of(context).textTheme.headlineMedium
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 48,
                                width: 48,
                                decoration: BoxDecoration(border: Border.all(color: jambitOrange, width: 4), borderRadius: BorderRadius.circular(48)),
                                child: const Padding(
                                  padding: EdgeInsets.all(5),
                                  child: CoffeeBean(size: Size.square(30)),
                                )
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 12),
                              child: Row(
                                children: [
                                  Text(
                                      'jam',
                                      style: Theme.of(context).textTheme.headlineSmall
                                  ),
                                  Text(
                                      'beans',
                                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: jambitOrange)
                                  ),
                               ]
                              ),
                            ),
                          ]
                        ),
                        Text("${state.user.score}",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                      ],
                    )
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
