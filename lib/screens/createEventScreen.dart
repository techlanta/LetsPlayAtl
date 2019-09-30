import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:lets_play_atl/model/User.dart';
import 'package:lets_play_atl/providers/singleton.dart';
import 'package:lets_play_atl/model/Event.dart';
import 'package:intl/intl.dart';

class CreateEventScreen extends StatefulWidget {
  Singleton singleton;
  CreateEventScreen(this.singleton);
  @override
  _CreateEventScreenState createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController dateController = new TextEditingController();
  TextEditingController startTimeController = new TextEditingController();
  TextEditingController endTimeController = new TextEditingController();
  TextEditingController descriptionController = new TextEditingController();
  String dateText = "Choose Date";
  @override
  Widget build(BuildContext context) {
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
                    "Create a New Event",
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
                        borderSide: BorderSide(color: Colors.green))),
              ),
              SizedBox(height: 10.0),
              FlatButton(
                onPressed: () {
                  DatePicker.showDatePicker(context, onConfirm: (date){
                    setState(() {
                      DateFormat dateFormat = DateFormat("yyyy-MM-dd");
                      dateText = dateFormat.format(date);
                    });
                  });
                },
                  child: Text(dateText)

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
                        borderSide: BorderSide(color: Colors.green))),
                obscureText: false,
              ),
              SizedBox(height: 10.0),
              GestureDetector(
                  onTap: () {
                    User currentUser =
                        widget.singleton.citizenProvider.getCurrentUser();
                    Event e = Event(
                        name: nameController.text,
                        description: descriptionController.text);
                    widget.singleton.eventProvider
                        .createEvent(e, currentUser.email, currentUser.password)
                        .then((res) {
                      if (res) {
                        Navigator.of(context).pushNamedAndRemoveUntil('/eventDetails',
                            ModalRoute.withName('/main'),
                            arguments: Event(
                                name: nameController.text,
                                date: dateController.text,
                                startTime: startTimeController.text,
                                endTime: endTimeController.text,
                                description: descriptionController.text), );
                      } else {
                        AlertDialog(
                          title: Text("Event Creation Failed"),
                          actions: <Widget>[
                            FlatButton(
                              child: Text("Ok"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      }
                    });
//                        MaterialPageRoute(
////                        builder: (context) => eventDetails(name: nameController,));
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
                            'CREATE EVENT',
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
