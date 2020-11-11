import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddings_seats/model/event_model.dart';

import 'event_details_data_source.dart';

class EventDetailsRepository implements EventDetailsDataSource {
  FirebaseFirestore _firestore;

  EventDetailsRepository(this._firestore);

  @override
  Query requestEventDetails(int eventId) {
    return _firestore.collection("events").where("id", isEqualTo: eventId);
  }

  @override
  EventModel getEventModelFromSnapshot(QueryDocumentSnapshot snapshot) {
    return EventModel(snapshot.data()["name"], snapshot.data()["date"],
        snapshot.data()["place"]);
  }
}
