import 'dart:js';

import 'package:flutter/widgets.dart';
import 'package:menopausal_app/screens/Calender/Calender.dart';
import 'package:menopausal_app/screens/Height_weight/Height_weight.dart';
import 'package:menopausal_app/screens/Home/Home.dart';
import 'package:menopausal_app/screens/MedicalHistory/MedicalHistory.dart';
import 'package:menopausal_app/screens/MenstrualPeriod/MenstrualPeriod.dart';
import 'package:menopausal_app/screens/Thyroid/Thyroid.dart';
import 'package:menopausal_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:menopausal_app/screens/sign_in/sign_in_screen.dart';
import 'package:menopausal_app/screens/sign_up/sign_up_screen.dart';
import 'package:menopausal_app/screens/splash/splash_screen.dart';
import 'package:menopausal_app/screens/birthday/birthday.dart';
import 'package:menopausal_app/screens/stage/stage.dart';
import 'package:menopausal_app/screens/Period_date/period_date.dart';


final Map<String , WidgetBuilder> routes = {
  SplashScreen.routeName: (context)=> SplashScreen(),
  SignInScreen.routeName: (context)=> SignInScreen(),
  ForgotPasswordScreen.routeName: (context) => ForgotPasswordScreen(),
  SignUpScreen.routeName: (context) => SignUpScreen(),
  Birthday.routeName: (context) => Birthday(),
  Height_weight.routeName: (context) => Height_weight(),
  Stages.routeName: (context) => Stages(),
  period_date.routeName: (context) => period_date(),
  MedicalHistory.routeName: (context) => MedicalHistory(),
  Thyroid.routeName: (context) => Thyroid(),
  MenstrualPeriod.routeName: (context) => MenstrualPeriod(),
  Home.routeName: (context) => Home(),
  Calender.routeName:(context) => Calender(),
};
