import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/profile/profile_page.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/edit-profile/components/body.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/setting_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: mainColor,
          ),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => UserScreen()),
            );
          },
        ),
        title: Text(
          "Edit proflie",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings, color: mainColor),
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          )
        ],
      ),
      body: EditProfilePage(),
    );
  }
}
