import 'package:weddings_seats/dto/guests_dto.dart';
import 'package:weddings_seats/model/guest_model.dart';

class DtoToModelMapper {
  static List<GuestModel> fromDtos(List<GuestDto> dtos) {
    List<GuestModel> result = List();
    dtos.forEach((dtoElement) {
      result.add(GuestModel(dtoElement.id, dtoElement.name));
    });

    return result;
  }
}
