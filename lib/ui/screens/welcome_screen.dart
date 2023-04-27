import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
// import the io version
import 'package:openid_client/openid_client_io.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/main.dart';
import 'package:tech_adventure/theme/colors.dart';
import 'package:tech_adventure/ui/delayed_animation.dart';
import 'package:tech_adventure/ui/screens/home_page.dart';
// use url launcher package
import 'package:url_launcher/url_launcher.dart';

const appScheme = 'flutterdemo';
const authenticateUrl =
    "https://login.microsoftonline.com/e6dbe219-77ef-4b6a-af83-f9de7de08923/v2.0";
const clientId = "85e3244b-298a-4ddd-82c5-9ed85a69ce5e";
const scope = ["email", "offline_access", "openid", "profile"];

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

  void _onTapUp(TapUpDetails details) async {
    _controller.reverse();
    Credential credential =
        await authenticate(Uri.parse(authenticateUrl), clientId, scope);
    TokenResponse tokenResponse = await credential.getTokenResponse();
    if (tokenResponse.accessToken != null && tokenResponse.accessToken != "") {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString(accessTokenKey, tokenResponse.accessToken!);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
    }
  }

  Future<Credential> authenticate(
      Uri uri, String clientId, List<String> scopes) async {
    // create the client
    var issuer = await Issuer.discover(uri);
    var client = Client(issuer, clientId);

    // create a function to open a browser with an url
    urlLauncher(String url) async {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    }

    // create an authenticator
    var authenticator = Authenticator(client,
        scopes: scopes, port: 4000, urlLancher: urlLauncher);

    // starts the authentication
    var c = await authenticator.authorize();

    // close the webview when finished
    closeInAppWebView();

    // return the user info
    return c;
  }
}
