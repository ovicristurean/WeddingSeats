import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weddings_seats/ui/views/google_log_in_card_view.dart';
import 'package:weddings_seats/ui/views/photo_card_view.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      SizedBox(
          width: double.infinity,
          height: 200,
          child: SvgPicture.asset("assets/wave.svg")),
      Padding(
        padding: const EdgeInsets.only(top: 20),
      ),
      PhotoCardView(),
      Padding(
        padding: const EdgeInsets.only(top: 100),
      ),
      GoogleLogInCardView(),
    ]);
  }
}
