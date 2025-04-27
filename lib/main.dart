import 'package:flutter/material.dart';
import 'package:flutters/data/constants.dart';
import 'package:flutters/data/notifiers.dart';
import 'package:flutters/views/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() {
  runApp(const MyApp());
}

 class MyApp extends StatefulWidget {
   const MyApp({super.key});

   @override
   State<MyApp> createState() => _MyAppState();
 }

 class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initThemeMode();
    super.initState();
  }
  void initThemeMode() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? repeat = prefs.getBool(KConstants.themeModeKey);
    darkModeNotifier.value = repeat ?? false;

  }
   @override
   Widget build(BuildContext context) {
     return ValueListenableBuilder(valueListenable: darkModeNotifier, builder: (context, darkMode, child) {
      return MaterialApp(
         debugShowCheckedModeBanner: false,
         theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent,brightness:darkMode ? Brightness.dark : Brightness.light),),
         home: WelcomePage(),
       );
     },);
   }
 }





