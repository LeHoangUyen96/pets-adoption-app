import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/language/language_screen.dart';

class SettingsLanguage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Language",
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600]),
        ),
        IconButton(
            icon: Icon(Icons.arrow_forward_ios, color: Colors.grey[600]),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LanguageScreen()),
              );
            })
      ],
    );
  }
}
