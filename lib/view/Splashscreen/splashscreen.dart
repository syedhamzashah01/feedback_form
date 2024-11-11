import 'dart:async';

import 'package:feedback_form/view/screens/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState(){
    super.initState();
    Timer(Duration(seconds: 5), ()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child: Image.asset('assets/as.png')),
    );
  }
}
