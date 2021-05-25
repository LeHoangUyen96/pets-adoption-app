import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/login/login_screen.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/setting_screen.dart';

class BottomSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
            icon: Icon(
              FontAwesomeIcons.cog,
              color: Colors.white.withOpacity(0.5),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            }),
        Text(
          'Settings | Log out',
          style: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
        ),
        IconButton(
            icon: Icon(
              Icons.logout,
              color: Colors.white.withOpacity(0.5),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            }),
      ],
    );
  }
}
