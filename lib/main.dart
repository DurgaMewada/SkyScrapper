import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/View/home_screen.dart';

import 'Provider/weather_provider.dart';
import 'View/save_screen.dart';
import 'View/splash_screen.dart';

void main()
{
  runApp(MyApp(),);
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
   ChangeNotifierProvider(create: (context)=>WeatherProvider(),)
    ],
      builder: (context, child) { return  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context)=> SplashScreen(),
          '/home': (context)=> HomeScreen(),
          '/save': (context)=> SaveScreen(),

        },
      );
  },);
  }
}
