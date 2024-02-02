import "package:flutter/material.dart";
import 'Components/body.dart';
class Height_weight extends StatelessWidget {
  static String routeName = "/height_weight";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Image.asset(
            "Assets/Images/smalllogo.png",
            height: 80, // Adjust the height as needed
          ),
        ),
      ),
      body: Body(),
    );
  }
}