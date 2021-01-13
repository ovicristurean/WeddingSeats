

import 'package:weddings_seats/repository/guest_data_source.dart';

class GuestsDto {
  List<GuestDto> guests;

  GuestsDto(this.guests);
}

class GuestDto {
  int id;
  String name;
  String photoUrl;
  GuestStatus guestStatus;

  GuestDto(this.id, this.name, this.photoUrl, this.guestStatus);
}
