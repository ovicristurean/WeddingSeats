import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weddings_seats/bloc/wedding_seats_bloc.dart';
import 'package:weddings_seats/model/table_model.dart';
import 'package:weddings_seats/ui/screens/configurable_table_layout.dart';
import 'package:weddings_seats/ui/screens/table_arrangement_screen.dart';
import 'package:weddings_seats/util/themes.dart';

class SeatsList extends StatefulWidget {
  @override
  _SeatsListState createState() => _SeatsListState();
}

class _SeatsListState extends State<SeatsList> {
  @override
  Widget build(BuildContext context) {
    var weddingSeatsBloc = context.read<WeddingSeatsBloc>();
    weddingSeatsBloc.requestTables();
    return SafeArea(
        child: StreamBuilder(
      stream: weddingSeatsBloc.tables,
      builder:
          (BuildContext context, AsyncSnapshot<List<TableModel>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: GridView.count(
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
              crossAxisCount: 2,
              // Generate 100 widgets that display their index in the List.
              children: List.generate(snapshot.data.length, (index) {
                return InkWell(
                  onTap: () {
                    TableModel tableModel = snapshot.data[0];
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                TableArrangementScreen(tableModel)));
                  },
                  child: Card(
                    elevation: 5,
                    shadowColor: Colors.grey,
                    color: getColor(index),
                    child: Center(
                      child: Text(
                        'Table\n ${snapshot.data[index].number}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: Themes.LightPrimaryColor,
              child: Center(
                child: Icon(Icons.add),
              ),
              elevation: 5,
              onPressed: () {
                TableModel tableModel = snapshot.data[0];
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ConfigurableTableLayout(10, 10)));
              },
            ),
          );
        } else {
          return Center(
            child: Text("Loading tables"),
          );
        }
      },
    ));
  }

  Color getColor(int index) {
    if (index % 3 == 0) {
      return Themes.AeroBLue;
    }
    return Themes.ColorAccent;
  }
}
