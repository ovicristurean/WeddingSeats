import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddings_seats/ui/views/event_guests_status_view.dart';

class ListOfGuests extends StatefulWidget {
  @override
  _ListOfGuestsState createState() => _ListOfGuestsState();
}

class _ListOfGuestsState extends State<ListOfGuests> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          EventGuestsStatusView(),
        ],
      ),
    );
  }
}
