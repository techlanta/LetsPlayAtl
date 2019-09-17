//looked at Event.java from demo

import 'package:date_utils/date_utils.dart';

class Event {

  Event({this.name, this.description, this.latitude, this.longitude, this.dateStart, this.dateEnd, this.eventID});

  bool RSVP = false;

  DateTime dateStart;
  DateTime dateEnd;
  String name;
  String description;
  double latitude;
  double longitude;
  String eventID;

  void setEventID(String eventID) {
    this.eventID = eventID;
  }

  void isRSVPed(bool RSVP) {
    this.RSVP = RSVP;
  }


}