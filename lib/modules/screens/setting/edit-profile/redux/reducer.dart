import 'package:pets_adoption_app_ui/modules/models/user.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/edit-profile/helper/helper.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/edit-profile/redux/action.dart';
import 'package:pets_adoption_app_ui/redux/Istore.dart';
import 'package:redux/redux.dart';
import 'package:redux_thunk/redux_thunk.dart';

UserInfo userReducer(UserInfo state, dynamic action) {
  if (action is SetName) {
    return onSetName(state, action);
  }
  if (action is SetAvatar) {
    return onSetAvatar(state, action);
  }
  if (action is SetLocation) {
    return onSetLocation(state, action);
  }
  if (action is SetPhone) {
    return onSetPhone(state, action);
  }
  if (action is SetEmail) {
    return onSetEmail(state, action);
  }
  if (action is SetAge) {
    return onSetAge(state, action);
  }
  if (action is SaveInfo) {
    return onSaveInfo(state, action);
  }
  return state;
}

UserInfo onSetName(UserInfo state, SetName action) {
  state = state.copyWith(name: action.name);
  return state;
}

UserInfo onSetAvatar(UserInfo state, SetAvatar action) {
  state = state.copyWith(avatar: action.avatar);
  return state;
}

UserInfo onSetAge(UserInfo state, SetAge action) {
  state = state.copyWith(age: action.age);
  return state;
}

UserInfo onSetLocation(UserInfo state, SetLocation action) {
  state = state.copyWith(location: action.location);
  return state;
}

UserInfo onSetPhone(UserInfo state, SetPhone action) {
  state = state.copyWith(phone: action.phone);
  return state;
}

UserInfo onSetEmail(UserInfo state, SetEmail action) {
  state = state.copyWith(email: action.email);
  return state;
}

UserInfo onSaveInfo(UserInfo state, SaveInfo action) {
  state = state.copyWith(
    name: action.name,
    age: action.age,
    avatar: action.avatar,
    email: action.email,
    phone: action.phone,
    location: action.location,
  );
  return state;
}

ThunkAction<AppState> setUserInfo(
    {String name, String phone, String gender, String email, String location}) {
  return (Store<AppState> store) async {
    await store.dispatch(SaveInfo(
      name: (name != '') ? name : null,
      location: (location != '') ? location : null,
      phone: (phone != '') ? phone : null,
      email: (email != '') ? email : null,
      gender: (gender != '') ? gender : null,
    ));
    saveData(
        name: name,
        email: email,
        gender: gender,
        phone: phone,
        location: location);
  };
}
