import 'package:shared_preferences/shared_preferences.dart';

void saveData({
  String name,
  String email,
  String phone,
  String gender,
  String location,
}) async {
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  final Map<String, String> userInfo = {
    'name': name,
    'phone': phone,
    'gender': gender,
    'email': email,
    'location': location,
  };
  userInfo.forEach((key, value) {
    if (value != null && value != '') {
      preferences.setString(key, value);
    }
  });
}
