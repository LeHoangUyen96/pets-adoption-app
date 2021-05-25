import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/home/home_screen.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/login/redux/action.dart';
import 'package:pets_adoption_app_ui/redux/store.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final TextEditingController emailController =
      TextEditingController(text: 'demo@gmail.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'demo123');
  final _formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
            obscureText: _obscureText,
            controller: emailController,
            scrollPadding: EdgeInsets.all(15),
            decoration: InputDecoration(
              labelText: "Email",
              suffixIcon: InkWell(
                onTap: _toggle,
                child: Icon(
                  _obscureText
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  size: 15.0,
                  color: Colors.black,
                ),
              ),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          TextFormField(
            obscureText: _obscureText,
            controller: passwordController,
            scrollPadding: EdgeInsets.all(15),
            decoration: InputDecoration(
              labelText: "Password",
              suffixIcon: InkWell(
                onTap: _toggle,
                child: Icon(
                  _obscureText
                      ? Icons.remove_red_eye
                      : Icons.remove_red_eye_outlined,
                  size: 15.0,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: openHomePage,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: mainColor),
              child: Center(
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'sfpro'),
                ),
              ),
            ),
          ),
        ]));
  }

  void openHomePage() async {
    if (emailController.text != "demo@gmail.com") {
      return null;
    }
    if (passwordController.text != "demo123") {
      return null;
    }

    if (_formKey.currentState.validate()) {
      await store.dispatch(SetEmail(emailController.text));
      await store.dispatch(SetPassword(passwordController.text));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    }
  }
}
