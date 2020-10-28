import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:weddings_seats/bloc/wedding_seats_bloc.dart';
import 'package:weddings_seats/inherited/inherited_wedding_data.dart';
import 'package:weddings_seats/model/guest_model.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';
import 'package:weddings_seats/ui/screens/inherited_list_of_guests.dart';
import 'package:weddings_seats/ui/views/event_guests_status_view.dart';
import 'package:weddings_seats/ui/views/guest_view.dart';
import 'package:weddings_seats/util/themes.dart';

class ListOfGuests extends StatefulWidget {
  @override
  _ListOfGuestsState createState() => _ListOfGuestsState();
}

class _ListOfGuestsState extends State<ListOfGuests> {
  @override
  Widget build(BuildContext context) {
    WeddingSeatsBloc weddingSeatsBloc =
        InheritedWeddingData.of(context).weddingSeatsBloc;
    weddingSeatsBloc.requestGuests(GuestStatus.PENDING);
    return InheritedListOfGuests(
      (GuestStatus status) {
        weddingSeatsBloc.requestGuests(status);
      },
      child: StreamBuilder(
        stream: weddingSeatsBloc.guestList,
        builder: (context, AsyncSnapshot<List<GuestModel>> snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [Themes.PrimaryColor, Themes.LightPrimaryColor])),
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: EventGuestsStatusView(),
                    ),
                    Expanded(
                      flex: 7,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Container(
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return GuestView(snapshot.data[index].name,
                                  snapshot.data[index].id.toString(), getColorForCell(index));
                            },
                            itemCount: snapshot.data.length,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Center(
              child: Text("Fetching guests"),
            );
          }
        },
      ),
    );
  }

  Color getColorForCell(int index) {
    if (index % 2 == 0) {
      return Themes.AeroBLue;
    }
    return Themes.ColorAccent;
  }
}
