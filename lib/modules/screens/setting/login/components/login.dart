import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/login/components/form_login.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();

  static initial() {}
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome Pets adoption app!",
              style: TextStyle(
                  color: mainColor,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'sfpro'),
            ),
            SizedBox(
              height: 10,
            ),
            FormLogin(),
          ],
        ),
      ),
    );
  }
}
