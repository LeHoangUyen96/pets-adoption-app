import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pets_adoption_app_ui/modules/screens/menu/menu_screen.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/profile/profile_page.dart';
import 'package:pets_adoption_app_ui/redux/Istore.dart';
import 'package:redux/redux.dart';

class ViewModel extends Equatable {
  final String avatar;
  final String location;

  ViewModel({this.avatar, this.location});

  @override
  List<Object> get props => [avatar, location];
}

Future<void> onInit(store) async {}

ViewModel converter(Store<AppState> store) {
  return ViewModel(
    avatar: store.state.userInfo.avatar,
    location: store.state.userInfo.location,
  );
}

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        onInit: (store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (BuildContext context, ViewModel viewModel) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                child: IconButton(
                  icon: Icon(Icons.menu),
                  color: mainColor,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => MenuScreen()),
                    );
                  },
                ),
              ),
              Column(
                children: [
                  Text("Location",
                      style: kSubtitle2Style.copyWith(fontSize: 17)),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.55,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, color: mainColor),
                        SizedBox(width: 12.0),
                        RichText(
                            textAlign: TextAlign.center,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(children: [
                              TextSpan(
                                  text: viewModel.location,
                                  style: kSubtitleStyle),
                            ]))
                      ],
                    ),
                  )
                ],
              ),
              FlatButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => UserScreen()),
                    );
                  },
                  child: CircleAvatar(
                    radius: 24.0,
                    backgroundImage: AssetImage(viewModel.avatar),
                  )),
            ],
          );
        });
  }
}
