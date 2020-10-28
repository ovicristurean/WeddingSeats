import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/util/themes.dart';

class GuestView extends StatefulWidget {
  String name;
  String tableNumber;
  Color cellColor;

  GuestView(this.name, this.tableNumber, this.cellColor);

  @override
  _GuestViewState createState() => _GuestViewState();
}

class _GuestViewState extends State<GuestView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.cellColor,
      elevation: 5,
      shadowColor: Colors.grey,
      child: ListTile(
        leading: Icon(Icons.person_pin_outlined),
        title: Column(
          children: [
            Text(widget.name),
            Text(widget.tableNumber),
          ],
        ),
      ),
    );
  }
}
