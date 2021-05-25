import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/login/login_screen.dart';

class LogOut extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        height: MediaQuery.of(context).size.height * 0.15,
        child: RaisedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          color: mainColor,
          padding: EdgeInsets.symmetric(horizontal: 10),
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          child: Text(
            "LOG OUT",
            style: TextStyle(
                fontSize: 20, letterSpacing: 2.2, color: Colors.white),
          ),
        ));
  }
}
