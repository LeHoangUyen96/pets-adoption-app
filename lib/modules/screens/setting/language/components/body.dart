import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "English",
                style: TextStyle(
                    fontSize: 18, letterSpacing: 1.2, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "Indonesia",
                style: TextStyle(
                    fontSize: 18, letterSpacing: 1.2, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "中文",
                style: TextStyle(
                    fontSize: 18, letterSpacing: 1.2, color: Colors.black),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "日本人",
                style: TextStyle(
                    fontSize: 18, letterSpacing: 1.2, color: Colors.black),
              ),
            ),
          ],
        ));
  }
}
