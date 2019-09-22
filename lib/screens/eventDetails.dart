import 'package:flutter/material.dart';
import 'package:lets_play_atl/model/Event.dart';

class EventDetails extends StatefulWidget {
  Event event;
  EventDetails({this.event});
  @override
  _EventDetailsState createState() => _EventDetailsState();

}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    Event event = ModalRoute.of(context).settings.arguments;
    String name = event.name;
    String date;
    if (event.dateStart != null) {
      date = event.dateStart.toString();
    } else {
      date = "ONGOING!";
    }
    return new Scaffold(
      appBar: AppBar(
        title: Text("Event Details"),
      ),
      backgroundColor: Colors.green[50],
      resizeToAvoidBottomPadding: false,
//            body: Container(
////                crossAxisAlignment: CrossAxisAlignment.center, children: <
//                Widget>[
      body:
      Container(
        child: ListView(
            padding: const EdgeInsets.all(8.0),
            children: <Widget>[
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child: Center(child: Text('Name: $name')),
                ),),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child: Center(child: Text('Date: $date')),
                ),),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child: const Center(child: Text('Start Time:')),
                ),),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child: const Center(child: Text('End Time:')),
                ),),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child: const Center(child: Text('Details:')),
                ),),
            ]),
      ),
    );
  }
}