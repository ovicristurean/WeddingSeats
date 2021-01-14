import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weddings_seats/bloc/wedding_seats_bloc.dart';
import 'package:weddings_seats/inherited/inherited_wedding_data.dart';
import 'package:weddings_seats/model/guest_model.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';
import 'package:weddings_seats/ui/screens/inherited_list_of_guests.dart';
import 'package:weddings_seats/ui/views/add_guest_dialog.dart';
import 'package:weddings_seats/ui/views/event_guests_status_view.dart';
import 'package:weddings_seats/ui/views/guest_list_view.dart';
import 'package:weddings_seats/util/themes.dart';

class ListOfGuests extends StatefulWidget {
  @override
  _ListOfGuestsState createState() => _ListOfGuestsState();
}

class _ListOfGuestsState extends State<ListOfGuests> {
  String editTextValue = "";
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    WeddingSeatsBloc weddingSeatsBloc =
        InheritedWeddingData.of(context).weddingSeatsBloc;
    weddingSeatsBloc.requestGuests();
    GuestListView guestListView = GuestListView(List());
    GuestStatus currentGuestStatus = GuestStatus.PENDING;
    return InheritedListOfGuests(
      (GuestStatus status) {
        currentGuestStatus = status;
        weddingSeatsBloc.updateVisibleGuests(status);
      },
      child: StreamBuilder(
        stream: weddingSeatsBloc.requestGuests(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasData) {
            weddingSeatsBloc.storeGuestsFromSnapshot(snapshot.data);
            //guestListView = GuestListView(weddingSeatsBloc.getGuests(currentGuestStatus));
            return SafeArea(
              child: Scaffold(
                body: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                        Themes.PrimaryColor,
                        Themes.LightPrimaryColor
                      ])),
                  child: Column(
                    children: [
                      EventGuestsStatusView(),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Card(
                          color: Themes.DarkPrimaryColor,
                          elevation: 5,
                          shadowColor: Colors.grey,
                          child: Row(
                            children: [
                              Flexible(
                                child: TextField(
                                  decoration: InputDecoration(
                                      focusColor: Colors.red,
                                      border: InputBorder.none,
                                      hintText: "Search for a guest"),
                                  controller: searchController,
                                  onChanged: (String text) {},
                                ),
                              ),
                              InkWell(
                                child: Icon(Icons.search),
                                onTap: () {
                                  // setState(() {
                                  searchController.text =
                                      "Value in text field is " +
                                          searchController.text;
                                  //});
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Flexible(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                          child: StreamBuilder(
                              stream: weddingSeatsBloc.guestList,
                              builder: (context, snapshot) {
                                weddingSeatsBloc.updateVisibleGuests(currentGuestStatus);
                                if (snapshot.hasData) {
                                  return GuestListView(snapshot.data);
                                } else {
                                  return Center(
                                    child: Text("Updating the guests"),
                                  );
                                }
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
                floatingActionButton: FloatingActionButton(
                  elevation: 5,
                  backgroundColor: Themes.DarkPrimaryColor,
                  child: Icon(Icons.add),
                  onPressed: () {
                    showGeneralDialog(
                        context: context,
                        barrierDismissible: true,
                        barrierLabel: "",
                        pageBuilder: (BuildContext buildContext,
                            Animation<double> animation,
                            Animation<double> secondaryAnimation) {
                          return AddGuestDialog((guestModel) {
                            weddingSeatsBloc.addGuest(guestModel);
                          });
                        });
                  },
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

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
