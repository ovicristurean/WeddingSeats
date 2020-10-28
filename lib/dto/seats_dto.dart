import 'package:weddings_seats/dto/guests_dto.dart';

class TablesDto {
  List<TableDto> tables;

  TablesDto(this.tables);
}

class TableDto {
  int number;
  GuestsDto guestsDto;

  TableDto(this.number, this.guestsDto);
}
