import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/ui/views/guest_state_view.dart';
import 'package:weddings_seats/util/themes.dart';

class EventGuestsStatusView extends StatefulWidget {
  @override
  _EventGuestsStatusViewState createState() => _EventGuestsStatusViewState();
}

class _EventGuestsStatusViewState extends State<EventGuestsStatusView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Card(
        color: Themes.LightPrimaryColor,
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
                    GuestStateView(23, "Pending"),
                    GuestStateView(114, "Confirmed"),
                    GuestStateView(40, "Not yet invited"),
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
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
