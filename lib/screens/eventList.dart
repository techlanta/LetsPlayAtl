import 'package:flutter/material.dart';
import 'package:lets_play_atl/providers/singleton.dart';


class EventList extends StatefulWidget {
    Singleton singleton;
    EventList(this.singleton);
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
                        child: ListView.builder(
                            itemCount: 10,
                        padding: const EdgeInsets.all(12.0),
                            itemBuilder: (BuildContext c, int index) {
                                return GestureDetector(
                                    onTap: () {
                                        Navigator.of(context).pushNamed('/eventDetails');
                                    },
                                    child: Card(
                                        child: Column(
                                            children: [
                                                ListTile(
                                                    leading:Text("Event $index")
                                                )
                                            ]
                                        )
                                    ));
                            },
                            ),
                    ),
            );
    }
}