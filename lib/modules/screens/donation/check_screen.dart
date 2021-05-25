import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/animation.dart';
import 'package:pets_adoption_app_ui/modules/screens/donation/donation_screen.dart';
import 'dart:async';

class CheckScreen extends StatefulWidget {
  @override
  _CheckScreenState createState() => _CheckScreenState();
}

class _CheckScreenState extends State<CheckScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), backDonation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
      ),
      backgroundColor: Colors.white,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 170),
          child: Column(children: [
            FadeIn(
              delay: 2,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.12,
                child: Column(
                  children: [
                    Icon(
                      Icons.check_circle,
                      size: MediaQuery.of(context).size.height * 0.1,
                      color: mainColor,
                    ),
                  ],
                ),
              ),
            ),
            Text("Send donate success!",
                style: TextStyle(fontSize: 20, color: Colors.black)),
          ])),
    );
  }

  void backDonation() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => DonationScrren()),
    );
  }
}
