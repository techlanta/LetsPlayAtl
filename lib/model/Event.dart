//looked at Event.java from demo

import 'package:date_utils/date_utils.dart';

class Event {

  Event({this.name, this.description, this.date, this.latitude, this.longitude, this.dateStart, this.dateEnd,
    this.startTime, this.endTime, this.eventID});

  bool RSVP = false;

  DateTime dateStart;
  DateTime dateEnd;
  String name;
  String description;
  double latitude;
  double longitude;
  String eventID;
  String startTime; //string for now, but should be datetime
  String endTime; //string for now, but should be datetime
  String date; //string for now, but should be datetime


  void setEventID(String eventID) {
    this.eventID = eventID;
  }

  void isRSVPed(bool RSVP) {
    this.RSVP = RSVP;
  }


}