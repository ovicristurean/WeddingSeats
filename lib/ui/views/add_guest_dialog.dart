import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weddings_seats/mapper/model_mapper.dart';
import 'package:weddings_seats/model/guest_model.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';

class AddGuestDialog extends StatefulWidget {
  Function(GuestModel) onAddGuest;

  AddGuestDialog(this.onAddGuest);

  @override
  _AddGuestDialogState createState() => _AddGuestDialogState();
}

class _AddGuestDialogState extends State<AddGuestDialog> {
  String _firstName = "";
  String _lastName = "";
  GuestStatus _guestStatus = GuestStatus.PENDING;
  bool areInputsValid = true;

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
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              focusColor: Colors.red,
                              border: InputBorder.none,
                              hintText: "First name"),
                          //controller: searchController,
                          onChanged: (String text) {
                            _firstName = text;
                          },
                        ),
                        Visibility(
                          child: Text("Please add a first name"),
                          visible: _firstName.isEmpty && !areInputsValid,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                              focusColor: Colors.red,
                              border: InputBorder.none,
                              hintText: "Last name"),
                          //controller: searchController,
                          onChanged: (String text) {
                            _lastName = text;
                          },
                        ),
                        Visibility(
                          child: Text("Please add a last name"),
                          visible: _lastName.isEmpty && !areInputsValid,
                        ),
                      ],
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
                          onChanged: (value) {
                            _guestStatus =
                                ModelMapper.getStatusFromString(value);
                          },
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
                        validateInput();
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

  void validateInput() {
    if (_firstName.isEmpty || _lastName.isEmpty) {
      setState(() {
        areInputsValid = false;
      });
    } else {
      widget.onAddGuest(GuestModel(1, _firstName + _lastName, _guestStatus));
      Navigator.pop(context);
    }
  }

  GuestStatus getStatusFromString(String status) {
    if (status == "Not yet invited") {
      return GuestStatus.NOT_YET_INVITED;
    } else if (status == "Pending") {
      return GuestStatus.PENDING;
    } else if (status == "Confirmed") {
      return GuestStatus.CONFIRMED;
    }

    return GuestStatus.NOT_YET_INVITED;
  }
}
