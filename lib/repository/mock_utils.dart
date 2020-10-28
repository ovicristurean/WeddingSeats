import 'package:weddings_seats/dto/guests_dto.dart';

class MockUtils {
  static GuestsDto getNotInvitedYetGuests() {}

  static List<GuestDto> getNotYetInvitedGuests() {
    List<GuestDto> result = [];
    for (int i = 0; i < 40; i++) {
      result.add(GuestDto(i, "Ovidiu", "url" + i.toString()));
    }
    return result;
  }

  static List<GuestDto> getPendingGuests() {
    List<GuestDto> result = [];
    for (int i = 0; i < 23; i++) {
      result.add(GuestDto(i, "Ioana", "url" + i.toString()));
    }
    return result;
  }

  static List<GuestDto> getConfirmedGuests() {
    List<GuestDto> result = [];
    for (int i = 0; i < 114; i++) {
      result.add(GuestDto(i, "Bogdan", "url" + i.toString()));
    }
    return result;
  }

  static List<GuestDto> getMixedGuests() {
    List<GuestDto> result = [];
    for (int i = 0; i < 3; i++) {
      result.add(GuestDto(i, "Bogdan", "url" + i.toString()));
    }
    for (int i = 0; i < 2; i++) {
      result.add(GuestDto(i, "Ovidiu", "url" + i.toString()));
    }
    for (int i = 0; i < 2; i++) {
      result.add(GuestDto(i, "Ioana", "url" + i.toString()));
    }

    return result;
  }
}
