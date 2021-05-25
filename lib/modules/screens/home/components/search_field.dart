import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/redux/action.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/redux/reducer.dart';
import 'package:pets_adoption_app_ui/redux/store.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/animation.dart';

class SearchField extends StatefulWidget {
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController editingController = TextEditingController();

  Future<void> onSearch(String keyword) async {
    await store.dispatch(SetKeyword(keyword));
    await store.dispatch(searchProductAction());
  }

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
                border: InputBorder.none,
                hintText: "Search pet to adopt",
              ),
              onChanged: (value) async {
                await onSearch(value);
              },
            ),
          ),
        ]),
      ),
    );
  }
}
