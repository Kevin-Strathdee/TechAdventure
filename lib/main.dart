import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_adventure/bloc/place/place_bloc.dart';
import 'package:tech_adventure/bloc/scan/scan_bloc.dart';
import 'package:tech_adventure/data/api/backend.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/theme/colors.dart';
import 'package:tech_adventure/ui/screens/home_page.dart';
import 'package:tech_adventure/ui/screens/welcome_screen.dart';

import 'bloc/user/user_bloc.dart';

const accessTokenKey = "accessToken";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? accessToken = prefs.getString(accessTokenKey);
  runApp(MyApp(accessToken: accessToken));
}

class MyApp extends StatelessWidget {
  String? accessToken;

  MyApp({super.key, this.accessToken});

  @override
  Widget build(BuildContext context) {
    final IBackend backend = Backend();
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => ScanBloc(),
        ),
        BlocProvider(
          create: (context) => PlaceBloc(backend),
        )
      ],
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        title: 'jambit: Das Spiel',
        theme: ThemeData(
          primarySwatch: getMaterialColor(jambitOrange),
        ),
        home: (accessToken == null || accessToken == "") ? WelcomeScreen() : const HomePage(),
      ),
    );
  }
}
