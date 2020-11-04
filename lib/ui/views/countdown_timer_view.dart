import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CountdownTimerView extends StatefulWidget {
  int days;
  int hours;
  int minutes;
  int seconds;

  CountdownTimerView(this.days, this.hours, this.minutes, this.seconds);

  @override
  _CountdownTimerViewState createState() => _CountdownTimerViewState();
}

class _CountdownTimerViewState extends State<CountdownTimerView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      child: Card(
        color: Colors.grey,
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Days"),
                    Text(widget.days.toString()),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Hours"),
                    Text(widget.hours.toString()),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Minutes"),
                    Text(widget.minutes.toString()),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  children: [
                    Text("Seconds"),
                    Text(widget.seconds.toString()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
