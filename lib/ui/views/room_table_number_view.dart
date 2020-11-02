import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/ui/screens/inherited_room_table_numbers_screen.dart';
import 'package:weddings_seats/ui/views/table_number_dialog.dart';
import 'package:weddings_seats/util/themes.dart';

class RoomTableNumberView extends StatefulWidget {
  int width;
  int height;

  RoomTableNumberView(this.width, this.height);

  @override
  _RoomTableNumberViewState createState() => _RoomTableNumberViewState();
}

class _RoomTableNumberViewState extends State<RoomTableNumberView> {
  @override
  Widget build(BuildContext context) {
    List<bool> enabledCells =
        InheritedRoomTableNumbers.of(context).enabledCells;
    List<int> tableNumbers = InheritedRoomTableNumbers.of(context).tableNumbers;
    return Container(
      child: GridView.count(
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        crossAxisCount: widget.width,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(widget.width * widget.height, (index) {
          return Container(
            child: ClipOval(
              child: InkWell(
                child: Card(
                  color: enabledCells[index]
                      ? Themes.LightPrimaryColor
                      : Themes.DarkPrimaryColor,
                  child: tableNumbers[index] == 0
                      ? Center(child: Text(""))
                      : Center(child: Text(tableNumbers[index].toString())),
                ),
                onTap: () {
                  if (enabledCells[index]) {
                    setState(() {
                      showTableNumberDialog(index);
                    });
                  }
                },
              ),
            ),
          );
        }),
      ),
    );
  }

  void showTableNumberDialog(int selectedIndex) {
    List<int> tableNumbers = InheritedRoomTableNumbers.of(context).tableNumbers;
    int selectedTable = 1;
    showGeneralDialog(
      context: context,
      pageBuilder: (BuildContext buildContext, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return TableNumberDialog(widget.width * widget.height, (newValue) {
          setState(() {
            selectedTable = newValue;
          });
        }, () {
          setState(() {
            if (tableNumbers.contains(selectedTable)) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Table number already selected"),
                ),
              );
            } else {
              tableNumbers[selectedIndex] = selectedTable;
            }
            Navigator.pop(context);
          });
        });
      },
      barrierDismissible: true,
      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: Colors.transparent,
      transitionDuration: const Duration(milliseconds: 200),
    );
  }
}
