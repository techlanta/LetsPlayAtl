//looked at Event.java from demo

import 'package:date_utils/date_utils.dart';

class Event {

  bool RSVP = false;

  Event() { //not sure if I need to implement serializable

  }

  DateTime dateStart;
  DateTime dateEnd;
  String name;
  String description;
  Double latitude;
  Double longitude;
  String eventID;

  //can change to var? not sure we want type annotations or generic

  void setEventID(String eventID) {
    this.eventID = eventID;
  }

  void isRSVPed(bool RSVP) {
    this.RSVP = RSVP;
  }


}