import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/modules/screens/menu/menu_screen.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/components/body.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      drawer: MenuScreen(),
      body: SettingsPage(),
    );
  }
}
