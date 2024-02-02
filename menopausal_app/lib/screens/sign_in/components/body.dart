import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:menopausal_app/Components/no_account_text.dart';
import 'package:menopausal_app/constants.dart';
import 'package:menopausal_app/screens/Home/Home.dart';
import 'package:menopausal_app/screens/forgot_password/forgot_password_screen.dart';
import 'package:menopausal_app/size_config.dart';

import '../../../Components/default_button.dart';

class Body extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal:getProportionateScreenWidth(20)),
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text("Welcome Back" , 
                style: TextStyle(
                  color: Colors.black,
                  fontSize:getProportionateScreenWidth(28),
                  fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Sign in with your email and password",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SignForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.08),
                SizedBox(height: getProportionateScreenWidth(20)),
                NoAccountText()
              ],
            ),
          ),
        ),
      )
    );
  }
}


class SignForm extends StatefulWidget {
  @override
 _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> errors =[];
  late String email;
  late String password;
  bool remember = false ;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(20)),
          Row(children: [
            Checkbox(
              value: remember, 
              activeColor: kPrimaryColor,
              onChanged: (value) {
                setState(() {
                  remember = value!;
                });
              },
            ),
            Text("Remember me"),
            Spacer(),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
              child: Text("Forgot Password", style: TextStyle(decoration: TextDecoration.underline) ,))

          ],),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text:"Continue",
            press:() {
              if(_formKey.currentState!.validate()){
                _formKey.currentState!.save();
                Navigator.pushNamed(context, Home.routeName);
              }
            },
          )
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => password = newValue!,
      onChanged: (value){
            if(value.isNotEmpty  && errors.contains(kPassNullError)){
              setState(() {
                errors.remove(kPassNullError);
              });
            }
            else if(
              value.length >= 8 && errors.contains(kShortPassError)){
                setState(() {
                  errors.remove(kShortPassError);
                });
              }
            return null;
          },
      validator: (value){
            if(value?.isEmpty ?? true && !errors.contains(kPassNullError)){
              setState(() {
                errors.add(kPassNullError);
              });
            }else if(
              value!.length < 8 && !errors.contains(kShortPassError)){
                setState((){
                  errors.add(kShortPassError);
                });
              }
            return null;
          },
          decoration: InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            floatingLabelBehavior: FloatingLabelBehavior.always,
            errorText: errors.contains(kPassNullError) ? kPassNullError : errors.contains(kShortPassError) ? kShortPassError : null,
            errorStyle: TextStyle(color: Colors.red),
            focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: errors.contains(kPassNullError) || errors.contains(kShortPassError) ? Colors.red : kPrimaryColor),
            ),
            )
          );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
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
          );
  }
}

class formErrors extends StatelessWidget {
  const formErrors({
    super.key,
    required this.errors,
  });

  final List<String> errors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        errors.length, (index) => formErrorText(error: errors[index])),
    );
  }

  Row formErrorText({required String error}) {
    return Row(
        children: [
          SizedBox(
            width: getProportionateScreenWidth(10),
          ),
          Text(error),
        ],
      );
  }
}