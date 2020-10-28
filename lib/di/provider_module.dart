import 'package:weddings_seats/bloc/wedding_seats_bloc.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';
import 'package:weddings_seats/repository/guest_repository.dart';
import 'package:weddings_seats/repository/tables_data_source.dart';
import 'package:weddings_seats/repository/tables_repository.dart';

class ProviderModule {
  static GuestDataSource getGuestDataSource() => GuestRepository();

  static TablesDataSource getTablesDataSource() => TablesRepository();

  static WeddingSeatsBloc getWeddingSeatsBloc() =>
      WeddingSeatsBloc(getGuestDataSource(), getTablesDataSource());
}
