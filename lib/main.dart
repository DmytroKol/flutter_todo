import 'package:flutter/material.dart';
import 'package:flutter_todo/pages/home.dart';
import 'package:flutter_todo/pages/main_screen.dart';
import 'package:flutter_todo/pages/settings.dart';

// import 'package:firebase_core/firebase_core.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  //
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.deepOrangeAccent,
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => const MainScreen(),
      '/todo': (context) => const Home(),
      '/settings': (context) => const Settings(),
    },
  ));
}





