import 'package:flutter/material.dart';
import 'package:flutters/data/constants.dart';
import 'package:flutters/data/notifiers.dart';
import 'package:flutters/views/pages/home_page.dart';
import 'package:flutters/views/pages/profile_page.dart';
import 'package:flutters/views/pages/settings_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../views/Widgets/navbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("my app"),
        centerTitle: true,

        actions: [
          IconButton(
            onPressed: () async {
              darkModeNotifier.value = !darkModeNotifier.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstants.themeModeKey,
                darkModeNotifier.value,
              );
            },
            icon: ValueListenableBuilder(
              valueListenable: darkModeNotifier,
              builder: (context, darkMode, child) {
                return Icon(darkMode ? Icons.light_mode : Icons.dark_mode);
              },
            ),
          ),

          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingsPage(title: "Settings");
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
        backgroundColor: Colors.green,
      ),
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(child: Text("TEXTING")),
            ListTile(title: Text("login"), leading: Icon(Icons.login)),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              print("it's working");
            },
            child: Icon(Icons.add_a_photo),
          ),
          SizedBox(height: 10.5),
          FloatingActionButton(
            onPressed: () {
              print("it's working");
            },
            child: Icon(Icons.person_search_rounded),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return pages.elementAt(value);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
