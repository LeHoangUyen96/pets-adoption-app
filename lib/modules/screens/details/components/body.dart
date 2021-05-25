import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/models/product.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/animation.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/detail_product.dart';
import 'package:pets_adoption_app_ui/modules/screens/details/components/image_product.dart';
import 'package:pets_adoption_app_ui/redux/Istore.dart';
import 'package:redux/redux.dart';

class ViewModel extends Equatable {
  final String name;
  final String location;
  final String avatar;

  ViewModel({this.name, this.location, this.avatar});

  @override
  List<Object> get props => [name, location, avatar];
}

Future<void> onInit(store) async {}

ViewModel converter(Store<AppState> store) {
  return ViewModel(
      name: store.state.userInfo.name,
      location: store.state.userInfo.location,
      avatar: store.state.userInfo.avatar);
}

class DetailPage extends StatelessWidget {
  final Product product;
  DetailPage({this.product});

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        onInit: (store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (BuildContext context, ViewModel viewModel) {
          return Container(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.65,
                    child: Stack(
                      children: [
                        ImageProduct(
                          product: product,
                        ),
                        DetailProduct(
                          product: product,
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: [
                        SizedBox(height: 12),
                        FadeIn(
                          delay: 4,
                          child: ListTile(
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundImage: AssetImage(viewModel.avatar),
                            ),
                            title: Text(viewModel.name,
                                style: kTitleStyle.copyWith(fontSize: 16.0)),
                            subtitle: Text(viewModel.location,
                                style: kSubtitleStyle.copyWith(fontSize: 13.0)),
                            trailing:
                                Text("17th, Dec, 2020", style: kSubtitle2Style),
                          ),
                        ),
                        SizedBox(height: 15.0),
                        FadeIn(
                          delay: 5,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(product.description,
                                style: kSubtitleStyle),
                          ),
                        ),
                        SizedBox(height: 15.0),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
