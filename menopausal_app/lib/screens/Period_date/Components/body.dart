import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:menopausal_app/Components/default_button.dart";
import "package:menopausal_app/Components/no_account_text.dart";
import "package:menopausal_app/constants.dart";
import "package:menopausal_app/screens/Height_weight/Height_weight.dart";
import "package:menopausal_app/screens/sign_in/components/body.dart";
import "package:menopausal_app/screens/sign_in/sign_in_screen.dart";
import "package:menopausal_app/size_config.dart";

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
              
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              ForgotPassForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class ForgotPassForm extends StatefulWidget {
  @override
  _ForgotPassFormState createState() => _ForgotPassFormState();
}

class _ForgotPassFormState extends State<ForgotPassForm> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors = [];
  late String date;

  // Define the dateRegex here
  final RegExp dateRegex = RegExp(r"^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-\d{4}$");


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: getProportionateScreenHeight(20)),
          buildBirthdayFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          DefaultButton(
            text: "Next",
            press: () {
              if (_formKey.currentState!.validate()) {
                Navigator.pushNamed(context, Height_weight.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildBirthdayFormField() {
    return TextFormField(
      keyboardType: TextInputType.datetime,
      onSaved: (newValue) => date = newValue!,
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kBirthdayNullError)) {
          setState(() {
            errors.remove(kBirthdayNullError);
          });
        } else if (!dateRegex.hasMatch(value) && errors.contains(kInvalidBirthdayError)) {
          setState(() {
            errors.remove(kInvalidBirthdayError);
          });
        }
      },
      validator: (value) {
        if (value?.isEmpty ?? true && !errors.contains(kBirthdayNullError)) {
          setState(() {
            errors.add(kBirthdayNullError);
          });
          return kBirthdayNullError;
        } else if (!dateRegex.hasMatch(value!) && !errors.contains(kInvalidBirthdayError)) {
          setState(() {
            errors.add(kInvalidBirthdayError);
          });
          return kInvalidBirthdayError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Last Menstrual Period",
        hintText: "DD/MM/YYYY",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorText: errors.contains(kPeriodNullError) || errors.contains(kInvalidPeriodError)
            ? errors.contains(kBirthdayNullError)
                ? kBirthdayNullError
                : kInvalidBirthdayError
            : null,
        errorStyle: TextStyle(color: Colors.red),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errors.contains(kPeriodNullError) || errors.contains(kInvalidPeriodError)
                ? Colors.red
                : kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
