import 'package:flutter/material.dart';
import 'package:menopausal_app/components/default_button.dart';
import 'package:menopausal_app/constants.dart';
import 'package:menopausal_app/screens/Thyroid/Thyroid.dart';
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
  List<String> selectedOptions = [];

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          buildHeightCheckboxList(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Next",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, Thyroid.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  Column buildHeightCheckboxList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Your medical history :",
          style: TextStyle(fontSize: getProportionateScreenWidth(15),),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        Column(
          children: [
            CheckboxListTile(
              title: Text("Obesity"),
              value: selectedOptions.contains("Obesity"),
              onChanged: (value) {
                updateSelectedOptions("Obesity", value);
              },
              activeColor: kPrimaryColor,
            ),
            CheckboxListTile(
              title: Text("Cardiovascular Disease"),
              value: selectedOptions.contains("Cardiovascular Disease"),
              onChanged: (value) {
                updateSelectedOptions("Cardiovascular Disease", value);
              },
              activeColor: kPrimaryColor,
            ),
            CheckboxListTile(
              title: Text("Menstrual Irregularity"),
              value: selectedOptions.contains("Menstrual Irregularity"),
              onChanged: (value) {
                updateSelectedOptions("Menstrual Irregularity", value);
              },
              activeColor: kPrimaryColor,
            ),
            CheckboxListTile(
              title: Text("Thyroid Problem"),
              value: selectedOptions.contains("Thyroid Problem"),
              onChanged: (value) {
                updateSelectedOptions("Thyroid Problem", value);
              },
              activeColor: kPrimaryColor,
            ),
            CheckboxListTile(
              title: Text("PCOS"),
              value: selectedOptions.contains("PCOS"),
              onChanged: (value) {
                updateSelectedOptions("PCOS", value);
              },
              activeColor: kPrimaryColor,
            ),
            CheckboxListTile(
              title: Text("HyperTension"),
              value: selectedOptions.contains("HyperTension"),
              onChanged: (value) {
                updateSelectedOptions("HyperTension", value);
              },
              activeColor: kPrimaryColor,
            ),
            CheckboxListTile(
              title: Text("Diabetes"),
              value: selectedOptions.contains("Diabetes"),
              onChanged: (value) {
                updateSelectedOptions("Diabetes", value);
              },
              activeColor: kPrimaryColor,
            ),
          ],
        ),
      ],
    );
  }
  void updateSelectedOptions(String option, bool? value) {
    setState(() {
      if (value != null && value) {
        selectedOptions.add(option);
      } else {
        selectedOptions.remove(option);
      }
    });
  }
}
