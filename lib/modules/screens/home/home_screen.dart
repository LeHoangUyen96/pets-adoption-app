import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/components/body.dart';
import 'package:pets_adoption_app_ui/modules/screens/menu/menu_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Scaffold(
          drawer: MenuScreen(),
          body: HomePage(),
        ));
  }
}
