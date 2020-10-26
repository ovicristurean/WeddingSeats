import 'package:weddings_seats/dto/guests_dto.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';

class GuestRepository implements GuestDataSource {
  @override
  Future<GuestsDto> requestGuests() async {
    GuestDto dto1 = GuestDto(1, "Ovidiu", "url1");
    GuestDto dto2 = GuestDto(2, "Ioana", "url2");
    GuestDto dto3 = GuestDto(3, "Bogdan", "url3");

    return GuestsDto([dto1, dto2, dto3]);
  }
}
