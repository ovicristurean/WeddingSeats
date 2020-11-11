import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weddings_seats/ui/screens/event_overview_screen.dart';
import 'package:weddings_seats/util/themes.dart';

class GoogleLogInCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: InkWell(
        onTap: () => _navigateToOverviewScreen(context),
        child: Card(
          color: Themes.LightPrimaryColor,
          elevation: 5,
          shape: RoundedRectangleBorder(),
          shadowColor: Colors.grey,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                    child: SvgPicture.asset("assets/google-icon.svg"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _navigateToOverviewScreen(BuildContext context) async {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => EventOverviewScreen()));
  }
}
