import 'package:flutter/material.dart';
import 'components/body.dart';


class SignInScreen extends StatelessWidget{
  static String routeName="/sign_in";
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In",
        style: TextStyle(color: Color(0xFF888888), fontSize: 18)),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}