import 'package:weddings_seats/dto/guests_dto.dart';
import 'package:weddings_seats/dto/seats_dto.dart';
import 'package:weddings_seats/repository/mock_utils.dart';
import 'package:weddings_seats/repository/tables_data_source.dart';

class TablesRepository extends TablesDataSource {
  @override
  Future<TablesDto> getTables() async {
    TableDto dto1 = TableDto(1, GuestsDto(MockUtils.getMixedGuests()));
    TableDto dto2 = TableDto(2, GuestsDto(MockUtils.getMixedGuests()));
    TableDto dto3 = TableDto(3, GuestsDto(MockUtils.getMixedGuests()));

    return TablesDto([dto1, dto2, dto3]);
  }
}
