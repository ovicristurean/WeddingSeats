

class GuestsDto {
  List<GuestDto> guests;

  GuestsDto(this.guests);
}

class GuestDto {
  int id;
  String name;
  String photoUrl;

  GuestDto(this.id, this.name, this.photoUrl);
}
