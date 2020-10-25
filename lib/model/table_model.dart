import 'package:weddings_seats/model/guest_model.dart';

class TableModel {
  int id;
  int number;
  List<GuestModel> guests;

  TableModel(int id, int number, List<GuestModel> guests);
}
