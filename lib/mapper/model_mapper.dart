
import 'package:weddings_seats/repository/guest_data_source.dart';

class ModelMapper {
  static GuestStatus getStatusFromString(String status) {
    if (status == "not_yet_invited") {
      return GuestStatus.NOT_YET_INVITED;
    } else if (status == "pending") {
      return GuestStatus.PENDING;
    } else if (status == "confirmed") {
      return GuestStatus.CONFIRMED;
    }

    return GuestStatus.NOT_YET_INVITED;
  }

  static String getStatusNameFromEnum(GuestStatus guestStatus) {
    switch (guestStatus) {
      case GuestStatus.NOT_YET_INVITED:
        return "not_yet_invited";
      case GuestStatus.PENDING:
        return "pending";
      case GuestStatus.CONFIRMED:
        return "confirmed";
    }
    return "not_yet_invited";
  }
}