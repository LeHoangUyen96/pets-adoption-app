import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/categoriesConstants.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/models/category.dart';

class CategoryCard extends StatefulWidget {
  final Category category;
  CategoryCard({this.category});
  @override
  _CategoryCardState createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  int selectedIconIndex = 0;

  Widget buildIcon(int index) {
    final size = MediaQuery.of(context).size;
    var category = categories[index];
    return Padding(
      padding: EdgeInsets.only(right: 10.0),
      child: Column(
        children: <Widget>[
          InkWell(
            onTap: () {
              setState(() {
                selectedIconIndex = index;
              });
            },
            child: Material(
              color: selectedIconIndex == index ? mainColor : Colors.white,
              elevation: 2.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Image.asset(category.icons,
                    width: size.width * 0.14,
                    height: size.height * 0.08,
                    color: selectedIconIndex == index
                        ? Colors.white
                        : Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
          Text(category.type, style: kSubtitleStyle),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.16,
      child: ListView.builder(
          padding: EdgeInsets.only(
            left: 20.0,
            top: 5.0,
          ),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return buildIcon(index);
          }),
    );
  }
}
