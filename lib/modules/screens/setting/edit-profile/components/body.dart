import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/edit-profile/components/avarta.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/edit-profile/redux/reducer.dart';
import 'package:pets_adoption_app_ui/redux/store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class EditProfilePage extends StatefulWidget {
  EditProfilePage() : super();
  @override
  EditProfilePageState createState() => EditProfilePageState();
}

enum Gender { male, female }

class EditProfilePageState extends State<EditProfilePage> {
  String name = "";
  String email = "";
  String phone = "";
  String gender = "";
  String location = "";
  TextEditingController fullnameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController locationController = TextEditingController();
  @override
  void initState() {
    super.initState();
    setData();
  }

  String getGender(Gender gender) {
    switch (gender) {
      case Gender.female:
        return 'Female';
        break;
      case Gender.male:
        return 'Male';
        break;
      default:
        return '';
    }
  }

  Gender _character = Gender.female;

  Future<String> loadData() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      name = preferences.getString('name') ?? '';
      email = preferences.getString('email') ?? '';
      phone = preferences.getString('phone') ?? '';
      gender = preferences.getString('gender') ?? '';
      location = preferences.getString('location') ?? '';
    });
    return preferences.getString('');
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
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: ListView(
          children: [
            Center(
              child: Stack(
                children: [Avarta()],
              ),
            ),
            TextField(
              controller: fullnameController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.person,
                  color: mainColor,
                ),
                labelText: 'FullName',
                enabledBorder: InputBorder.none,
              ),
            ),
            TextFormField(
              autovalidate: true,
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: mainColor,
                ),
                labelText: 'E-mail',
                enabledBorder: InputBorder.none,
              ),
              validator: (String value) {
                if (!RegExp(
                        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                    .hasMatch(value)) {
                  return 'Please enter type abc@gmail.com';
                }
                return null;
              },
            ),
            TextField(
              controller: phoneController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.phone,
                  color: mainColor,
                ),
                labelText: 'Phone',
                enabledBorder: InputBorder.none,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text("Gender",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            RadioListTile<Gender>(
              title: const Text('Female'),
              value: Gender.female,
              groupValue: _character,
              onChanged: (Gender value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            RadioListTile<Gender>(
              title: const Text('Male'),
              value: Gender.male,
              groupValue: _character,
              onChanged: (Gender value) {
                setState(() {
                  _character = value;
                });
              },
            ),
            TextField(
              controller: locationController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.location_city,
                  color: mainColor,
                ),
                labelText: 'Location',
                enabledBorder: InputBorder.none,
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RaisedButton(
                  onPressed: () async {
                    name = fullnameController.text;
                    location = locationController.text;
                    phone = phoneController.text;
                    email = emailController.text;
                    gender = getGender(_character);
                    await store.dispatch(setUserInfo(
                      name: name,
                      phone: phone,
                      gender: gender,
                      location: location,
                      email: email,
                    ));
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text('Saved')));
                  },
                  color: mainColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    "SAVE",
                    style: TextStyle(
                        fontSize: 14, letterSpacing: 2.2, color: Colors.white),
                  ),
                )
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
