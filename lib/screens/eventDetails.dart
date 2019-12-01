import 'package:flutter/material.dart';
import 'package:lets_play_atl/model/Event.dart';
import 'package:date_utils/date_utils.dart';
import 'package:intl/intl.dart';
import 'package:lets_play_atl/providers/singleton.dart';
import 'sdgScreen.dart';


class EventDetails extends StatefulWidget {
  Event event;
  Singleton singleton;
  EventDetails({this.event, this.singleton});
  @override
  _EventDetailsState createState() => _EventDetailsState(event);
}

class _EventDetailsState extends State<EventDetails> {
  Event e;
  _EventDetailsState(this.e);
  @override
  Widget build(BuildContext context) {
    Event event = ModalRoute.of(context).settings.arguments;
    String name = event.name;
    String date = event.date;
//    if (event.dateStart != null) {
//      date = event.dateStart.toString();
//    } else {
//      date = "ONGOING!";
//    }

    String startTime = "Not set", endTime = "Not set";
    String tagString = "";
    if (event.tags != null) {
      for (int i = 0; i < event.tags.length; i++) {
        tagString += event.tags[i] + " ";
      }
    }
    print(event.dateStart);

    if (event.dateStart != null && event.dateEnd != null) {
      startTime = DateFormat("MM-dd-yy, hh:mm").format(event.dateStart);
      endTime = DateFormat("MM-dd-yy, hh:mm").format(event.dateEnd);
    }
    String description = event.description;

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
                  child:  Center(child: Text('Start Time: $startTime')),
                ),),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child:  Center(child: Text('End Time: $endTime')),
                ),),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child:  Center(child: Text('Details: $description')),
                ),),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child:  Center(child: Text('Tags: $tagString')),
                ),),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed("/editEvent", arguments: event);
                },
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child:  Center(child: Text("Edit Event")),
                ),),
              GestureDetector(
                onTap: () {
                  print(event.sdgs);
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SDGListScreen(widget.singleton, sdgList: event.sdgs,)));
                },
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child:  Center(child: Text("Show Associated SDGs")),
                ),),
              Visibility(
                  visible: (widget.singleton.citizenProvider.getCurrentUser().isAdmin != null && widget.singleton.citizenProvider.getCurrentUser().isAdmin),
                  child: GestureDetector(
                onTap: (){
                },
                child: FlatButton(
                  color: Colors.amberAccent,
                  child: Text("Delete Event"),
                ),
              ))
            ]),
      ),
    );
  }
}