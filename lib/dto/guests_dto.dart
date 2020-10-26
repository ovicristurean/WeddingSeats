import 'package:weddings_seats/model/guest_model.dart';

class GuestsDto {
  List<GuestDto> guests;

  GuestsDto(this.guests);
}

class GuestDto {
  int id;
  String name;
  String photoUrl;

  GuestDto(int id, String name, String photoUrl);
}
