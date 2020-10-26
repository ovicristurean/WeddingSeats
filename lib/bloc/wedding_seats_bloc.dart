import 'package:rxdart/rxdart.dart';
import 'package:weddings_seats/dto/guests_dto.dart';
import 'package:weddings_seats/mapper/dto_to_model_mapper.dart';
import 'package:weddings_seats/model/guest_model.dart';
import 'package:weddings_seats/repository/guest_data_source.dart';

import 'bloc.dart';

class WeddingSeatsBloc implements Bloc {
  GuestDataSource guestDataSource;

  final _guestDataSubject = PublishSubject<List<GuestModel>>();

  Observable<List<GuestModel>> get guestList => _guestDataSubject.stream;

  WeddingSeatsBloc(this.guestDataSource);

  void requestGuests() async {
    GuestsDto guestsDto = await guestDataSource.requestGuests();
    _guestDataSubject.sink.add(DtoToModelMapper.fromDtos(guestsDto.guests));
  }

  @override
  void dispose() {
    _guestDataSubject.close();
  }
}
