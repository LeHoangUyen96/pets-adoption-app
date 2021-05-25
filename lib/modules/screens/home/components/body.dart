import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/detail_screen.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/components/appbar.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/components/category_card.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/components/search_field.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/components/product_card.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/redux/action.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/redux/reducer.dart';
import 'package:pets_adoption_app_ui/redux/Istore.dart';
import 'package:redux/redux.dart';

class ViewModel extends Equatable {
  final List<Product> product;
  final List<Product> productlist;
  ViewModel({@required this.product, this.productlist});
  @override
  List<Object> get props => [product, productlist];
}

Future<void> onInit(store) async {
  await store.dispatch(SetKeyword(''));
  await store.dispatch(searchProductAction());
}

ViewModel converter(Store<AppState> store) {
  return ViewModel(
      product: store.state.cart.product,
      productlist: store.state.cart.productsearch);
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        onInit: (store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (BuildContext context, ViewModel viewModel) {
          if (viewModel.productlist == null) {
            return Container();
          }
          return SingleChildScrollView(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                AppBarHome(),
                SizedBox(height: 10.0),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                    color: Colors.grey[300],
                  ),
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
                          SizedBox(height: 25.0),
                          SearchField(),
                          SizedBox(height: 15.0),
                          CategoryCard(),
                          ListView.builder(
                            itemCount: viewModel.productlist.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: ScrollPhysics(),
                            itemBuilder: (context, index) {
                              var product = viewModel.productlist[index];
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
                          SizedBox(height: 20)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}
