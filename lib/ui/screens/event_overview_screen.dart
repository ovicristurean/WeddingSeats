import 'package:flutter/material.dart';
import 'package:weddings_seats/ui/screens/bottom_items_wrapper.dart';
import 'package:weddings_seats/ui/screens/inherited_main_screen.dart';
import 'package:weddings_seats/ui/views/bottom_navigation_menu.dart';
import 'package:weddings_seats/util/themes.dart';

class EventOverviewScreen extends StatefulWidget {
  @override
  _EventOverviewScreenState createState() => _EventOverviewScreenState();
}

class _EventOverviewScreenState extends State<EventOverviewScreen> {
  var bottomItemType = BottomItemType.values[0];
  var title = "Wedding Seats";

  @override
  Widget build(BuildContext context) {
    return InheritedMainScreen(
      (BottomItemType type) {
        setState(() {
          bottomItemType = type;
        });
      },
      (String newTitle) {
        //setState(() {
          title = newTitle;
        //});
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: Themes.LightPrimaryColor,
        ),
        body: ScreenNavigationWrapper(bottomItemType),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Themes.LightPrimaryColor,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Themes.PrimaryColor,
            primaryColorDark: Themes.DarkPrimaryColor,
            accentColor: Themes.ColorAccent,
          ),
          child: BottomNavigationMenu(),
        ),
      ),
    );
  }
}
