import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';
import 'package:pets_adoption_app_ui/modules/screens/favorites/components/body.dart';
import 'package:pets_adoption_app_ui/modules/screens/menu/menu_screen.dart';

class FavoritesScreen extends StatelessWidget {
  final Product product;
  FavoritesScreen({this.product});

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 20.0),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 1,
            leading: IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MenuScreen()),
                );
              },
              icon: Icon(
                Icons.menu,
                color: mainColor,
              ),
            ),
            title: Text(
              "Favorites",
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            ),
            actions: [
              CircleAvatar(
                radius: 23,
                backgroundImage: AssetImage("assets/images/avatar.jpg"),
              ),
              SizedBox(width: 20)
            ],
          ),
          body: FavoritesPage(),
        ));
  }
}
