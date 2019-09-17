import 'package:lets_play_atl/model/Event.dart';
abstract class EventProvider {
  List<Event> getAllEvents();
}

class MockEventProvider extends EventProvider {
  @override
  List<Event> getAllEvents() {
    return [
      Event(name: "Momo's Community PotLuck", latitude: 10, longitude: 20, )
    ];
  }

}
