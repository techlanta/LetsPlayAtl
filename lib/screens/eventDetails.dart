import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  @override
  _EventDetailsState createState() => _EventDetailsState();

}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
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
                  child: const Center(child: Text('Name:')),
                ),),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  color: Colors.blue[600],
                  child: const Center(child: Text('Date:')),
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