import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/ui/screens/inherited_room_table_numbers_screen.dart';
import 'package:weddings_seats/ui/views/room_table_number_view.dart';

class RoomTableNumbersScreen extends StatefulWidget {
  List<bool> enabledCells;
  int width;
  int height;

  RoomTableNumbersScreen(this.width, this.height, this.enabledCells);

  @override
  _RoomTableNumbersScreenState createState() => _RoomTableNumbersScreenState();
}

class _RoomTableNumbersScreenState extends State<RoomTableNumbersScreen> {
  @override
  Widget build(BuildContext context) {
    return InheritedRoomTableNumbers(
      widget.enabledCells,
      List.generate(widget.width * widget.height, (index) => 0),
      (String) {
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(children: [
            Expanded(
              child: RoomTableNumberView(widget.width, widget.height),
            ),
          ]),
        ),
      ),
    );
  }
}
