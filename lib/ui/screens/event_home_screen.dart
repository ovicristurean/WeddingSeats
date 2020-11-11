import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weddings_seats/ui/views/countdown_timer_view.dart';
import 'package:weddings_seats/util/themes.dart';

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Themes.PrimaryColor, Themes.DarkPrimaryColor])),
      child: Container(
        //epoch - 1622912400
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SvgPicture.asset(
              "assets/wave.svg",
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft,
            ),
            Positioned(
              top: 100,
              bottom: 20,
              child: Container(
                child: Card(
                  color: Colors.white70,
                  elevation: 5,
                  shape: RoundedRectangleBorder(),
                  shadowColor: Colors.grey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Nunta santimbreana"),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CountdownTimer(
                          endTime: 1622912400000,
                          widgetBuilder: (_, CurrentRemainingTime time) {
                              return CountdownTimerView(time.days, time.hours, time.min, time.sec);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
