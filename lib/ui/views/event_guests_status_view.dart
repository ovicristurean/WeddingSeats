import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:weddings_seats/bloc/wedding_seats_bloc.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';
import 'package:weddings_seats/ui/screens/inherited_list_of_guests.dart';
import 'package:weddings_seats/ui/views/guest_state_view.dart';
import 'package:weddings_seats/util/themes.dart';

class EventGuestsStatusView extends StatefulWidget {
  @override
  _EventGuestsStatusViewState createState() => _EventGuestsStatusViewState();
}

class _EventGuestsStatusViewState extends State<EventGuestsStatusView> {
  @override
  Widget build(BuildContext context) {
    var weddingSeatsBloc = context.read<WeddingSeatsBloc>();
    weddingSeatsBloc.requestNumberOfGuests();
    return StreamBuilder(
      stream: weddingSeatsBloc.guestsCount,
      builder: (BuildContext context,
          AsyncSnapshot<Map<GuestStatus, int>> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Card(
              color: Themes.DarkPrimaryColor,
              elevation: 5,
              shadowColor: Colors.grey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Wedding guest status"),
                  CarouselSlider(
                    items: [
                      GuestStateView(snapshot.data[GuestStatus.PENDING],
                          getNameFromStatus(GuestStatus.PENDING)),
                      GuestStateView(snapshot.data[GuestStatus.CONFIRMED],
                          getNameFromStatus(GuestStatus.CONFIRMED)),
                      GuestStateView(snapshot.data[GuestStatus.NOT_YET_INVITED],
                          getNameFromStatus(GuestStatus.NOT_YET_INVITED)),
                    ],
                    options: CarouselOptions(
                        height: 70,
                        aspectRatio: 16 / 9,
                        viewportFraction: 0.33,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        reverse: false,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, changeReason) {
                          InheritedListOfGuests.of(context)
                              .onPageChanged(mapFromIndex(index));
                        }),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(
            child: Text("Loading"),
          );
        }
      },
    );
  }

  GuestStatus mapFromIndex(int index) {
    switch (index) {
      case 0:
        return GuestStatus.PENDING;
        break;
      case 1:
        return GuestStatus.CONFIRMED;
        break;
      case 2:
        return GuestStatus.NOT_YET_INVITED;
        break;
    }
  }

  String getNameFromStatus(GuestStatus status) {
    switch (status) {
      case GuestStatus.NOT_YET_INVITED:
        return "Not yet invited";
      case GuestStatus.CONFIRMED:
        return "Confirmed";
      case GuestStatus.PENDING:
        return "Pending";
    }
  }
}
