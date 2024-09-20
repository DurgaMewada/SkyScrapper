import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4),(){
      Navigator.of(context).pushReplacementNamed('/home');
    });
    return Scaffold(
      backgroundColor: Color(0xffFBFBFB),
      body: Center(
        child: Image.network('https://cdn.dribbble.com/users/1597633/screenshots/3945728/apple-weather.gif'),
      ),
    );
  }
}