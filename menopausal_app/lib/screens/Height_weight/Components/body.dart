
import "package:flutter/material.dart";
import "package:menopausal_app/Components/default_button.dart";
import "package:menopausal_app/constants.dart";
import "package:menopausal_app/screens/MedicalHistory/MedicalHistory.dart";
import "package:menopausal_app/screens/stage/stage.dart";
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
  List<String> errors = [];
  // late int height;
  late double weight;
  late int height;

  // Define the dateRegex here
  final RegExp dateRegex = RegExp(r"^(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-\d{4}$");


  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildHeightFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildWeightFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Next",
            press:() {
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                Navigator.pushNamed(context, MedicalHistory.routeName);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildHeightFormField() {
    return TextFormField(
      keyboardType: TextInputType.number,
      onSaved: (newValue) => height = int.parse(newValue!),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kHeightNullError)) {
          setState(() {
            errors.remove(kHeightNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value?.isEmpty ?? true && !errors.contains(kHeightNullError)) {
          setState(() {
            errors.add(kHeightNullError);
          });
          return kHeightNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Height",
        hintText: "in cm",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorText: errors.contains(kHeightNullError) || errors.contains(kHeightNullError)
            ? errors.contains(kHeightNullError)
                ? kHeightNullError
                : kHeightNullError
            : null,
        errorStyle: TextStyle(color: Colors.red),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errors.contains(kHeightNullError)
                ? Colors.red
                : kPrimaryColor,
          ),
        ),
      ),
    );
  }



FormField buildWeightFormField() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      onSaved: (newValue) => weight = double.parse(newValue!),
      onChanged: (value) {
        if (value.isNotEmpty && errors.contains(kWeightNullError)) {
          setState(() {
            errors.remove(kWeightNullError);
          });
        }
        return null;
      },
      validator: (value) {
        if (value?.isEmpty ?? true && !errors.contains(kWeightNullError)) {
          setState(() {
            errors.add(kWeightNullError);
          });
          return kWeightNullError;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Weight",
        hintText: "in Kgs",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        errorText: errors.contains(kWeightNullError) || errors.contains(kWeightNullError)
            ? errors.contains(kWeightNullError)
                ? kWeightNullError
                : kWeightNullError
            : null,
        errorStyle: TextStyle(color: Colors.red),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: errors.contains(kWeightNullError)
                ? Colors.red
                : kPrimaryColor,
          ),
        ),
      ),
    );
  }
}
