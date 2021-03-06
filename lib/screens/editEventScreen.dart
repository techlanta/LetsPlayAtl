import 'package:flutter/material.dart';
import 'package:lets_play_atl/model/Event.dart';
import 'package:lets_play_atl/model/User.dart';
import 'package:lets_play_atl/providers/singleton.dart';

class EventDetailsEditor extends StatefulWidget {
  Event event;
  Singleton singleton;
  EventDetailsEditor(this.singleton, {this.event});
  @override
  State createState() => _EventDetailsEditorState();

}

class _EventDetailsEditorState extends State<EventDetailsEditor> {
  Event e;
  bool _validateName = false;
  bool _validateDescription = false;
  TextEditingController nameController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  TextEditingController startTimeController = new TextEditingController();
  TextEditingController endTimeController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  _EventDetailsEditorState() {
  }

  @override
  Widget build(BuildContext context) {
    e = ModalRoute.of(context).settings.arguments;

    //    List<Event> events = widget.singleton.eventProvider.getAllEvents();
    return new Scaffold(
        backgroundColor: Colors.lightGreen[50],
        resizeToAvoidBottomPadding: false,
        body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 50.0, 0.0, 0.0),
                  decoration: new BoxDecoration(color: Colors.lightGreen[100]),
                  child: Text(
                    "Update an Event",
                    style:
                    TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                )
              ],
            ),
          ),
          Expanded(
            //              padding: EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: ListView(
                children: <Widget>[
                  SizedBox(height: 10.0),
                  TextField(
                    controller: nameController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'EVENT NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                        errorText: _validateName ? 'Value Can\'t Be Empty': null),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: dateController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'DATE',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: false,

                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: startTimeController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'START TIME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: false,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: endTimeController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'END TIME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green))),
                    obscureText: false,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: descriptionController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 7,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'DESCRIPTION',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.green)),
                      errorText: _validateDescription ? 'Value Can\'t Be Empty': null,),
                    obscureText: false,
                  ),
                  SizedBox(height: 10.0),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          nameController.text.isEmpty ? _validateName = true : _validateName = false;
                          descriptionController.text.isEmpty ? _validateDescription = true : _validateDescription = false;
                        });
                        if ((_validateName == false) && (_validateDescription == false)) {
                          User u = widget.singleton.citizenProvider
                              .getCurrentUser();
                          e.name = nameController.text;
                          e.description = descriptionController.text;
                          widget.singleton.eventProvider.updateEvent(
                              e, u.email, u.password);
                          Navigator.of(context).pushNamed('/eventDetails',
                              arguments: Event(name: nameController.text,
                                  date: dateController.text,
                                  description: descriptionController.text));
                        } else {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                   title: Text("Invalid input"),
                                  actions: <Widget>[
                                   FlatButton(
                                    child: Text("Ok"),
                                     onPressed: () {
                              Navigator.of(context).pop();
                              },
                      ),
                      ],
                      );
                      });
                      };
                      },
                      child: Container(
                          height: 60.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: Center(
                              child: Text(
                                'EDIT EVENT',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                          ))),
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
                          Navigator.of(context).pop();
                        },
                        child: Center(
                          child: Text('CANCEL',
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