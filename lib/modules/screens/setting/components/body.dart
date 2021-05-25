import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/menu/menu_screen.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/components/change_password.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/components/edit_profile.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/components/log_out.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/components/privacy_security.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MenuScreen()),
            );
          },
          icon: Icon(
            Icons.menu,
            color: mainColor,
          ),
        ),
        title: Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontSize: 25.0),
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: mainColor,
                ),
                SizedBox(
                  width: 8,
                ),
                Text(
                  "Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Divider(
              height: 15,
              thickness: 2,
            ),
            SizedBox(
              height: 10,
            ),
            EditProfile(),
            ChangePassword(),
            PrivacyAndSecurity(),
            LogOut()
          ],
        ),
      ),
    );
  }
}
