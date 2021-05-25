import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';

class PrivacyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          Row(
            children: [
              Icon(
                Icons.privacy_tip,
                color: mainColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Privacy",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "1. Information which is collected by our App: We may collect the following information when you use our App.",
              style: TextStyle(
                fontSize: 16,
              )),
          SizedBox(
            height: 20,
          ),
          Text(
              "2. Processing ground: We rely on contractual necessity to process the items of personal data",
              style: TextStyle(
                fontSize: 16,
              )),
          SizedBox(
            height: 20,
          ),
          Text(
              "3. Sharing information with third parties: We shall not pass your information to any third party if you click agree.",
              style: TextStyle(
                fontSize: 16,
              )),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Icon(
                Icons.security,
                color: mainColor,
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                "Security",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              "We have implemented technology and policies to safeguard your privacy from unauthorised access and improper use.",
              style: TextStyle(
                fontSize: 16,
              ))
        ],
      ),
    );
  }
}
