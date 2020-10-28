
import 'package:weddings_seats/dto/seats_dto.dart';

abstract class TablesDataSource {
  Future<TablesDto> getTables();
}