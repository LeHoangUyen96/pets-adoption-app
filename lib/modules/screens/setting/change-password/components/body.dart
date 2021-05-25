import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatefulWidget {
  ChangePassword() : super();
  @override
  ChangePasswordState createState() => ChangePasswordState();
}

class ChangePasswordState extends State<ChangePassword> {
  bool showPassword = false;
  String yourPassword = "";
  String newPassword = "";
  String confirmPassword = "";
  String nameKey = "_key_name";
  TextEditingController yourPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setData();
  }

  void saveData({
    String password,
  }) async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final Map<String, String> passInfo = {'password': password};
    passInfo.forEach((key, value) {
      if (value != null && value != '') {
        preferences.setString(key, value);
      }
    });
  }

  String validateYourPassword(String pass) {
    if (pass.isEmpty) {
      return "Please nter your password";
    }
  }

  String validatePassword(String pass) {
    if (pass.isEmpty || pass.length < 8) {
      return "Password should be atleast 8 characters";
    }
    if (pass.length > 15) {
      return "Password should not be greater than 15 characters";
    }
    return null;
  }

  String checkConfirmPass(String pass, String confirmPass) {
    if (pass == confirmPass || confirmPass == '') {
      return null;
    }
    return 'Your pass and your confirm password are different, please enter again.';
  }

  bool checkPassword(String old, String newPass, String confirm) {
    if (newPass == confirm) {
      return true;
    }
    return false;
  }

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      yourPassword = preferences.getString('yourPassword') ?? '';
      newPassword = preferences.getString('newPassword') ?? '';
    });
    return preferences.getString(nameKey);
  }

  setData() {
    loadData().then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 10, left: 30),
      child: Form(
        child: ListView(
          children: [
            TextFormField(
              autovalidate: true,
              controller: yourPasswordController,
              decoration: InputDecoration(
                labelText: "Your Password",
                enabledBorder: InputBorder.none,
              ),
              validator: (String value) {
                return validateYourPassword(yourPasswordController.text);
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              autovalidate: true,
              controller: newPasswordController,
              decoration: InputDecoration(
                labelText: "New Password",
                enabledBorder: InputBorder.none,
              ),
              validator: (String value) {
                return validatePassword(newPasswordController.text);
              },
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidate: true,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                labelText: "Confirm Password",
                enabledBorder: InputBorder.none,
              ),
              validator: (String value) {
                return checkConfirmPass(newPasswordController.text, value);
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () {
                    if (checkPassword(
                        yourPasswordController.text,
                        newPasswordController.text,
                        confirmPasswordController.text)) {
                      saveData(
                        password: newPasswordController.text,
                      );
                    }
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Saved')));
                  },
                  color: mainColor,
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
