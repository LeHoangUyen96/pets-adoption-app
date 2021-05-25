import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/detail_screen.dart';
import 'package:pets_adoption_app_ui/modules/screens/favorites/helper/get_favorites.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/components/product_card.dart';
import 'package:pets_adoption_app_ui/redux/Istore.dart';
import 'package:redux/redux.dart';

class ViewModel extends Equatable {
  final List<Product> product;
  final List<Product> favorites;
  ViewModel({@required this.product, this.favorites});

  @override
  List<Object> get props => [product, this.favorites];
}

class FavoritesPage extends StatefulWidget {
  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  Future<void> onInit(store) async {}

  ViewModel converter(Store<AppState> store) {
    final products = store.state.cart.product;
    final favorites = getFavorites(products);
    return ViewModel(
      product: products,
      favorites: favorites,
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      onInit: (store) async => await onInit(store),
      converter: (Store<AppState> store) => converter(store),
      builder: (BuildContext context, ViewModel viewModel) {
        if (viewModel.favorites == null) {
          return Container();
        }
        return SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(25),
                      ),
                      color: Colors.grey[300]),
                  child: AnimationLimiter(
                    child: Column(
                      children: AnimationConfiguration.toStaggeredList(
                        duration: Duration(milliseconds: 375),
                        childAnimationBuilder: (widget) => SlideAnimation(
                          horizontalOffset:
                              MediaQuery.of(context).size.width / 2,
                          child: FadeInAnimation(child: widget),
                        ),
                        children: [
                          ListView.builder(
                            itemCount: viewModel.favorites.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              var product = viewModel.favorites[index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DetailScreen(product: product),
                                    ),
                                  );
                                },
                                child: ProductCard(product: product),
                              );
                            },
                          ),
                          SizedBox(height: 25.0),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ));
      },
    );
  }
}
