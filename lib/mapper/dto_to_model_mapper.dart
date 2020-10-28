import 'package:weddings_seats/dto/guests_dto.dart';
import 'package:weddings_seats/dto/seats_dto.dart';
import 'package:weddings_seats/model/guest_model.dart';
import 'package:weddings_seats/model/table_model.dart';

class DtoToModelMapper {
  static List<GuestModel> fromDtos(List<GuestDto> dtos) {
    List<GuestModel> result = List();
    dtos.forEach((dtoElement) {
      result.add(GuestModel(dtoElement.id, dtoElement.name));
    });

    return result;
  }

  static List<TableModel> fromTableDtos(List<TableDto> dtos) {
    List<TableModel> result = List();
    dtos.forEach((dtoElement) {
      result.add(
          TableModel(dtoElement.number, fromDtos(dtoElement.guestsDto.guests)));
    });

    return result;
  }
}
