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
    List<int> enabledCells = InheritedRoomTableNumbers.of(context).enabledCells;
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
                  color: enabledCells[index] != -1
                      ? Themes.LightPrimaryColor
                      : Themes.DarkPrimaryColor,
                  child: enabledCells[index] == -1
                      ? Center(child: Text(""))
                      : Center(child: Text(enabledCells[index].toString())),
                ),
                onTap: () {
                  if (enabledCells[index] != -1) {
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
            if (InheritedRoomTableNumbers.of(context)
                .getEnabledCellsIndexes()
                .contains(selectedTable)) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Table number already selected"),
                ),
              );
            } else {
              InheritedRoomTableNumbers.of(context)
                  .enabledCells[selectedIndex] = selectedTable;
              if (!InheritedRoomTableNumbers.of(context)
                  .getEnabledCellsIndexes()
                  .contains(0)) {
                InheritedRoomTableNumbers.of(context).onAllTableNumbersFilled();
              }
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
