import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/ui/screens/inherited_configurable_table_layout.dart';
import 'package:weddings_seats/ui/screens/room_table_numbers_screen.dart';
import 'package:weddings_seats/ui/views/room_setup_view.dart';
import 'package:weddings_seats/util/themes.dart';

class ConfigurableTableLayout extends StatefulWidget {
  int width;
  int height;
  RoomSetupView roomSetupView;

  ConfigurableTableLayout(this.width, this.height) {
    roomSetupView = RoomSetupView(width, height);
  }

  @override
  _ConfigurableTableLayoutState createState() =>
      _ConfigurableTableLayoutState();
}

class _ConfigurableTableLayoutState extends State<ConfigurableTableLayout> {
  @override
  Widget build(BuildContext context) {
    return InheritedConfigurableTableLayout(
      widget.roomSetupView,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Configure your room"),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: widget.roomSetupView,
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 2,
                      child: getResetWidget(),
                    ),
                    Expanded(
                      flex: 2,
                      child: getConfirmWidget(),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getResetWidget() {
    return Container(
        child: InkWell(
      child: Card(
        color: Themes.LightPrimaryColor,
        elevation: 5,
        shape: RoundedRectangleBorder(),
        shadowColor: Colors.grey,
        child: Center(
          child: Text("Reset"),
        ),
      ),
      onTap: () {
        setState(() {
          widget.roomSetupView.resetCells();
        });
      },
    ));
  }

  Widget getConfirmWidget() {
    return Container(
      child: InkWell(
        child: Card(
          color: Themes.LightPrimaryColor,
          elevation: 5,
          shape: RoundedRectangleBorder(),
          shadowColor: Colors.grey,
          child: Center(
            child: Text("Confirm"),
          ),
        ),
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RoomTableNumbersScreen(widget.width,
                      widget.height, widget.roomSetupView.enabledCells)));
        },
      ),
    );
  }
}
