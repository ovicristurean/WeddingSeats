import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/bloc/wedding_seats_bloc.dart';
import 'package:weddings_seats/inherited/inherited_wedding_data.dart';
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
    WeddingSeatsBloc weddingSeatsBloc =
        InheritedWeddingData.of(context).weddingSeatsBloc;
    weddingSeatsBloc.requestNumberOfGuests();
    return StreamBuilder(
      stream: weddingSeatsBloc.guestsCount,
      builder: (BuildContext context,
          AsyncSnapshot<Map<GuestStatus, int>> snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: Card(
              color: Themes.DarkPrimaryColor,
              elevation: 5,
              shadowColor: Colors.grey,
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Wedding guest status"),
                    Padding(
                      padding: EdgeInsets.only(top: 10),
                    ),
                    Container(
                      height: 50,
                      child: CarouselSlider(
                        items: [
                          GuestStateView(snapshot.data[GuestStatus.PENDING],
                              getNameFromStatus(GuestStatus.PENDING)),
                          GuestStateView(snapshot.data[GuestStatus.CONFIRMED],
                              getNameFromStatus(GuestStatus.CONFIRMED)),
                          GuestStateView(
                              snapshot.data[GuestStatus.NOT_YET_INVITED],
                              getNameFromStatus(GuestStatus.NOT_YET_INVITED)),
                        ],
                        options: CarouselOptions(
                            height: 100,
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
                    ),
                  ],
                ),
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
