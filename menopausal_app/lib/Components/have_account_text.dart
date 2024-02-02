import "package:flutter/material.dart";
import "package:menopausal_app/constants.dart";
import "package:menopausal_app/screens/sign_in/sign_in_screen.dart";
import "package:menopausal_app/size_config.dart";

class HaveAccountText extends StatelessWidget {
  const HaveAccountText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
      Text(
        "Already have an account ?",
        style: TextStyle(fontSize: getProportionateScreenWidth(16)),
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, SignInScreen.routeName),
          child: Text(
          "Sign In",
          style: TextStyle(fontSize: getProportionateScreenWidth(16),
          color: kPrimaryColor),
          ),
        ),
    ],);
  }
}
