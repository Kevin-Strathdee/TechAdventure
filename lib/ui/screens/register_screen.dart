import 'package:flutter/material.dart';
import 'package:tech_adventure/generated/l10n.dart';
import 'package:tech_adventure/ui/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).registerTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(hintText: S.of(context).registerEmailHint),
            ),
            TextField(
              decoration: InputDecoration(hintText: S.of(context).registerPasswordHint),
            ),
            TextField(
              decoration: InputDecoration(hintText: S.of(context).registerRepeatPasswordHint),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () => print("Create Account"), child: Text(S.of(context).registerCreateAccountButton)),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                },
                child: Text(S.of(context).registerGoToLogin))
          ],
        ),
      ),
    );
  }
}
