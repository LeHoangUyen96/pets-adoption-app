import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/productConstants.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/animation.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class ImageProduct extends StatelessWidget {
  final Product product;
  ImageProduct({this.product});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      right: 0,
      bottom: MediaQuery.of(context).size.height * 0.1,
      child: Container(
        color: product.color,
        child: Column(
          children: [
            AppBar(
              backgroundColor: product.color,
              elevation: 0,
              leading: GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.arrow_back, color: kTextColor, size: 30),
              ),
            ),
            FadeIn(
              delay: 2,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.3,
                child: Swiper(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Image.asset(
                        product.image,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
