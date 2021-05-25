import 'package:pets_adoption_app_ui/modules/screens/home/redux/reducer.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/edit-profile/redux/reducer.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/login/redux/reducer.dart';
import 'Istore.dart';

AppState appStateReducer(AppState state, action) {
  if (action != null && action is Logout) {
    return AppState.initial();
  }

  return AppState(
      cart: cartReducer(state.cart, action),
      login: loginReducer(state.login, action),
      userInfo: userReducer(state.userInfo, action));
}

class Logout {}
