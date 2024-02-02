import 'package:flutter/material.dart';
import 'components/body.dart';

class Home extends StatelessWidget {
  static String routeName = "/Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu), // Add your menu icon here
          onPressed: () {
            // Handle menu icon press
          },
        ),
        title: Text(
          "HOME",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          CircleAvatar(
            backgroundImage: AssetImage("Assets/Images/profile_pic.jpg"), // Add your profile pic here
          ),
          SizedBox(width: 16), // Adjust spacing as needed
        ],
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
