import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:japomo/bloc/place/place_bloc.dart';
import 'package:japomo/bloc/scan/scan_bloc.dart';
import 'package:japomo/data/api/backend.dart';
import 'package:japomo/data/credentials_util.dart';
import 'package:japomo/generated/l10n.dart';
import 'package:japomo/theme/colors.dart';
import 'package:japomo/ui/screens/home_page.dart';
import 'package:japomo/ui/screens/welcome_screen.dart';

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
        title: 'japomo',
        theme: ThemeData(
          primarySwatch: getMaterialColor(jambitOrange),
          fontFamily: 'Jost'
        ),
        home: (accessToken == null || accessToken == "") ? WelcomeScreen(credentialUtil) : HomePage(),
      ),
    );
  }
}
