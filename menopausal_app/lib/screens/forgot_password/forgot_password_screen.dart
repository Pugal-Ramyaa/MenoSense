import "package:flutter/material.dart";
import 'Components/body.dart';
class ForgotPasswordScreen extends StatelessWidget {
  static String routeName = "/forgot_password";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forgot Password",
        style: TextStyle(color: Color(0xFF888888), fontSize: 18)),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}