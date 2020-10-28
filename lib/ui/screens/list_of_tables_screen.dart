import 'package:flutter/material.dart';
import 'package:weddings_seats/bloc/wedding_seats_bloc.dart';
import 'package:weddings_seats/inherited/inherited_wedding_data.dart';
import 'package:weddings_seats/model/table_model.dart';
import 'package:weddings_seats/util/themes.dart';

class SeatsList extends StatefulWidget {
  @override
  _SeatsListState createState() => _SeatsListState();
}

class _SeatsListState extends State<SeatsList> {
  @override
  Widget build(BuildContext context) {
    WeddingSeatsBloc weddingSeatsBloc =
        InheritedWeddingData.of(context).weddingSeatsBloc;
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
                return Card(
                  elevation: 5,
                  shadowColor: Colors.grey,
                  color: getColor(index),
                  child: Center(
                    child: Text(
                      'Table nr. ${snapshot.data[index].number}',
                      style: Theme.of(context).textTheme.headline5,
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
