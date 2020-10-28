import 'package:weddings_seats/dto/guests_dto.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';
import 'package:weddings_seats/repository/mock_utils.dart';

class GuestRepository implements GuestDataSource {
  @override
  Future<GuestsDto> requestGuests(GuestStatus guestStatus) async {
    switch (guestStatus) {
      case GuestStatus.NOT_YET_INVITED:
        return GuestsDto(MockUtils.getNotYetInvitedGuests());
      case GuestStatus.PENDING:
        return GuestsDto(MockUtils.getPendingGuests());
      case GuestStatus.CONFIRMED:
        return GuestsDto(MockUtils.getConfirmedGuests());
    }
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
