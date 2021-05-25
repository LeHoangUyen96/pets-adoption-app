import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/body.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/bottom_navigation.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  DetailScreen({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DetailPage(
          product: product,
        ),
        bottomNavigationBar: BottomNavigation(product: product));
  }
}
