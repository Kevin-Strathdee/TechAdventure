import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/theme/colors.dart';
import 'package:tech_adventure/ui/delayed_animation.dart';
import 'package:tech_adventure/ui/screens/home_page.dart';

import '../../bloc/user/user_bloc.dart';
import '../../main.dart';

const appScheme = 'flutterdemo';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const color = Colors.white;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: jambitOrange,
          body: Center(
            child: Column(
              children: <Widget>[
                const SizedBox(
                  height: 50.0,
                ),
                AvatarGlow(
                  endRadius: 90,
                  duration: Duration(seconds: 2),
                  glowColor: Colors.white24,
                  repeat: true,
                  repeatPauseDuration: const Duration(seconds: 2),
                  startDelay: Duration(seconds: 1),
                  child: Material(
                      elevation: 8.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[100],
                        child: Image(image: AssetImage('assets/logo.png')),
                        radius: 50.0,
                      )),
                ),
                DelayedAnimation(
                  delay: delayedAmount + 1000,
                  child: Text(
                    S.of(context).hiThere,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                ),
                DelayedAnimation(
                  delay: delayedAmount + 2000,
                  child: Text(
                    S.of(context).thisIs,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35.0,
                        color: color),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                DelayedAnimation(
                  delay: delayedAmount + 3000,
                  child: Align(
                      child: Text(
                    S.of(context).jambitMeets,
                    style: const TextStyle(fontSize: 20.0, color: color),
                  )),
                ),
                DelayedAnimation(
                  delay: delayedAmount + 3000,
                  child: Text(
                    S.of(context).meets,
                    style: const TextStyle(fontSize: 20.0, color: color),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                DelayedAnimation(
                  delay: delayedAmount + 4000,
                  child: GestureDetector(
                    onTapDown: _onTapDown,
                    onTapUp: _onTapUp,
                    child: Transform.scale(
                      scale: _scale,
                      child: _animatedButtonUI,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
              ],
            ),
          )),
    );
  }

  Widget get _animatedButtonUI => Container(
        height: 60,
        width: 270,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100.0),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            S.of(context).loginTitle,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Color(0xFF8185E2),
            ),
          ),
        ),
      );

  void _onTapDown(TapDownDetails details) {
    _controller.forward();
  }

  Auth0 auth0 = Auth0('{domain}', '{clientId}');

  void _onTapUp(TapUpDetails details) async {
    _controller.reverse();
    //TODO add openid connect authentication flow
    final Credentials credentials =
        await auth0.webAuthentication(scheme: appScheme).login();
    BlocProvider.of<UserBloc>(context).add(UserRequested(credentials.idToken));
    if (credentials.accessToken != null) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(accessTokenKey, credentials.accessToken);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      //TODO handle case if no token could be fetched/login failed. Show toast?
    }
  }
}
