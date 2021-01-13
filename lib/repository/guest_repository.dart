import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';
import 'package:weddings_seats/repository/mock_utils.dart';

class GuestRepository implements GuestDataSource {
  FirebaseFirestore _firestore;

  GuestRepository(this._firestore);

  @override
  CollectionReference requestGuests(String eventId) {
    return _firestore.collection("events").doc(eventId).collection("guests");
    /*switch (guestStatus) {
      case GuestStatus.NOT_YET_INVITED:
        return GuestsDto(MockUtils.getNotYetInvitedGuests());
      case GuestStatus.PENDING:
        return GuestsDto(MockUtils.getPendingGuests());
      case GuestStatus.CONFIRMED:
        return GuestsDto(MockUtils.getConfirmedGuests());
    }*/
  }

  @override
  Future<Map<GuestStatus, int>> requestNumberOfGuests() async {
    return {
      GuestStatus.NOT_YET_INVITED: MockUtils.getNotYetInvitedGuests().length,
      GuestStatus.PENDING: MockUtils.getPendingGuests().length,
      GuestStatus.CONFIRMED: MockUtils.getConfirmedGuests().length
    };
  }
}
