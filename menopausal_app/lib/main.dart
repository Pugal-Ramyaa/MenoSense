import 'package:flutter/material.dart';
import 'package:menopausal_app/constants.dart';
import 'package:menopausal_app/routs.dart';
import 'package:menopausal_app/screens/splash/splash_screen.dart';
import 'package:menopausal_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MenoSense',
      theme: theme(),
      // home: SplashScreen(),
      initialRoute:SplashScreen.routeName ,
      routes: routes,
    );
  }
}


