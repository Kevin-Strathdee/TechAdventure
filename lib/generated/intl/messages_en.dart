// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(score, highScore) =>
      "You scored ${score} points!\nYour current high score is ${highScore}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "JaPoMo": MessageLookupByLibrary.simpleMessage("jambit game"),
        "discoveredNewPlaceTitle": MessageLookupByLibrary.simpleMessage(
            "You\'ve discovered a new place!"),
        "game": MessageLookupByLibrary.simpleMessage("Game"),
        "gameOverOverviewMessage": m0,
        "gameOverOverviewTitle":
            MessageLookupByLibrary.simpleMessage("GAME OVER"),
        "hiThere": MessageLookupByLibrary.simpleMessage("Hi There,"),
        "highScore": MessageLookupByLibrary.simpleMessage("High Score"),
        "jambitMeets":
            MessageLookupByLibrary.simpleMessage("jambit meets Pokemon Go"),
        "loginButton": MessageLookupByLibrary.simpleMessage("login"),
        "loginEmailHint": MessageLookupByLibrary.simpleMessage("email"),
        "loginGoToRegister":
            MessageLookupByLibrary.simpleMessage("go to register"),
        "loginPasswordHint": MessageLookupByLibrary.simpleMessage("password"),
        "loginTitle": MessageLookupByLibrary.simpleMessage("Login"),
        "meets": MessageLookupByLibrary.simpleMessage("meets Monopoly"),
        "miniGame": MessageLookupByLibrary.simpleMessage("Minigame: "),
        "navbarHome": MessageLookupByLibrary.simpleMessage("Home"),
        "navbarProfile": MessageLookupByLibrary.simpleMessage("Profile"),
        "navbarScan": MessageLookupByLibrary.simpleMessage("Scan"),
        "noPlaceInformationWereProvided": MessageLookupByLibrary.simpleMessage(
            "No place information was provided"),
        "overviewPlacesTitle":
            MessageLookupByLibrary.simpleMessage("My Places"),
        "overviewPoints": MessageLookupByLibrary.simpleMessage("jambeans"),
        "overviewWelcomeMessage":
            MessageLookupByLibrary.simpleMessage("Welcome"),
        "ownedBy": MessageLookupByLibrary.simpleMessage("Owner"),
        "play": MessageLookupByLibrary.simpleMessage("Challenge"),
        "practiceIconLabel": MessageLookupByLibrary.simpleMessage("Practice"),
        "profileTitle": MessageLookupByLibrary.simpleMessage("My Profile"),
        "rank": MessageLookupByLibrary.simpleMessage("Rank"),
        "registerCreateAccountButton":
            MessageLookupByLibrary.simpleMessage("Create Account"),
        "registerEmailHint": MessageLookupByLibrary.simpleMessage("email"),
        "registerGoToLogin":
            MessageLookupByLibrary.simpleMessage("go to login"),
        "registerPasswordHint":
            MessageLookupByLibrary.simpleMessage("password"),
        "registerRepeatPasswordHint":
            MessageLookupByLibrary.simpleMessage("repeat password"),
        "registerTitle": MessageLookupByLibrary.simpleMessage("Register"),
        "rent": MessageLookupByLibrary.simpleMessage("Rent"),
        "score": MessageLookupByLibrary.simpleMessage("Score"),
        "streetName": MessageLookupByLibrary.simpleMessage("Street Name"),
        "thisIs": MessageLookupByLibrary.simpleMessage("This is japomo")
      };
}
