import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pets_adoption_app_ui/modules/screens/profile/profile_page.dart';
import 'package:pets_adoption_app_ui/redux/Istore.dart';
import 'package:redux/redux.dart';

class ViewModel extends Equatable {
  final String name;
  final String avatar;

  ViewModel({this.name, this.avatar});

  @override
  List<Object> get props => [name, avatar];
}

Future<void> onInit(store) async {}

ViewModel converter(Store<AppState> store) {
  return ViewModel(
      name: store.state.userInfo.name, avatar: store.state.userInfo.avatar);
}

class NavbarTop extends StatefulWidget {
  @override
  _NavbarTopState createState() => _NavbarTopState();
}

class _NavbarTopState extends State<NavbarTop> {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
        onInit: (store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (BuildContext context, ViewModel viewModel) {
          return Row(
            children: <Widget>[
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    viewModel.name,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    'Active status',
                    style: TextStyle(color: Colors.white.withOpacity(0.5)),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
