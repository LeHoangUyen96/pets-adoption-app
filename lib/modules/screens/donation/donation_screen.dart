import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/donation/components/body.dart';
import 'package:pets_adoption_app_ui/modules/screens/menu/menu_screen.dart';

class DonationScrren extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.0, left: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 1,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
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
              "Donation",
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            ),
          ),
          drawer: MenuScreen(),
          body: DonationPage(),
        ));
  }
}
