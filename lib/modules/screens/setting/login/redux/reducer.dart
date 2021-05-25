import 'package:pets_adoption_app_ui/modules/screens/setting/login/models/auth.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/login/redux/action.dart';

Login loginReducer(Login state, dynamic action) {
  if (action is SetEmail) {
    return onSetEmail(state, action);
  }

  if (action is SetPassword) {
    return onSetPassword(state, action);
  }

  if (action is ClearLogin) {
    return onClearLogin(state, action);
  }
  return state;
}

Login onSetEmail(Login state, SetEmail action) {
  state = state.copywith(email: action.email);
  return state;
}

Login onSetPassword(Login state, SetPassword action) {
  state = state.copywith(
    password: action.password,
  );
  return state;
}

Login onClearLogin(Login state, ClearLogin action) {
  state = state.copywith(
    email: '',
    password: '',
  );
  return state;
}
