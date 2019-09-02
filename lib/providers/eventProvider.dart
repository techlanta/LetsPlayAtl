import 'package:lets_play_atl/model/Event.dart';
import 'package:latlong/latlong.dart';
abstract class EventProvider {
  List<Event> getAllEvents();
}

class MockEventProvider extends EventProvider {
  @override
  List<Event> getAllEvents() {
    return [
      Event("Get Together at Ferst Arts", "Get together with your fellow students at Ferst Arts Center", LatLng(33.7750094,-84.3992794))
    ];
  }

}
