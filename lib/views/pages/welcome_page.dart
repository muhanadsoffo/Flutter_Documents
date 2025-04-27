import 'package:flutter/material.dart';
import 'package:flutters/views/pages/login_page.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            Lottie.asset('assets/lotties/home.json'),
        FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return LoginPage();
                },
              ),
            );
          },
          style: FilledButton.styleFrom(backgroundColor: Colors.amber,
              minimumSize: Size(double.infinity, 48)
          ),
          child: Text("login"),
        ),

        ],
      ),
    ),);
  }
}
