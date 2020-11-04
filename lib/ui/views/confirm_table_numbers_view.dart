import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/ui/screens/inherited_room_table_numbers_screen.dart';
import 'package:weddings_seats/util/themes.dart';

class ConfirmTableNumbersView extends StatefulWidget {

  @override
  _ConfirmTableNumbersViewState createState() =>
      _ConfirmTableNumbersViewState();
}

class _ConfirmTableNumbersViewState extends State<ConfirmTableNumbersView> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        color: !InheritedRoomTableNumbers.of(context).getEnabledCellsIndexes().contains(0)
            ? Themes.LightPrimaryColor
            : Themes.DarkPrimaryColor,
        child: Center(child: Text("Confirm")),
      ),
      onTap: () {
        if (!InheritedRoomTableNumbers.of(context)
            .getEnabledCellsIndexes()
            .contains(0)) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Center(
              child: Text("Confirm the numbered tables"),
            ),
          ));
        }
      },
    );
  }
}
