import 'package:flutter/material.dart';
const babyPink = Color.fromARGB(255, 249, 189, 207);
const kPrimaryColor = Color(0xFFff7fa6);
const kPrimaryLightColor = Color(0xFFffc293);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFF7F5F2),Color(0xFFE8CDCC)],
);
const kSecondaryColor = Color(0xFFffc293);
const kTextColor = Color(0xFF000000);

const kAnimationDuration = Duration(milliseconds: 200);

final RegExp emailValidatorRegExp = RegExp(r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+\.[a-zA-Z]");
final RegExp dateRegex = RegExp(r"^(0[1-9]|[12][0-9]|3[01])[- /.](0[1-9]|1[012])[- /.](19|20)\d\d$");
const String kEmailNullError ="Please Enter your email";
const String kInvalidEmailError ="Please Enter Valid email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNameNullError = "Please enter your name";
const String kBirthdayNullError = "Please enter your birthday";
const String kInvalidBirthdayError = "Please enter valid birthday";
const String kPeriodNullError = "Please enter your last menstrual period";
const String kInvalidPeriodError = "Please enter a valid date";
const String kHeightNullError = "Please enter your height";
const String kWeightNullError = "Please enter your weight";