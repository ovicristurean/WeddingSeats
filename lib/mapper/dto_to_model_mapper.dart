import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddings_seats/dto/guests_dto.dart';
import 'package:weddings_seats/dto/seats_dto.dart';
import 'package:weddings_seats/model/guest_model.dart';
import 'package:weddings_seats/model/table_model.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';

class DtoToModelMapper {
  static List<GuestModel> fromDtos(List<GuestDto> dtos) {
    List<GuestModel> result = List();
    dtos.forEach((dtoElement) {
      result.add(
          GuestModel(dtoElement.id, dtoElement.name, dtoElement.guestStatus));
    });

    return result;
  }

  static List<GuestModel> fromSnapshot(QuerySnapshot snapshot) {
    List<GuestModel> result = List();
    snapshot.docs.forEach((guest) {
      result.add(GuestModel(1, guest.data()["name"],
          getStatusFromString(guest.data()["status"])));
      print(
          "name " + guest.data()["name"] + " status " + guest.data()["status"]);
    });
    return result;
  }

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

  static List<TableModel> fromTableDtos(List<TableDto> dtos) {
    List<TableModel> result = List();
    dtos.forEach((dtoElement) {
      result.add(
          TableModel(dtoElement.number, fromDtos(dtoElement.guestsDto.guests)));
    });

    return result;
  }

  static GuestModel fromDto(GuestDto dto) =>
      GuestModel(dto.id, dto.name, dto.guestStatus);
}
