import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/donation/check_screen.dart';

class DonationPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20.0, left: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
        40.0,
      )),
      child: SingleChildScrollView(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            Text("Money :",
                style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(height: 10),
            TextFormField(
              obscureText: false,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 2),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text("Content donate:",
                style: TextStyle(
                    color: mainColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
            SizedBox(height: 10),
            TextFormField(
              obscureText: false,
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 2),
                ),
              ),
            ),
            SizedBox(height: 5),
            RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => CheckScreen()),
                );
              },
              color: mainColor,
              padding: EdgeInsets.symmetric(horizontal: 10),
              elevation: 5,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Text(
                "Send",
                style: TextStyle(color: Colors.white, fontSize: 20.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
