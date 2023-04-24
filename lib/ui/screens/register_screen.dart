import 'package:flutter/material.dart';
import 'package:tech_adventure/ui/screens/login_screen.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const TextField(
              decoration: InputDecoration(hintText: "email"),
            ),
            const TextField(
              decoration: InputDecoration(hintText: "password"),
            ),
            const TextField(
              decoration: InputDecoration(hintText: "repeat password"),
            ),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(onPressed: () => print("Create Account"), child: const Text("login")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => const LoginScreen()), (route) => false);
                },
                child: const Text("go to login"))
          ],
        ),
      ),
    );
  }
}
