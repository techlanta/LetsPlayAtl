import 'package:lets_play_atl/model/Event.dart';
abstract class EventProvider {
  List<Event> getAllEvents();
}

class MockEventProvider extends EventProvider {
  @override
  List<Event> getAllEvents() {
    // TODO: implement getAllEvents
    return [];
  }

}
