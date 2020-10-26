import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/util/themes.dart';

class GuestView extends StatefulWidget {
  @override
  _GuestViewState createState() => _GuestViewState();
}

class _GuestViewState extends State<GuestView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Themes.LightPrimaryColor,
      elevation: 5,
      shadowColor: Colors.grey,
      child: Text("wip"),
    );
  }
}
