import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weddings_seats/model/event_model.dart';

abstract class EventDetailsDataSource {
  Query requestEventDetails(int eventId);
  EventModel getEventModelFromSnapshot(QueryDocumentSnapshot snapshot);
}
