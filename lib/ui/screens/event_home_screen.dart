
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:weddings_seats/bloc/wedding_seats_bloc.dart';
import 'package:weddings_seats/model/event_model.dart';
import 'package:weddings_seats/ui/views/event_details_view.dart';
import 'package:weddings_seats/util/themes.dart';
import 'package:provider/provider.dart';

class EventHomeScreen extends StatefulWidget {
  @override
  _EventHomeScreenState createState() => _EventHomeScreenState();
}

class _EventHomeScreenState extends State<EventHomeScreen> {
  @override
  Widget build(BuildContext context) {
    var weddingSeatsBloc = context.read<WeddingSeatsBloc>();
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Themes.PrimaryColor, Themes.DarkPrimaryColor])),
      child: Container(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SvgPicture.asset(
              "assets/wave.svg",
              fit: BoxFit.fitWidth,
              alignment: Alignment.topLeft,
            ),
            Positioned(
              child: Center(
                child: FractionallySizedBox(
                  heightFactor: 0.75,
                  widthFactor: 0.9,
                  child: Container(
                    child: Card(
                      color: Colors.white70,
                      elevation: 5,
                      shape: RoundedRectangleBorder(),
                      shadowColor: Colors.grey,
                      child: StreamBuilder(
                          stream: weddingSeatsBloc.getEventDetailsStream(1),
                          builder: (BuildContext context,
                              AsyncSnapshot<QuerySnapshot> snapshot) {
                            if (!snapshot.hasData) {
                              return Center(
                                child: Text("Loading wedding data"),
                              );
                            }
                            EventModel eventModel = weddingSeatsBloc
                                .getEventModelFromSnapshot(snapshot.data.docs[0]);
                            return EventDetailsView(eventModel);
                          }),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
