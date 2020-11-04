import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/ui/screens/inherited_room_table_numbers_screen.dart';
import 'package:weddings_seats/ui/views/confirm_table_numbers_view.dart';
import 'package:weddings_seats/ui/views/room_table_number_view.dart';

class RoomTableNumbersScreen extends StatefulWidget {
  List<int> enabledCells;
  int width;
  int height;
  int numberOfCells;

  RoomTableNumbersScreen(this.width, this.height, this.enabledCells) {
    numberOfCells = width * height;
  }

  @override
  _RoomTableNumbersScreenState createState() => _RoomTableNumbersScreenState();
}

class _RoomTableNumbersScreenState extends State<RoomTableNumbersScreen> {
  @override
  Widget build(BuildContext context) {
    return InheritedRoomTableNumbers(
      widget.enabledCells,
      () {
        setState(() {
          //widget.isConfirmEnabled = true;
        });
      },
      child: Scaffold(
        body: SafeArea(
          child: Column(children: [
            Expanded(
              flex: 8,
              child: RoomTableNumberView(widget.width, widget.height),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ConfirmTableNumbersView(),
                  )),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}
