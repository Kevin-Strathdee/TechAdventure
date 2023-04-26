import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_adventure/bloc/user/user_bloc.dart';
import 'package:tech_adventure/ui/widgets/overview/user_information_card.dart';
import 'package:tech_adventure/ui/widgets/overview/user_places_card.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 1,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async => BlocProvider.of<UserBloc>(context).add(UserRequested()),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          clipBehavior: Clip.none,
          physics: const AlwaysScrollableScrollPhysics(),
          children: const [
            UserInformationCard(),
            SizedBox(
              height: 15,
            ),
            UserPlacesCard()
          ],
        ),
      ),
    );
  }
}
