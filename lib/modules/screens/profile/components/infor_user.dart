import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/redux/Istore.dart';
import 'package:redux/redux.dart';

class ViewModel extends Equatable {
  final String name;
  final String location;
  final String age;

  ViewModel({
    this.name,
    this.location,
    this.age,
  });

  @override
  List<Object> get props => [
        name,
        location,
        age,
      ];
}

Future<void> onInit(store) async {}

ViewModel converter(Store<AppState> store) {
  return ViewModel(
    name: store.state.userInfo.name,
    age: store.state.userInfo.age,
    location: store.state.userInfo.location,
  );
}

class InforUser extends StatefulWidget {
  @override
  _InforUserState createState() => _InforUserState();
}

class _InforUserState extends State<InforUser> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return StoreConnector<AppState, ViewModel>(
        onInit: (store) async => await onInit(store),
        converter: (Store<AppState> store) => converter(store),
        builder: (BuildContext context, ViewModel viewModel) {
          return Column(children: <Widget>[
            Text(viewModel.name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.8,
                    color: mainColor)),
            SizedBox(
              height: height * 0.001,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.location_on,
                  size: 20,
                  color: mainColor,
                ),
                Text(
                  viewModel.location,
                  style: TextStyle(
                    letterSpacing: 0.5,
                    color: mainColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.001),
            Text(viewModel.age,
                style: TextStyle(fontSize: 14, color: mainColor)),
            SizedBox(
              height: height * 0.007,
            ),
          ]);
        });
  }
}
