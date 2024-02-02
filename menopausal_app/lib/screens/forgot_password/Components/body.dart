import "package:flutter/material.dart";
import "package:menopausal_app/Components/default_button.dart";
import "package:menopausal_app/Components/no_account_text.dart";
import "package:menopausal_app/constants.dart";
import "package:menopausal_app/screens/birthday/components/body.dart";
import "package:menopausal_app/screens/sign_in/components/body.dart";
import "package:menopausal_app/size_config.dart";

class Body extends StatelessWidget {
  const Body({super.key});

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
              Text("Forgot Password" , style: TextStyle(
                fontSize: getProportionateScreenWidth(28),
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),),
              Text(
                "Please enter your email and we will send \nyou a link to return to your account",
                textAlign: TextAlign.center,
              ),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              Birthday(),
              
            ],
            ),
        ),
      ),
    );
  }
}

class Birthday extends StatefulWidget {

  @override
  _BirthdayState createState() => _BirthdayState();
}

class _BirthdayState extends State<Birthday> {
  final _formKey = GlobalKey<FormState>();
  List<String> errors =[];
  late String email;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => email = newValue! ,
          onChanged: (value){
            if(value.isNotEmpty  && errors.contains(kEmailNullError)){
              setState(() {
                errors.remove(kEmailNullError);
              });
            }
            else if(
              emailValidatorRegExp.hasMatch(value) && errors.contains(kInvalidEmailError)){
                setState(() {
                  errors.remove(kInvalidEmailError);
                });
              }
            return null;
          },
          validator: (value){
            if(value?.isEmpty ?? true && !errors.contains(kEmailNullError)){
              setState(() {
                errors.add(kEmailNullError);
              });
            }else if(
              !emailValidatorRegExp.hasMatch(value!) && !errors.contains(kInvalidEmailError)){
                setState((){
                  errors.add(kInvalidEmailError);
                });
              }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Email",
            hintText: "Enter your email",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: errors.contains(kEmailNullError) ? kEmailNullError : errors.contains(kInvalidEmailError) ? kInvalidEmailError : null,
            errorStyle: TextStyle(color: Colors.red),
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errors.contains(kEmailNullError) || errors.contains(kInvalidEmailError) ? Colors.red : kPrimaryColor),
            ),
            )
          ),
          SizedBox(height:getProportionateScreenHeight(30)),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          DefaultButton(
            text: "Continue", 
            press: () {
              if (_formKey.currentState!.validate()){
                
              }
            },
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.1),
          NoAccountText(),
        ],
      ),
    );
  }
}