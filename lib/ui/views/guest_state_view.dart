import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

class GuestStateView extends StatefulWidget {
  int number;
  String status;

  GuestStateView(this.number, this.status);

  @override
  _GuestStateViewState createState() => _GuestStateViewState();
}

class _GuestStateViewState extends State<GuestStateView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.number.toString()),
        Padding(
          padding: EdgeInsets.only(bottom: 5),
        ),
        Text(widget.status),
      ],
    );
  }
}
