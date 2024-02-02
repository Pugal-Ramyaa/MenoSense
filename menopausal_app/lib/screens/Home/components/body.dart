import "package:flutter/material.dart";
import "package:intl/intl.dart";
import "package:menopausal_app/Components/default_button.dart";
import "package:menopausal_app/constants.dart";
import "package:menopausal_app/screens/Calender/Calender.dart";
import "package:menopausal_app/screens/MedicalHistory/MedicalHistory.dart";
import "package:menopausal_app/screens/stage/stage.dart";
import "package:menopausal_app/size_config.dart";

class Body extends StatelessWidget {
  const Body({Key? key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Text(
                      "Hi UserName !!!",
                      style: TextStyle(
                        fontSize: getProportionateScreenWidth(14),
                        color: kPrimaryColor,
                      ),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    Center(
                      child: MiniCalendar(),
                    ),
                    SizedBox(height: getProportionateScreenHeight(20)),
                    WhiteRectangularArea(),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.white, // Change color as needed
            child: BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,
                  color: kPrimaryColor),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.calendar_month,
                  color: Colors.grey),
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
              selectedItemColor: Colors.grey, // Change color as needed
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              
        onTap: (index) {
          // Handle navigation based on the selected tab
          switch (index) {
            case 0:
              // Navigate to the home screen
              // Navigator.pushReplacementNamed(context, Home.routeName);
              break;
            case 1:
              // Navigate to the search screen
              Navigator.pushReplacementNamed(context, Calender.routeName);
              break;
            // Add cases for other tabs if needed
          }
        },
            ),
          ),
        ],
      ),
    );
  }
}
class WhiteRectangularArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // White rectangular area with logo and text
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding: EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Background for the logo
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: babyPink,
                ),
                padding: EdgeInsets.all(8.0),
                child: Image.asset(
                  "Assets/Images/smalllogo.png", // Replace with your actual logo path
                  height: 50,
                ),
              ),
              SizedBox(width: 16.0),
              // Second part with text
              Text(
                "Check the severity of menopause",
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(12),
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10.0), // Add space between the white rectangular area and the square boxes
        // Row with two square boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // First square box
            SquareBox(
              logoPath: "Assets/Images/logo1.png", // Replace with your actual logo path
              text: "Symptoms",
            ),
            // Second square box
            SquareBox(
              logoPath: "Assets/Images/logo2.png", // Replace with your actual logo path
              text: "Doctor",
            ),
          ],
        ),
        SizedBox(height: 10.0), // Add space between the two rows of square boxes
        // Row with two more square boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Third square box
            SquareBox(
              logoPath: "Assets/Images/logo3.png", // Replace with your actual logo path
              text: "Report",
            ),
            // Fourth square box
            SquareBox(
              logoPath: "Assets/Images/logo4.png", // Replace with your actual logo path
              text: "Vitals",
            ),
          ],
        ),
        SizedBox(height: 10.0), // Add space between the two rows of square boxes
        // Row with two more square boxes
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Third square box
            SquareBox(
              logoPath: "Assets/Images/logo3.png", // Replace with your actual logo path
              text: "Report",
              
            ),
            // Fourth square box
            SquareBox(
              logoPath: "Assets/Images/logo4.png", // Replace with your actual logo path
              text: "Vitals",
            ),
          ],
        ),

        SizedBox(height: 30.0),
      ],
    );
  }
}

class MiniCalendar extends StatelessWidget {
  @override
 Widget build(BuildContext context) {
    List<DateTime> weekDates = getWeekDates();

    return Table(
      // Remove the border line
      children: [
        TableRow(
          children: List.generate(7, (index) {
            DateTime date = weekDates[index];
            return TableCell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add padding outside the boxes
                child: Container(
                  decoration: BoxDecoration(
                    color: isToday(date) ? kPrimaryLightColor : Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric( vertical: 10.0),
                    child: Text(
                      DateFormat('EE').format(date),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isToday(date) ? Colors.white : Colors.black,
                      ),
                    ),
                    ),
                  ),
                  ),
              ),
            );
          }) // Add space between columns
        ),
        TableRow(
          children: List.generate(7, (index) {
            DateTime date = weekDates[index];
            return TableCell(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0), // Add padding outside the boxes
                child: Container(
                  decoration: BoxDecoration(
                    color: isToday(date) ? kPrimaryLightColor : Colors.white,
                    borderRadius: BorderRadius.vertical(bottom: Radius.circular(8.0)),
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric( vertical: 15.0), // Add space between days
                      child: Text(
                        DateFormat('d').format(date),
                        style: TextStyle(
                          color: isToday(date) ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          })// Add space between columns
        ),
        
      ],
    );
    
  }

  bool isToday(DateTime date) {
    DateTime today = DateTime.now();
    return date.year == today.year && date.month == today.month && date.day == today.day;
  }

  List<DateTime> getWeekDates() {
    DateTime now = DateTime.now();
    DateTime monday = now.subtract(Duration(days: now.weekday - 1)); // Calculate Monday of the current week

    List<DateTime> weekDates = List.generate(7, (index) => monday.add(Duration(days: index)));
    return weekDates;
  }
}
class SquareBox extends StatelessWidget {
  final String logoPath;
  final String text;

  SquareBox({required this.logoPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: getProportionateScreenWidth(150.0), // Adjust the width as needed
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0), // Make the box rounded
      ),
      padding: EdgeInsets.all(getProportionateScreenWidth(8.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            logoPath,
            height: getProportionateScreenHeight(100.0), // Adjust the height as needed
          ),
          SizedBox(height: getProportionateScreenHeight(10.0)),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: getProportionateScreenWidth(20.0),
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}