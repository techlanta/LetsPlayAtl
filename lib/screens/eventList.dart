import 'package:flutter/material.dart';


class EventList extends StatefulWidget {
    @override
    _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: AppBar(
                title: Text("Events"),
            ),
            backgroundColor: Colors.lightGreen[50],
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
                                    onTap: () {
                                      Navigator.of(context).pushNamed('/eventDetails');
                                    },
                                    child: Container(
                                    height: 50,
                                    color: Colors.amber[600],
                                        child: const Center(child: Text('Entry A')),
                                    ),),
                                GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        height: 50,
                                        color: Colors.amber[500],
                                        child: const Center(child: Text('Entry B')),
                                    ),),
                                GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                        height: 50,
                                        color: Colors.amber[100],
                                        child: const Center(child: Text('Entry C')),
                                    ),),
                                ]),
                    ),
            );
    }
}