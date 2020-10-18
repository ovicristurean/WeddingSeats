import 'package:flutter/material.dart';

class PhotoCardView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(),
        shadowColor: Colors.grey,
        child: Container(
          color: Color(0xffABBDD8),
          child: Center(child: Text("Here will be the logo"),),
        ),
      ),
    );
  }
}
