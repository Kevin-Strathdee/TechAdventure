import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/ui/screens/home_page.dart';
import 'package:tech_adventure/ui/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).loginTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: S.of(context).loginEmailHint),
            ),
            TextField(
              decoration: InputDecoration(hintText: S.of(context).loginPasswordHint),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(title: 'jambit Pokemopoly')));
                },
                child: Text(S.of(context).loginButton)),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterScreen()));
                },
                child: Text(S.of(context).loginGoToRegister))
          ],
        ),
      ),
    );
  }
}
