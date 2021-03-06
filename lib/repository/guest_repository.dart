import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddings_seats/mapper/model_mapper.dart';
import 'package:weddings_seats/model/guest_model.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';
import 'package:weddings_seats/repository/mock_utils.dart';

class GuestRepository implements GuestDataSource {
  FirebaseFirestore _firestore;

  GuestRepository(this._firestore);

  @override
  CollectionReference requestGuests(String eventId) {
    return _firestore.collection("events").doc(eventId).collection("guests");
  }

  @override
  Future<Map<GuestStatus, int>> requestNumberOfGuests(
      List<GuestModel> allGuests) async {
    return {
      GuestStatus.NOT_YET_INVITED: allGuests
          .where(
              (element) => element.guestStatus == GuestStatus.NOT_YET_INVITED)
          .length,
      GuestStatus.PENDING: allGuests
          .where((element) => element.guestStatus == GuestStatus.PENDING)
          .length,
      GuestStatus.CONFIRMED: allGuests
          .where(
              (element) => element.guestStatus == GuestStatus.CONFIRMED)
          .length
    };
  }

  @override
  void addGuest(GuestModel guestModel, String eventId) {
    CollectionReference guestCollection =
        _firestore.collection("events").doc(eventId).collection("guests");
    guestCollection
        .add({
          'name': guestModel.name,
          'status': ModelMapper.getStatusNameFromEnum(guestModel.guestStatus),
        })
        .then((value) => print("Guest Added"))
        .catchError((error) => print("Failed to add guest: $error"));
  }
}
