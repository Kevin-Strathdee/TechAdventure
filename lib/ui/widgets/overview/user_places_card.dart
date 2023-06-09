import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japomo/bloc/user/user_bloc.dart';
import 'package:japomo/generated/l10n.dart';
import 'package:japomo/ui/widgets/overview/place_tile.dart';

class UserPlacesCard extends StatelessWidget {
  const UserPlacesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          constraints: BoxConstraints(minHeight: 300, minWidth: double.infinity),
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              if (state is UserLoadSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).overviewPlacesTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (state.user.places.isEmpty)
                      Text(
                        "You don't have any places yet!",
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),
                    ...state.user.places.map((place) => PlaceTile(place: place)),
                  ],
                );
              } else {}
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300.withOpacity(.3)),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300.withOpacity(.3)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300.withOpacity(.3)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300.withOpacity(.3)),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Container(
                    height: 40,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300.withOpacity(.3)),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
