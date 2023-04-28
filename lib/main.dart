import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:japomo/ui/screens/place_detail_screen.dart';
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

  final IBackend backend = Backend(credentialUtil);
  final UserBloc userBloc = UserBloc(backend);
  final PlaceBloc placeBloc = PlaceBloc(backend, userBloc);
  if (accessToken != null && accessToken != '') {
    userBloc.add(UserRequested());
  }
  final router = GoRouter(
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) {
            var token = prefs.getString(accessTokenKey);
            return (token == null || token == "") ? WelcomeScreen(credentialUtil) : const HomePage();
          }),
      GoRoute(
        path: '/places/:placeId',
        builder: (context, state) {
          var token = prefs.getString(accessTokenKey);
          if (token == null || token == "") {
            return WelcomeScreen(credentialUtil);
          } else {
            final placeId = state.params['placeId'];
            placeBloc.add(PlaceScanned(placeId!));
            return const PlaceDetailScreen();
          }
        },
      ),
    ],
  );

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => userBloc,
      ),
      BlocProvider(
        create: (context) => ScanBloc(),
      ),
      BlocProvider(
        create: (context) => placeBloc,
      )
    ],
    child: MyApp(router: router),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.router,
  });
  final GoRouter router;
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      title: 'japomo',
      theme: ThemeData(primarySwatch: getMaterialColor(jambitOrange), fontFamily: 'Jost'),
    );
  }
}
