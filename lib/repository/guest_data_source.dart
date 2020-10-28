import 'package:weddings_seats/dto/guests_dto.dart';

enum GuestStatus {
  NOT_YET_INVITED,
  PENDING,
  CONFIRMED
}

abstract class GuestDataSource {
  Future<GuestsDto> requestGuests(GuestStatus status);
  Future<Map<GuestStatus, int>> requestNumberOfGuests();
}
