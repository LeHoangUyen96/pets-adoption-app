import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';

class FormSignup extends StatefulWidget {
  @override
  _FormSignupState createState() => _FormSignupState();
}

class _FormSignupState extends State<FormSignup> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: TextStyle(
                  color: mainColor,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'sfpro'),
            ),
            SizedBox(
              height: 5,
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Name",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Phone Number",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Mail",
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: mainColor),
              child: Center(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'sfpro'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
