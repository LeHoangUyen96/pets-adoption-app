import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/modules/screens/profile/components/app_bar.dart';
import 'package:pets_adoption_app_ui/modules/screens/profile/components/infor_user.dart';
import 'package:pets_adoption_app_ui/modules/screens/profile/components/post.dart';
import 'package:pets_adoption_app_ui/modules/screens/setting/edit-profile/components/avarta.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      color: Colors.grey[300],
      child: ListView(
        children: <Widget>[
          AppBarUser(),
          Avarta(),
          SizedBox(height: size.height * 0.01),
          InforUser(),
          SizedBox(height: size.height * 0.01),
          Post(),
        ],
      ),
    );
  }
}
