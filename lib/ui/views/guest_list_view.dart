import 'package:flutter/widgets.dart';
import 'package:weddings_seats/model/guest_model.dart';
import 'package:weddings_seats/util/themes.dart';

import 'guest_view.dart';

class GuestListView extends StatefulWidget {
  List<GuestModel> _guests;

  GuestListView(this._guests);

  _GuestListViewState state = _GuestListViewState();

  @override
  _GuestListViewState createState() => state;

  void setItems(List<GuestModel> guests) {
    _guests = guests;
  }

  void updateItems(List<GuestModel> guests) {
    state.setItems(guests);
  }
}

class _GuestListViewState extends State<GuestListView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GuestView(
              widget._guests[index].name,
              widget._guests[index].id.toString(),
              getColorForCell(index));
        },
        itemCount: widget._guests.length,
      ),
    );
  }

  Color getColorForCell(int index) {
    if (index % 2 == 0) {
      return Themes.AeroBLue;
    }
    return Themes.ColorAccent;
  }

  void setItems(List<GuestModel> guests) {
    setState(() {
      widget._guests = guests;
    });
  }
}
