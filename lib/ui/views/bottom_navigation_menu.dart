import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddings_seats/ui/screens/bottom_items_wrapper.dart';
import 'package:weddings_seats/ui/screens/inherited_main_screen.dart';
import 'package:weddings_seats/util/themes.dart';

class BottomNavigationMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return BottomNavigationState();
  }
}

class BottomNavigationState extends State<BottomNavigationMenu> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'List of guests',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event_seat),
          label: 'Tables',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Themes.PrimaryColor,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int selectedItem) {
    setState(() {
      _selectedIndex = selectedItem;
      BottomItemType bottomItemType;
      switch (selectedItem) {
        case 0:
          bottomItemType = BottomItemType.HOME;
          break;
        case 1:
          bottomItemType = BottomItemType.GUESTS;
          break;
        default:
          bottomItemType = BottomItemType.SEATS;
          break;
      }
      InheritedMainScreen.of(context).onPageChanged(bottomItemType);
    });
  }
}
