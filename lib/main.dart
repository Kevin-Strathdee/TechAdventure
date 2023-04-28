import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_adventure/bloc/place/place_bloc.dart';
import 'package:tech_adventure/bloc/scan/scan_bloc.dart';
import 'package:tech_adventure/data/api/backend.dart';
import 'package:tech_adventure/data/credentials_util.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/theme/colors.dart';
import 'package:tech_adventure/ui/screens/home_page.dart';
import 'package:tech_adventure/ui/screens/welcome_screen.dart';

import 'bloc/user/user_bloc.dart';

const accessTokenKey = "accessToken";
const refreshTokenKey = "refreshTokenKey";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final CredentialUtil credentialUtil = CredentialUtil();
  await credentialUtil.init();
  String? accessToken = prefs.getString(accessTokenKey);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp(
    accessToken: accessToken,
    credentialUtil: credentialUtil,
  ));
}

class MyApp extends StatelessWidget {
  String? accessToken;
  final CredentialUtil credentialUtil;

  MyApp({super.key, this.accessToken, required this.credentialUtil});

  @override
  Widget build(BuildContext context) {
    final IBackend backend = Backend(credentialUtil);
    final UserBloc userBloc = UserBloc(backend);
    if (accessToken != null && accessToken != '') {
      userBloc.add(UserRequested());
    }

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => userBloc,
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
        home: (accessToken == null || accessToken == "") ? WelcomeScreen(credentialUtil) : HomePage(),
      ),
    );
  }
}
