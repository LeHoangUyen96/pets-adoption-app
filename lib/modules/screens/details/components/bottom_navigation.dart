import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/favorites_button.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/redux/action.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/redux/reducer.dart';
import 'package:pets_adoption_app_ui/redux/store.dart';
import 'animation.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';

class BottomNavigation extends StatelessWidget {
  final Product product;
  BottomNavigation({@required this.product});
  @override
  Widget build(BuildContext context) {
    return FadeIn(
      delay: 2,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.12,
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Card(
                  elevation: 6,
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      FavoriteButton(
                        isFavorite: product.isFavorite,
                        valueChanged: (_isFavorite) async {
                          await store.dispatch(
                              SetIsFavorites(!product.isFavorite, product.id));
                          await store.dispatch(searchProductAction());
                        },
                      ),
                    ],
                  )),
            ),
            SizedBox(width: 20.0),
            Expanded(
              flex: 9,
              child: RaisedButton(
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("This pet is added to the adoption")));
                },
                elevation: 6,
                color: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Center(
                    child: Text("Adoption",
                        style: kTitleStyle.copyWith(color: Colors.white))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
