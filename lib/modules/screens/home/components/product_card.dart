import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  ProductCard({this.product});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.3,
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Stack(
        children: [
          Positioned(
            top: size.height * 0.07,
            left: 0,
            right: 0,
            bottom: size.height * 0.01,
            child: Card(
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Container(
                margin: EdgeInsets.only(left: size.width * 0.4),
                padding: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          overflow: TextOverflow.ellipsis,
                          style: kTitleStyle,
                        ),
                        product.isFemale
                            ? Icon(
                                FontAwesomeIcons.mars,
                                color: kText2Color,
                              )
                            : Icon(
                                FontAwesomeIcons.venus,
                                color: kText2Color,
                              ),
                      ],
                    ),
                    Text(product.species, style: kSubtitleStyle),
                    Text("${product.age} years old", style: kSubtitle2Style),
                    Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.mapMarkerAlt,
                          color: mainColor,
                          size: 15,
                        ),
                        SizedBox(width: 5.0),
                        Text(
                          "Distance: ${product.address} km",
                          style: kSubtitle2Style,
                        )
                      ],
                    ),
                    SizedBox(height: 5.0),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.07,
            left: 0,
            right: size.width * 0.45,
            bottom: 0,
            child: Card(
              elevation: 7,
              color: product.color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.0),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 10,
            right: size.width * 0.45,
            bottom: 10,
            child: Image.asset(
              product.image,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
