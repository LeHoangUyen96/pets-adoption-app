import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/animation.dart';

class SearchFavorites extends StatelessWidget {
  final TextEditingController editingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: 1,
      child: Container(
        width: double.infinity,
        height: 50.0,
        margin: EdgeInsets.symmetric(horizontal: 18.0),
        padding: EdgeInsets.symmetric(horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(FontAwesomeIcons.search, color: kText2Color),
          SizedBox(width: 12),
          Expanded(
            child: TextFormField(
              controller: editingController,
              decoration: InputDecoration(
                hintStyle: kSubtitleStyle,
                border: InputBorder.none,
                hintText: "Search pet in favorites",
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
