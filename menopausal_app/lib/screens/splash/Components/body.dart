import 'package:flutter/material.dart';
import 'package:menopausal_app/constants.dart';
import 'package:menopausal_app/screens/sign_in/sign_in_screen.dart';
import 'package:menopausal_app/size_config.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../../Components/default_button.dart';
class Body extends StatefulWidget{
  Body({super.key});

  @override
  
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body>{
  PageController _pageController = PageController(initialPage: 0);
  int currentPage=0;
  List <Map<String , String >> splashdata = [
    {
      "text": "Embrace tranquility on your menopausal journey. Discover peace of mind through meditation and personalized support with MenoSense ",
      "image": "Assets/Images/meditate.png"
    },
    {
      "text": "Navigate menopause confidently. Seamlessly manage doctor visits with MenoSense, empowering you with personalized health reports for informed and collaborative care.",
      "image": "Assets/Images/doctor.png"
    },
    {
      "text": "Revitalize your well-being with MenoSense. Uncover essential insights about menopause symptoms and empower your journey to a healthier you.",
      "image": "Assets/Images/3.png"
    }
  ];
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: SizedBox(
        width:double.infinity,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 3,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  setState((){
                    currentPage = value;
                  });
                },
                itemCount: splashdata.length,
                itemBuilder: (context, index) => SplashContent(
                  image: splashdata[index]["image"],
                  text:splashdata[index]['text'],
                  title: splashdata[index]['title'],
                  textStyle: (splashdata[index]['textStyle'] as Map<String, dynamic>?) ?? {},
                )
              ),
              ),
              
              Expanded(
                flex: 2,
                child:Padding(
                  
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    ),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          splashdata.length,
                          (index) => buildDot(index: index))
                      ),
                      Spacer(flex: 2),
                      DefaultButton(
                        text: "Continue",
                        press: () {
                          if (currentPage < splashdata.length - 1) {
                            _pageController.nextPage(
                              duration: kAnimationDuration,
                              curve: Curves.ease,
                            );
                          } else {
                            Navigator.pushNamed(context, SignInScreen.routeName);
                          }
                        },
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        
    );
  }

  AnimatedContainer buildDot({required int index}) {
    return AnimatedContainer(
                    duration:kAnimationDuration ,
                    margin: EdgeInsets.only(right: 5),
                    height: 6,
                    width: currentPage == index ? 20 : 6,
                    decoration: BoxDecoration(
                      color: currentPage == index ? kPrimaryColor : kSecondaryColor,
                      borderRadius: BorderRadius.circular(3),
                    ),
                  );
  }
}

