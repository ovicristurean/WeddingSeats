import 'package:flutter/cupertino.dart';
import 'package:weddings_seats/ui/screens/event_home_screen.dart';
import 'package:weddings_seats/ui/screens/list_of_guests_screen.dart';
import 'package:weddings_seats/ui/screens/seats_screen.dart';

enum BottomItemType { HOME, GUESTS, SEATS }

class ScreenNavigationWrapper extends StatefulWidget {
  BottomItemType bottomItemType;

  ScreenNavigationWrapper(this.bottomItemType);

  @override
  _ScreenNavigationWrapperState createState() =>
      _ScreenNavigationWrapperState();
}

class _ScreenNavigationWrapperState extends State<ScreenNavigationWrapper> {
  @override
  Widget build(BuildContext context) {
    switch (widget.bottomItemType) {
      case BottomItemType.HOME:
        return EventHomeScreen();
      case BottomItemType.GUESTS:
        return ListOfGuests();
      case BottomItemType.SEATS:
        return SeatsList();
      default:
        return ListOfGuests();
    }
  }
}
