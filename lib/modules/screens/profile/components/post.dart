import 'package:flutter/material.dart';
import 'package:pets_adoption_app_ui/constants/textStyle.dart';

class Post extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40)),
          border: Border.all(color: Colors.grey, width: 0.2)),
      child: Column(
        children: <Widget>[
          Container(
            width: size.width * 0.3,
            height: size.width * 0.1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: mainColor),
            child: Center(
              child: Text(
                "My Album",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'sfpro'),
              ),
            ),
          ),
          Container(
              child: Column(children: [
            _myAlbum("assets/images/parrot1.jpeg", "assets/images/parrot2.jpeg",
                "assets/images/parrot3.jpeg"),
            _myAlbum("assets/images/rabbit1.jpeg", "assets/images/rabbit2.jpeg",
                "assets/images/rabbit3.png"),
            _myAlbum("assets/images/dog1.jpeg", "assets/images/dog2.jpeg",
                "assets/images/dog3.jpg"),
          ]))
        ],
      ),
    );
  }

  Widget _myAlbum(String asset1, String asset2, String asset3) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            ClipRRect(
              child: Image.asset(
                asset1,
                height: 110,
                width: 110,
              ),
            ),
            Spacer(),
            ClipRRect(
              child: Image.asset(
                asset2,
                height: 110,
                width: 110,
              ),
            ),
            Spacer(),
            ClipRRect(
              child: Image.asset(
                asset3,
                height: 110,
                width: 110,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
