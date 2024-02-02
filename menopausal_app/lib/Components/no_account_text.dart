import "package:flutter/material.dart";
import "package:menopausal_app/constants.dart";
import "package:menopausal_app/screens/forgot_password/forgot_password_screen.dart";
import "package:menopausal_app/screens/sign_up/sign_up_screen.dart";
import "package:menopausal_app/size_config.dart";

class NoAccountText extends StatelessWidget {
  const NoAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
        "Don't have an account ?",
        style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignUpScreen.routeName),
          child: Text(
          "Sign Up",
          style: TextStyle(fontSize: getProportionateScreenWidth(16),
          color: kPrimaryColor),
          ),
        ),
    ],);
  }
}
