import 'package:flutter/material.dart';

class Avarta extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: size.width * 0.5,
      height: size.height * 0.25,
      decoration: BoxDecoration(
          border: Border.all(
              width: 4, color: Theme.of(context).scaffoldBackgroundColor),
          boxShadow: [
            BoxShadow(
                spreadRadius: 2,
                blurRadius: 10,
                color: Colors.black.withOpacity(0.1),
                offset: Offset(0, 10))
          ],
          shape: BoxShape.circle,
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "assets/images/avatar.jpg",
              ))),
    );
  }
}
