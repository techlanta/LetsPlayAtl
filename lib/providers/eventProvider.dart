import 'package:lets_play_atl/model/Event.dart';
abstract class EventProvider {
  List<Event> getAllEvents();
}

class MockEventProvider extends EventProvider {
  @override
  List<Event> getAllEvents() {
    return [
      Event(name: "Momo's Community PotLuck", date: "09/30/2019", description: "Enjoy delicious food!", latitude: 10, longitude: 20,
        startTime: '4:00 PM', endTime: '7:00 PM',)
    ];
  }

}
