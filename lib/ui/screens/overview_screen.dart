import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_adventure/bloc/user/user_bloc.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/theme/colors.dart';
import 'package:tech_adventure/ui/widgets/coffee_bean.dart';
import 'package:tech_adventure/ui/widgets/overview/user_information_card.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        RefreshIndicator(
          displacement: 1,
          triggerMode: RefreshIndicatorTriggerMode.anywhere,
          onRefresh: () async => BlocProvider.of<UserBloc>(context).add(UserRequested()),
          child: const SingleChildScrollView(
            clipBehavior: Clip.none,
            physics: AlwaysScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(15.0),
              child: UserInformationCard(),
            ),
          ),
        ),
      ],
    );
  }
}
