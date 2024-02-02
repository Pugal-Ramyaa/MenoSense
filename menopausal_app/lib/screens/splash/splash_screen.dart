import 'package:flutter/material.dart';
import 'package:menopausal_app/screens/splash/Components/body.dart';
import 'package:menopausal_app/size_config.dart';

class SplashScreen extends StatelessWidget{
  SplashScreen({super.key});
  static String routeName="/spllash";
  @override
  Widget build(BuildContext context){
    SizeConfig.init(context);
    return Scaffold(
      body: Body(),
    );
  } 
}