import 'package:feedback_form/view/Splashscreen/splashscreen.dart';
import 'package:feedback_form/view/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}