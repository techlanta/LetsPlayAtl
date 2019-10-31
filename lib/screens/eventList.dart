import 'package:flutter/material.dart';
import 'package:lets_play_atl/model/Event.dart';
import 'package:lets_play_atl/providers/singleton.dart';


class EventList extends StatefulWidget {
    Singleton singleton;
    EventList(this.singleton);
    @override
    _EventListState createState() => _EventListState(singleton);
}

class _EventListState extends State<EventList> {
    bool isLoading = true;
    List<Event> events;
    Singleton s;

    _EventListState(this.s) {
        events = [];
        reloadEvents();
    }

    void reloadEvents() {
        s.eventProvider.getAllEvents().then((loadedEvents){
            events = loadedEvents;
            setState(() {
                isLoading = false;
            });
        });
    }
    @override
    Widget build(BuildContext context) {

        if (isLoading) {
            return Center(child:CircularProgressIndicator());
        }
        return new Scaffold(
            appBar: AppBar(
                title: Text("Events"),
            ),
            backgroundColor: Colors.lightGreen[50],
            resizeToAvoidBottomPadding: false,
                body:
                    Container(
                        child: ListView.builder(
                            itemCount: events.length,
                        padding: const EdgeInsets.all(12.0),
                            itemBuilder: (BuildContext c, int index) {
                                return GestureDetector(
                                    onTap: () {
                                    Navigator.of(context).pushNamed('/eventDetails', arguments: events[index]);
                                    },
                                    child: Card(
                                        child: Column(
                                            children: [
                                                ListTile(
                                                    leading:Text(events[index].name)
                                                )
                                            ]
                                        )
                                    ));
                            },
                            ),
                    ),
            floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                    Navigator.of(context).pushNamed("/createEvent");
                },
            ),
            );
    }
}