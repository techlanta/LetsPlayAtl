//looked at Event.java from demo

import 'package:date_utils/date_utils.dart';

class Event {

  bool RSVP = false;

  Event() {

  }

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