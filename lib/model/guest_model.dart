import 'dart:ui';

import 'package:weddings_seats/repository/guest_data_source.dart';

class GuestModel {
  int id;
  String name;
  GuestStatus guestStatus;

  GuestModel(this.id, this.name, this.guestStatus);
}
