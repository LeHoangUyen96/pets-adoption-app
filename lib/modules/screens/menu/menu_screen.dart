import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';
import 'package:pets_adoption_app_ui/modules/screens/menu/menu_fame.dart';

class MenuScreen extends StatelessWidget {
  final Product product;
  MenuScreen({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: MenuFrame());
  }
}
