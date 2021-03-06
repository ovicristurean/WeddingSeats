import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddings_seats/bloc/wedding_seats_bloc.dart';
import 'package:weddings_seats/repository/event_details_data_source.dart';
import 'package:weddings_seats/repository/event_details_repository.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';
import 'package:weddings_seats/repository/guest_repository.dart';
import 'package:weddings_seats/repository/tables_data_source.dart';
import 'package:weddings_seats/repository/tables_repository.dart';

class ProviderModule {
  static GuestDataSource getGuestDataSource() =>
      GuestRepository(getFirestoreInstance());

  static TablesDataSource getTablesDataSource() => TablesRepository();

  static WeddingSeatsBloc getWeddingSeatsBloc() => WeddingSeatsBloc(
      getGuestDataSource(), getTablesDataSource(), getEventDetailsDataSource());

  static FirebaseFirestore getFirestoreInstance() => FirebaseFirestore.instance;

  static EventDetailsDataSource getEventDetailsDataSource() =>
      EventDetailsRepository(getFirestoreInstance());
}
