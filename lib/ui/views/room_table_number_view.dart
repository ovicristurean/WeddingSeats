import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weddings_seats/ui/provider_models/room_tables_model.dart';
import 'package:weddings_seats/ui/views/table_number_dialog.dart';
import 'package:weddings_seats/util/themes.dart';

class RoomTableNumberView extends StatefulWidget {
  final int width;
  final int height;

  RoomTableNumberView(this.width, this.height);

  @override
  _RoomTableNumberViewState createState() => _RoomTableNumberViewState();
}

class _RoomTableNumberViewState extends State<RoomTableNumberView> {
  @override
  Widget build(BuildContext context) {
    var roomTablesModel = context.read<RoomTablesModel>();
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
                  color: roomTablesModel.enabledCells[index] != -1
                      ? Themes.LightPrimaryColor
                      : Themes.DarkPrimaryColor,
                  child: roomTablesModel.enabledCells[index] == -1
                      ? Center(child: Text(""))
                      : Center(
                          child: Text(
                              roomTablesModel.enabledCells[index].toString())),
                ),
                onTap: () {
                  if (roomTablesModel.enabledCells[index] != -1) {
                    setState(() {
                      showTableNumberDialog(roomTablesModel, index);
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

  void showTableNumberDialog(
      RoomTablesModel roomTablesModel, int selectedIndex) {
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
            if (roomTablesModel
                .getEnabledCellsIndexes()
                .contains(selectedTable)) {
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Table number already selected"),
                ),
              );
            } else {
              roomTablesModel.enabledCells[selectedIndex] = selectedTable;
              if (!roomTablesModel.getEnabledCellsIndexes().contains(0)) {
                roomTablesModel.onAllTableNumbersFilled();
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
