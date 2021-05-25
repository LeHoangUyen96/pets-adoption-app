import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/animation.dart';

class DetailProduct extends StatelessWidget {
  final Product product;
  DetailProduct({this.product});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).size.height * 0.47,
      left: 20,
      right: 20,
      bottom: 0,
      child: FadeIn(
        delay: 3,
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      product.name,
                      style: kTitleStyle.copyWith(fontSize: 24.0),
                    ),
                    product.isFemale
                        ? Icon(FontAwesomeIcons.mars, color: mainColor)
                        : Icon(FontAwesomeIcons.venus, color: mainColor)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(product.species, style: kSubtitleStyle),
                    Text("${product.age} years old", style: kSubtitle2Style),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: mainColor,
                      size: 20,
                    ),
                    SizedBox(width: 12.0),
                    Text("${product.address} km",
                        style: kSubtitle2Style.copyWith(fontSize: 15.0)),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "Youth street, ABCD city, USA",
                      style: kSubtitle2Style,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
