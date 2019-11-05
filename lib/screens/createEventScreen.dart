import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:lets_play_atl/model/User.dart';
import 'package:lets_play_atl/providers/singleton.dart';
import 'package:lets_play_atl/model/Event.dart';
import 'package:intl/intl.dart';
import 'package:flutter_google_places/flutter_google_places.dart';

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
  TextEditingController locationController = new TextEditingController();
  PlacesAutocompleteField placePicker;
  bool isOngoing;
  _CreateEventScreenState() {
    this.isOngoing = false;
    placePicker = PlacesAutocompleteField(apiKey: "AIzaSyALI1hjJwA0xHRO9b3CIFQLSc7UqfI75sc", hint: "EVENT LOCATION");
  }
  String dateText = "Choose Date";
  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(Duration(hours:1));


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
//              Visibility(
//                  visible: !isOngoing,
//                  child: FlatButton(
//                      onPressed: () {
//                        DatePicker.showDateTimePicker(context,
//                            currentTime: DateTime.now(), onConfirm: (date) {
//                          setState(() {
//                            DateFormat dateFormat = DateFormat("yyyy-MM-dd");
//                            dateText = dateFormat.format(date);
//                          });
//                        });
//                      },
//                      child: Text("EVENT DATE: " + dateText))),
//              SizedBox(height: 10.0),
//              Row(children: [
//                Text("Is Event Ongoing?"),
//                Checkbox(
//                  value: isOngoing,
//                  onChanged: (newVal) {
//                    this.setState(() {
//                      isOngoing = newVal;
//                    });
//                  },
//                ),
//              ]),
              Timepicker((time) {
                this.setState(() {
                  startTime = time;
                });
              }, "PICK START TIME: " + DateFormat("MM-dd-yy, hh:mm").format(startTime)),
              SizedBox(height: 10.0),
              Timepicker((time) {
                this.setState(() {
                  endTime = time;
                });
              }, "PICK END TIME: " + DateFormat("MM-dd-yy, hh:mm").format(endTime)),
              SizedBox(height: 10.0),
              placePicker,
              SizedBox(height: 10.0),
              FlatButton(
                onPressed: (){

                },
                child: Text("PICK SUSTAINABLE DEVELOPMENT GOALS"),
              ),
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
                        description: descriptionController.text,
                        dateStart: startTime,
                        dateEnd: endTime,
                    );
                    widget.singleton.eventProvider
                        .createEvent(e, currentUser.email, currentUser.password)
                        .then((res) {
                      if (res) {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          '/eventDetails',
                          ModalRoute.withName('/main'),
                          arguments: e);
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

class Timepicker extends StatelessWidget {
  Function onGetTime;
  String buttonText;
  Timepicker(this.onGetTime, this.buttonText);
  @override
  Widget build(BuildContext context) {
    return FlatButton(
        onPressed: () {
          DatePicker.showDateTimePicker(context, onConfirm: (time) {
            onGetTime(time);
          });
        },
        child: Text(this.buttonText));
  }
}

class LocationPicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }

}
