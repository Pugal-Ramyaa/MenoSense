import 'package:flutter/material.dart';
import '../size_config.dart';
import 'package:menopausal_app/constants.dart';
class DefaultButton extends StatelessWidget {
  const DefaultButton({
    super.key,
    required this.text,
    required this.press,
  });
  final String text;
  final void Function()? press;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(56),
      child: TextButton(
        style: TextButton.styleFrom(backgroundColor: Color(0xFFffc293)),
          onPressed: press, 
          child:Text(text, style: TextStyle(fontSize: getProportionateScreenWidth(18),
          color: Colors.white,
        )),
                        ),
              );
  }
}

class SplashContent extends StatelessWidget {

  SplashContent({
    super.key,
    required this.text, 
    required this.image,
    required this.textStyle,
    required this.title,
  });
  final String? text;
  final String? image;
  final Map<String, dynamic> textStyle;
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
    
        Spacer(),
        Image.asset(
        'Assets/Images/logo.png', // Replace with the actual path
        height: getProportionateScreenHeight(100),
        width: getProportionateScreenWidth(150),
      ),
      Spacer(),
        if (title != null) // Conditionally include the title
          Text(
            title!,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(18),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Spacer(flex: 2),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Text(
            text!,
            textAlign: TextAlign.center,
            style: TextStyle(
            fontSize: textStyle["fontSize"] ?? 14.0, // Default font size is 16.0
            color: textStyle["color"] ?? Color.fromARGB(255, 47, 47, 47), // Default text color is black
            fontWeight: textStyle["fontWeight"] ?? FontWeight.normal, // Default font weight is normal
          ),
          ),
        ),
        Spacer(flex: 2),
        if (image != null)
          Image.asset(
            image!,
            height: getProportionateScreenHeight(284),
            width: getProportionateScreenWidth(235),
            ),
          ],
      );
  }
}

