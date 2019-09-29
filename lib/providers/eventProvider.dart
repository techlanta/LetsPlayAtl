import 'package:lets_play_atl/model/Event.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
abstract class EventProvider {
  Future<List<Event>> getAllEvents();
  Future<bool> createEvent(Event e, String username, password);
}

class APIEventProvider extends EventProvider {
  static const apiBase = "http://ec2-13-58-237-110.us-east-2.compute.amazonaws.com:5000";


  @override
  Future<List<Event>> getAllEvents() async {
    Map<String, String> header = {};


    header["Content-Type"] = "application/json";

    http.Response eventResp = await http.get(apiBase + "/event",
        headers: header
    );
    List<dynamic> eventsBody = jsonDecode(eventResp.body);
    List<Event> toReturn  = [];
    for (dynamic rawEvent in eventsBody) {
      Event parsedEvent = Event(name: rawEvent["name"], eventID: rawEvent["id"].toString());
      toReturn.add(parsedEvent);
    }
    return toReturn;
  }

  @override
  Future<bool> createEvent(Event e, String username, password) async {
    Map<String, String> body = {}, header = {};

    body["name"] = e.name;
    body["description"] = e.description;


    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));

    header["Content-Type"] = "application/json";
    header["Authorization"] = basicAuth;

    http.Response eventCreation = await http.post(apiBase + "/event",
        body: json.encode(body),
        headers: header
    );
    Map<dynamic, dynamic> eventCreationBody = jsonDecode(eventCreation.body);

    return eventCreationBody["status"] == "created";
  }

}

class MockEventProvider extends EventProvider {
  @override
  Future<List<Event>> getAllEvents() async {
    return [
      Event(name: "Momo's Community PotLuck", date: "09/30/2019", description: "Enjoy delicious food!", latitude: 10, longitude: 20,
        startTime: '4:00 PM', endTime: '7:00 PM',)
    ];
  }

  @override
  Future<bool> createEvent(Event e, String username, password) {
    // TODO: implement createEvent
    return null;
  }

}
