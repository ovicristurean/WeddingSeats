import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weddings_seats/util/themes.dart';

class GoogleLogInCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return /* Row(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20),
          ),
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(),
            shadowColor: Colors.grey,
          ),
          Padding(
            padding: EdgeInsets.only(right: 20),
          ),
        ],
      );*/
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20),
        ),
        Expanded(
          child: SizedBox(
            width: double.infinity,
            height: 70,
            child: Card(
              color: Themes.LightPrimaryColor,
              elevation: 5,
              shape: RoundedRectangleBorder(),
              shadowColor: Colors.grey,
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Log in with"),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                  ),
                  SizedBox(
                      width: 35,
                      height: 35,
                      child: SvgPicture.asset("assets/google-icon.svg")),
                ],
              )),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 20),
        ),
      ],
    );
  }
}
