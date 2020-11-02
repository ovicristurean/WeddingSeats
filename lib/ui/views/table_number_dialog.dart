import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'number_picker_view.dart';

class TableNumberDialog extends StatefulWidget {
  int currentTableNumber = 1;
  int numberPickerCount;
  Function(int) onValueChanged;
  VoidCallback onConfirmClicked;

  TableNumberDialog(
      this.numberPickerCount, this.onValueChanged, this.onConfirmClicked);

  @override
  _TableNumberDialogState createState() => _TableNumberDialogState();
}

class _TableNumberDialogState extends State<TableNumberDialog> {
  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Center(
        child: Container(
          width: 200.0,
          height: 200.0,
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Text("Table number"),
              ),
              Expanded(
                flex: 4,
                child: NumberPickerView(1, widget.numberPickerCount, 1, (newValue) {
                  widget.onValueChanged(newValue);
                }),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 100,
                  height: 30,
                  child: InkWell(
                    child: Card(
                      child: Center(
                        child: Text("OK"),
                      ),
                    ),
                    onTap: () {
                      widget.onConfirmClicked();
                    },
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
