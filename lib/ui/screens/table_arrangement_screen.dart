import 'package:flutter/material.dart';
import 'package:weddings_seats/model/table_model.dart';
import 'package:weddings_seats/util/themes.dart';

class TableArrangementScreen extends StatefulWidget {
  TableModel _tableModel;

  TableArrangementScreen(this._tableModel);

  @override
  TableArrangementScreenState createState() {
    return new TableArrangementScreenState();
  }
}

class TableArrangementScreenState extends State<TableArrangementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Table"),
        backgroundColor: Themes.LightPrimaryColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 3,
              children: List.generate(widget._tableModel.guests.length, (index) {
                return Card(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  color: Themes.ColorAccent,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          widget._tableModel.guests[index].name,
                          textAlign: TextAlign.center,
                        ),
                        Icon(Icons.person_pin_outlined),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
