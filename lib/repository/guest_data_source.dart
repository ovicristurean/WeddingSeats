import 'package:weddings_seats/dto/guests_dto.dart';

abstract class GuestDataSource {
  Future<GuestsDto> requestGuests();
}
