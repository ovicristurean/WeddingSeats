import 'package:flutter/widgets.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:weddings_seats/model/event_model.dart';

import 'countdown_timer_view.dart';

class EventDetailsView extends StatefulWidget {
  EventModel _eventModel;

  EventDetailsView(this._eventModel);

  @override
  _EventDetailsViewState createState() => _EventDetailsViewState();
}

class _EventDetailsViewState extends State<EventDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget._eventModel.name),
        Text(widget._eventModel.place),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CountdownTimer(
            endTime: widget._eventModel.date,
            widgetBuilder: (_, CurrentRemainingTime time) {
              return CountdownTimerView(
                  time.days, time.hours, time.min, time.sec);
            },
          ),
        ),
      ],
    );
  }
}
