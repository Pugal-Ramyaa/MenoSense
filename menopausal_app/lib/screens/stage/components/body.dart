import 'package:flutter/material.dart';
import 'package:menopausal_app/components/default_button.dart';
import 'package:menopausal_app/constants.dart';
import 'package:menopausal_app/screens/Home/Home.dart';
import 'package:menopausal_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Text(
                "Let's get to know you better ...",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(22),
                  color: kPrimaryColor,
                ),
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              HeightWeightForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.08),
              SizedBox(height: getProportionateScreenWidth(20)),
            ],
          ),
        ),
      ),
    );
  }
}

class HeightWeightForm extends StatefulWidget {
  @override
  _HeightWeightFormState createState() => _HeightWeightFormState();
}

class _HeightWeightFormState extends State<HeightWeightForm> {
  final _formKey = GlobalKey<FormState>();
  String? selectedHeight;
  String? selectedWeight;

  @override
    Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          buildHeightRadioButtons(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Submit",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, Home.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  Column buildHeightRadioButtons() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Which menopause phase you are in ?",
        style: TextStyle(fontSize: getProportionateScreenWidth(15),),),
        SizedBox(height: getProportionateScreenWidth(20)),
        Column(
          children: [
            RadioListTile<String>(
              title: Text("Peri Menopause",),
              value: "Peri Menopause",
              groupValue: selectedHeight,
              onChanged: (value) {
                setState(() {
                  selectedHeight = value;
                });
              },
              activeColor: kPrimaryColor,
            ),
            RadioListTile<String>(
              title: Text("Menopause"),
              value: "Menopause",
              groupValue: selectedHeight,
              onChanged: (value) {
                setState(() {
                  selectedHeight = value;
                });
              },
              activeColor: kPrimaryColor,
            ),
            RadioListTile<String>(
              title: Text("Post Menopause"),
              value: "Post Menopause",
              groupValue: selectedHeight,
              onChanged: (value) {
                setState(() {
                  selectedHeight = value;
                });
              },
              activeColor: kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }
}
