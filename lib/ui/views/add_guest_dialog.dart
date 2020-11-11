import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddGuestDialog extends StatefulWidget {
  @override
  _AddGuestDialogState createState() => _AddGuestDialogState();
}

class _AddGuestDialogState extends State<AddGuestDialog> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
      child: Material(
        type: MaterialType.transparency,
        child: Center(
          child: Container(
            color: Colors.white70,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          focusColor: Colors.red,
                          border: InputBorder.none,
                          hintText: "First name"),
                      //controller: searchController,
                      onChanged: (String text) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      decoration: InputDecoration(
                          focusColor: Colors.red,
                          border: InputBorder.none,
                          hintText: "Last name"),
                      //controller: searchController,
                      onChanged: (String text) {},
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Guest status: "),
                        DropdownButton(
                          items: [
                            DropdownMenuItem(
                              child: Text("Pending"),
                            ),
                            DropdownMenuItem(
                              child: Text("Confirmed"),
                            ),
                            DropdownMenuItem(
                              child: Text("Not yet invited"),
                            ),
                          ],
                          onChanged: (value) {},
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: InkWell(
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Add guest"),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
