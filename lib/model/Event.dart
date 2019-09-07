//looked at Event.java from demo
import 'package:date_util/date_util.dart';
import 'package:latlong/latlong.dart';

class Event {

  bool RSVP = false;

  Event(this.name, this.description, this.latLng);

  DateTime dateStart;
  DateTime dateEnd;
  String name;
  String description;
  LatLng latLng;
  String eventID;

  //can change to var? not sure we want type annotations or generic

  void setEventID(String eventID) {
    this.eventID = eventID;
  }

  void isRSVPed(bool RSVP) {
    this.RSVP = RSVP;
  }


}