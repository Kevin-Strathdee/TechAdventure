import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_adventure/bloc/counter/counter_bloc.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/ui/screens/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
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
          primarySwatch: Colors.orange,
        ),
        home: const LoginScreen(),
      ),
    );
  }
}
