import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/util/themes.dart';

class RoomSetupView extends StatefulWidget {
  int width;
  int height;
  List<bool> enabledCells;
  int currentTableNumber = 0;
  _RoomSetupViewState state = _RoomSetupViewState();

  RoomSetupView(this.width, this.height) {
    enabledCells = List.generate(width * height, (index) => false);
  }

  @override
  _RoomSetupViewState createState() => state;

  void resetCells() {
    state._resetCells();
  }

  void assignNumber(int tableNumber) {}
}

class _RoomSetupViewState extends State<RoomSetupView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: GridView.count(
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: widget.width,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(widget.width * widget.height, (index) {
          return ClipOval(
            child: Container(
              color: widget.enabledCells[index] ? Themes.LightPrimaryColor : Themes.DarkPrimaryColor,
              child: ListTile(onTap: () {
                setState(() {
                  widget.enabledCells[index] = !widget.enabledCells[index];
                });
              }),
            ),
          );
        }),
      ),
    );
  }

  _resetCells() {
    setState(() {
      widget.enabledCells =
          List.generate(widget.width * widget.height, (index) => false);
    });
  }
}
