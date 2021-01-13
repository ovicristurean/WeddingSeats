import 'package:weddings_seats/dto/guests_dto.dart';

import 'guest_data_source.dart';

class MockUtils {
  static GuestsDto getNotInvitedYetGuests() {}

  static List<GuestDto> getNotYetInvitedGuests() {
    List<GuestDto> result = [];
    for (int i = 0; i < 40; i++) {
      result.add(GuestDto(
          i, "Ovidiu", "url" + i.toString(), GuestStatus.NOT_YET_INVITED));
    }
    return result;
  }

  static List<GuestDto> getPendingGuests() {
    List<GuestDto> result = [];
    for (int i = 0; i < 23; i++) {
      result
          .add(GuestDto(i, "Ioana", "url" + i.toString(), GuestStatus.PENDING));
    }
    return result;
  }

  static List<GuestDto> getConfirmedGuests() {
    List<GuestDto> result = [];
    for (int i = 0; i < 114; i++) {
      result.add(
          GuestDto(i, "Bogdan", "url" + i.toString(), GuestStatus.CONFIRMED));
    }
    return result;
  }

  static List<GuestDto> getMixedGuests() {
    List<GuestDto> result = [];
    for (int i = 0; i < 3; i++) {
      result.add(
          GuestDto(i, "Bogdan", "url" + i.toString(), GuestStatus.CONFIRMED));
    }
    for (int i = 0; i < 2; i++) {
      result.add(GuestDto(
          i, "Ovidiu", "url" + i.toString(), GuestStatus.NOT_YET_INVITED));
    }
    for (int i = 0; i < 2; i++) {
      result
          .add(GuestDto(i, "Ioana", "url" + i.toString(), GuestStatus.PENDING));
    }

    return result;
  }
}
