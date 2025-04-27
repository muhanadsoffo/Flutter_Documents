import 'package:flutter/material.dart';
import 'package:flutters/data/notifiers.dart';
import 'package:flutters/views/pages/welcome_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(20.0),
    child: Column(children: [
      ListTile(title: Text("log out"),
        onTap: () {
        selectedPageNotifier.value=0;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WelcomePage();
          },
        ),
      );
    },)
    ],
    ),
    );
  }
}