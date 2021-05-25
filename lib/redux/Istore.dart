import 'package:equatable/equatable.dart';
import 'package:pets_adoption_app_ui/modules/models/user.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/models/card.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/login/models/auth.dart';

class AppState extends Equatable {
  final Cart cart;
  final Login login;
  final UserInfo userInfo;

  AppState({this.cart, this.login, this.userInfo});

  factory AppState.initial() {
    return AppState(
        cart: Cart.initialState(),
        login: Login.initial(),
        userInfo: UserInfo.initialState());
  }

  AppState copyWith() {
    return AppState(
        cart: cart ?? this.cart,
        login: login ?? this.login,
        userInfo: userInfo ?? this.userInfo);
  }

  @override
  List<Object> get props => [cart, login, userInfo];
}
