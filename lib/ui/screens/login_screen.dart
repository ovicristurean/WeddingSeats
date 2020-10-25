import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weddings_seats/ui/views/google_log_in_card_view.dart';
import 'package:weddings_seats/ui/views/photo_card_view.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
          flex: 3,
          child: SvgPicture.asset(
            "assets/wave.svg",
            fit: BoxFit.fitWidth,
          )),
      Expanded(flex: 4, child: Center(child: PhotoCardView())),
      Expanded(flex: 3, child: Center(child: GoogleLogInCardView())),
    ]);
  }
}
