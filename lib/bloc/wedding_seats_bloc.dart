import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:weddings_seats/dto/guests_dto.dart';
import 'package:weddings_seats/dto/seats_dto.dart';
import 'package:weddings_seats/mapper/dto_to_model_mapper.dart';
import 'package:weddings_seats/model/event_model.dart';
import 'package:weddings_seats/model/guest_model.dart';
import 'package:weddings_seats/model/table_model.dart';
import 'package:weddings_seats/repository/event_details_data_source.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';
import 'package:weddings_seats/repository/tables_data_source.dart';

import 'bloc.dart';

class WeddingSeatsBloc implements Bloc {
  GuestDataSource _guestDataSource;
  TablesDataSource _tablesDataSource;
  EventDetailsDataSource _eventDetailsDataSource;

  final _guestDataSubject = PublishSubject<List<GuestModel>>();
  final _guestsCountSubject = PublishSubject<Map<GuestStatus, int>>();
  final _tablesSubject = PublishSubject<List<TableModel>>();

  Observable<List<GuestModel>> get guestList => _guestDataSubject.stream;

  Observable<Map<GuestStatus, int>> get guestsCount =>
      _guestsCountSubject.stream;

  Observable<List<TableModel>> get tables => _tablesSubject.stream;

  WeddingSeatsBloc(this._guestDataSource, this._tablesDataSource,
      this._eventDetailsDataSource);

  void requestGuests(GuestStatus guestStatus) async {
    GuestsDto guestsDto = await _guestDataSource.requestGuests(guestStatus);
    _guestDataSubject.sink.add(DtoToModelMapper.fromDtos(guestsDto.guests));
  }

  void requestNumberOfGuests() async {
    Map<GuestStatus, int> numberOfGuests =
        await _guestDataSource.requestNumberOfGuests();
    _guestsCountSubject.sink.add(numberOfGuests);
  }

  void requestTables() async {
    TablesDto tablesDto = await _tablesDataSource.getTables();
    _tablesSubject.sink.add(DtoToModelMapper.fromTableDtos(tablesDto.tables));
  }

  Stream<QuerySnapshot> getEventDetailsStream(int eventId) {
    return _eventDetailsDataSource.requestEventDetails(eventId).snapshots();
  }

  EventModel getEventModelFromSnapshot(QueryDocumentSnapshot snapshot) {
    return _eventDetailsDataSource.getEventModelFromSnapshot(snapshot);
  }

  @override
  void dispose() {
    _guestDataSubject.close();
    _guestsCountSubject.close();
    _tablesSubject.close();
  }
}
