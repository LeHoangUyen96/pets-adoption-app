import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';

class EditIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      right: 0,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            width: 4,
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          color: mainColor,
        ),
        child: Icon(
          Icons.edit,
          color: Colors.white,
        ),
      ),
    );
  }
}
