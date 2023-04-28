import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:japomo/bloc/user/user_bloc.dart';
import 'package:japomo/ui/widgets/appbar/app_logo.dart';
import 'package:japomo/ui/widgets/appbar/score_display.dart';

class OverviewAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OverviewAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const ContinuousRectangleBorder(),
      margin: const EdgeInsetsDirectional.all(0),
      child: SizedBox(
        height: preferredSize.height,
        width: preferredSize.width,
        child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const AppLogo(),
                SizedBox(
                    height: 40,
                    width: 40,
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserLoadSuccess) {
                          return ScoreDisplay(score: state.user.score);
                        } else {
                          return const ScoreDisplay(score: 0);
                        }
                      },
                    )),
              ],
            )),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100);
}
