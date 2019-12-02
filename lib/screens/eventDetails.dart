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
    if (event.dateStart != null) {
      date = event.dateStart.toString();
    } else {
      date = "ONGOING!";
    }

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
        backgroundColor: Colors.lightGreen[50],
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 50.0, 155.0, 15.0),
                  decoration: new BoxDecoration(color: Colors.lightGreen[100]),
                  child: Text(
                    name, //event name
                    style:
                    TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
          ),
          Expanded(
            //              padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Date: $date',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)))),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'START TIME: $startTime',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: false,

                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'END TIME: $endTime',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.green),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: false,
                  ),
                  SizedBox(height: 10.0),
                  //                  TextField(
                  //                    controller: locationController,
                  //                    decoration: InputDecoration(
                  //                        border: OutlineInputBorder(),
                  //                        labelText: 'LOCATION',
                  //                        labelStyle: TextStyle(
                  //                            fontFamily: 'Montserrat',
                  //                            fontWeight: FontWeight.bold,
                  //                            color: Colors.grey),
                  //                        focusedBorder: UnderlineInputBorder(
                  //                            borderSide: BorderSide(color: Colors.green))),
                  //                    obscureText: false,
                  //                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: 7,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'DESCRIPTION: $description',
                      labelStyle: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                    ),
                    obscureText: false,
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child:
                  GestureDetector(
                    onTap: () {
                      print(event.sdgs);
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => SDGListScreen(widget.singleton, sdgList: event.sdgs,)));
                    },
                    child: Container(
                      height: 50,
                      color: Colors.blue[600],
                      child:  Center(child: Text("Show Associated SDGs", style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
                    ),)),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 40.0,
                                spreadRadius: .5)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed("/editEvent", arguments: event);                        },
                        child: Center(
                          child: Text('Edit Event',
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ]));
  }
}