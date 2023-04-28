// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `email`
  String get loginEmailHint {
    return Intl.message(
      'email',
      name: 'loginEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get loginPasswordHint {
    return Intl.message(
      'password',
      name: 'loginPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `login`
  String get loginButton {
    return Intl.message(
      'login',
      name: 'loginButton',
      desc: '',
      args: [],
    );
  }

  /// `go to register`
  String get loginGoToRegister {
    return Intl.message(
      'go to register',
      name: 'loginGoToRegister',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get loginTitle {
    return Intl.message(
      'Login',
      name: 'loginTitle',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get registerTitle {
    return Intl.message(
      'Register',
      name: 'registerTitle',
      desc: '',
      args: [],
    );
  }

  /// `email`
  String get registerEmailHint {
    return Intl.message(
      'email',
      name: 'registerEmailHint',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get registerPasswordHint {
    return Intl.message(
      'password',
      name: 'registerPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `repeat password`
  String get registerRepeatPasswordHint {
    return Intl.message(
      'repeat password',
      name: 'registerRepeatPasswordHint',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get registerCreateAccountButton {
    return Intl.message(
      'Create Account',
      name: 'registerCreateAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `go to login`
  String get registerGoToLogin {
    return Intl.message(
      'go to login',
      name: 'registerGoToLogin',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get navbarHome {
    return Intl.message(
      'Home',
      name: 'navbarHome',
      desc: '',
      args: [],
    );
  }

  /// `Scan`
  String get navbarScan {
    return Intl.message(
      'Scan',
      name: 'navbarScan',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get navbarProfile {
    return Intl.message(
      'Profile',
      name: 'navbarProfile',
      desc: '',
      args: [],
    );
  }

  /// `Welcome`
  String get overviewWelcomeMessage {
    return Intl.message(
      'Welcome',
      name: 'overviewWelcomeMessage',
      desc: '',
      args: [],
    );
  }

  /// `Points`
  String get overviewPoints {
    return Intl.message(
      'Points',
      name: 'overviewPoints',
      desc: '',
      args: [],
    );
  }

  /// `My Places`
  String get overviewPlacesTitle {
    return Intl.message(
      'My Places',
      name: 'overviewPlacesTitle',
      desc: '',
      args: [],
    );
  }

  /// `My Profile`
  String get profileTitle {
    return Intl.message(
      'My Profile',
      name: 'profileTitle',
      desc: '',
      args: [],
    );
  }

  /// `GAME OVER`
  String get gameOverOverviewTitle {
    return Intl.message(
      'GAME OVER',
      name: 'gameOverOverviewTitle',
      desc: '',
      args: [],
    );
  }

  /// `You scored {score} points!\nYour current high score is {highScore}`
  String gameOverOverviewMessage(int score, int highScore) {
    return Intl.message(
      'You scored $score points!\nYour current high score is $highScore',
      name: 'gameOverOverviewMessage',
      desc: 'displays score on game over page',
      args: [score, highScore],
    );
  }

  /// `Hi There,`
  String get hiThere {
    return Intl.message(
      'Hi There,',
      name: 'hiThere',
      desc: '',
      args: [],
    );
  }

  /// `This is japomo`
  String get thisIs {
    return Intl.message(
      'This is japomo',
      name: 'thisIs',
      desc: '',
      args: [],
    );
  }

  /// `Jambit meets Pokemeon Go`
  String get jambitMeets {
    return Intl.message(
      'Jambit meets Pokemeon Go',
      name: 'jambitMeets',
      desc: '',
      args: [],
    );
  }

  /// `meets Monopoly`
  String get meets {
    return Intl.message(
      'meets Monopoly',
      name: 'meets',
      desc: '',
      args: [],
    );
  }

  /// `You've discovered a new place!`
  String get discoveredNewPlaceTitle {
    return Intl.message(
      'You\'ve discovered a new place!',
      name: 'discoveredNewPlaceTitle',
      desc: '',
      args: [],
    );
  }

  /// `No place information was provided`
  String get noPlaceInformationWereProvided {
    return Intl.message(
      'No place information was provided',
      name: 'noPlaceInformationWereProvided',
      desc: '',
      args: [],
    );
  }

  /// `High Score`
  String get highScore {
    return Intl.message(
      'High Score',
      name: 'highScore',
      desc: '',
      args: [],
    );
  }

  /// `Street Name`
  String get streetName {
    return Intl.message(
      'Street Name',
      name: 'streetName',
      desc: '',
      args: [],
    );
  }

  /// `Owner`
  String get ownedBy {
    return Intl.message(
      'Owner',
      name: 'ownedBy',
      desc: '',
      args: [],
    );
  }

  /// `Game`
  String get game {
    return Intl.message(
      'Game',
      name: 'game',
      desc: '',
      args: [],
    );
  }

  /// `Challenge`
  String get play {
    return Intl.message(
      'Challenge',
      name: 'play',
      desc: '',
      args: [],
    );
  }

  /// `Jambit game`
  String get JaPoMo {
    return Intl.message(
      'Jambit game',
      name: 'JaPoMo',
      desc: '',
      args: [],
    );
  }

  /// `Practice`
  String get practiceIconLabel {
    return Intl.message(
      'Practice',
      name: 'practiceIconLabel',
      desc: '',
      args: [],
    );
  }

  /// `Rent`
  String get rent {
    return Intl.message(
      'Rent',
      name: 'rent',
      desc: '',
      args: [],
    );
  }

  /// `Score`
  String get score {
    return Intl.message(
      'Score',
      name: 'score',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'de'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
