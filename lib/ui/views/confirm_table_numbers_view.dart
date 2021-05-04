import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weddings_seats/ui/provider_models/room_tables_model.dart';
import 'package:weddings_seats/util/themes.dart';

class ConfirmTableNumbersView extends StatefulWidget {
  @override
  _ConfirmTableNumbersViewState createState() =>
      _ConfirmTableNumbersViewState();
}

class _ConfirmTableNumbersViewState extends State<ConfirmTableNumbersView> {
  @override
  Widget build(BuildContext context) {
    var roomTablesModel = context.read<RoomTablesModel>();
    return InkWell(
      child: Card(
        color: !roomTablesModel.getEnabledCellsIndexes().contains(0)
            ? Themes.LightPrimaryColor
            : Themes.DarkPrimaryColor,
        child: Center(child: Text("Confirm")),
      ),
      onTap: () {
        if (!roomTablesModel.getEnabledCellsIndexes().contains(0)) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Confirm the numbered tables"),
          ));
        }
      },
    );
  }
}
