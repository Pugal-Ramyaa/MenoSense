// MainScreen.dart
import 'package:flutter/material.dart';
import 'package:menopausal_app/constants.dart';
import 'package:menopausal_app/screens/Calender/components/CalenderComponent.dart';
import 'package:menopausal_app/screens/Calender/components/Symptoms.dart';
import 'package:menopausal_app/screens/Home/Home.dart';
import 'package:menopausal_app/size_config.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child:  SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 30),
                    CalendarComponent(),
                    SizedBox(height: 30),
                    SymptomsComponent(),
                    SizedBox(height: 90),
                  ],
                ),
              ),
            ),
          ),
            Container(
              width: double.infinity,
              color: Colors.black, // Change color as needed
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                  icon: Icon(Icons.home,
                  color:Colors.grey ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month,
                  color: kPrimaryColor),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications,
                  color: Colors.grey),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person,
                  color: Colors.grey),
                  label: 'Profile',
                ),
                ],
                // Change color as needed
                selectedItemColor: Colors.grey,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: true,
                showUnselectedLabels: true,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(context, Home.routeName);
                      break;
                    // ... (additional cases if needed)
                  }
                },
              ),
            ),
          ],
        ),
      );
  }
}
