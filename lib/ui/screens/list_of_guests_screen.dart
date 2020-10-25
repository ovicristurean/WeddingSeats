import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListOfGuests extends StatefulWidget {
  @override
  _ListOfGuestsState createState() => _ListOfGuestsState();
}

class _ListOfGuestsState extends State<ListOfGuests> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("List of guests"),
            Icon(Icons.add),
          ],
        ),
      ),
    );
  }
}
