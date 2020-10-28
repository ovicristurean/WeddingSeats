import 'package:flutter/widgets.dart';
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
      child: Center(
        child: Text("Event home screen"),
      ),
    );
  }
}
