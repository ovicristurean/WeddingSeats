import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddings_seats/model/guest_model.dart';

enum GuestStatus {
  NOT_YET_INVITED,
  PENDING,
  CONFIRMED
}

abstract class GuestDataSource {
  CollectionReference requestGuests(String eventId);
  Future<Map<GuestStatus, int>> requestNumberOfGuests(List<GuestModel> allGuests);
  void addGuest(GuestModel guestModel, String eventId);
}
