import 'package:flutter/material.dart';
import 'package:lets_play_atl/providers/singleton.dart';
import 'package:lets_play_atl/screens/afterLoginScreen.dart';
import 'package:lets_play_atl/screens/eventDetails.dart';
import 'package:lets_play_atl/screens/registrationScreen.dart';
import 'package:lets_play_atl/screens/loginScreen.dart';
import 'package:lets_play_atl/screens/eventList.dart';
import 'package:lets_play_atl/screens/createEventScreen.dart';
import 'package:lets_play_atl/screens/loginOrganizerScreen.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Singleton singleton;
  MyApp() {
    singleton = ImplementedSingleton();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Let's Play ATL",
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => new RegistrationScreen(),
        '/login': (BuildContext context) => new LoginScreen(singleton),
        '/events': (BuildContext context) => new EventList(singleton),
        '/eventDetails': (BuildContext context) => new EventDetails(),
        '/main': (BuildContext context) => new AfterLoginScreen(singleton),
        '/createEvent': (BuildContext context) => new CreateEventScreen(singleton),
        '/loginOrganizer': (BuildContext context) => new LoginOrganizerScreen(singleton),



      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: MyHomePage(title: "Let's Play ATL"),
    );
  }
}


class LoginSignup extends StatelessWidget {
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Stack(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 110.0, 0.0, 0.0),
                      decoration:
                      new BoxDecoration(color: Colors.lightGreen[100]),
                      child: Text(
                        "WELCOME TO LET'S PLAY ATL",
                        style: TextStyle(
                            fontSize: 48.0, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(260.0, 125.0, 0.0, 0.0),
                    )
                  ],
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0),
                      Container(
                          height: 60.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/login');
                              },
                              child: Center(
                                child: Text(
                                  'LOG IN AS A CITIZEN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 20.0),
                      Container(
                          height: 60.0,
                          child: Material(
                            borderRadius: BorderRadius.circular(20.0),
                            shadowColor: Colors.greenAccent,
                            color: Colors.green,
                            elevation: 7.0,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pushNamed('/loginOrganizer');
                              },
                              child: Center(
                                child: Text(
                                  'LOG IN AS AN ORGANIZER',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat'),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(height: 60.0),
                      Container(
                        height: 60.0,
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
                              Navigator.of(context).pushNamed('/register');
                            },
                            child: Center(
                              child: Text('SIGN UP',
                                  style: TextStyle(
                                      fontSize: 25.0,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Montserrat')),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ]);
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(0);
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex;
  _MyHomePageState(this._selectedIndex);

  Widget getWidgetState() {
    if (_selectedIndex == 0) {
      return LoginSignup();
    } else if (_selectedIndex == 1) {
      return SOSSIInfo();
    } else {
      return Text("ERROR! Some index value isn't supported! $_selectedIndex");
    }
  }

  Function changeIndexCB(int index) {
    return () {
      changeIndex(index);
    };
  }

  void changeIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[50],
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[getWidgetState()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text("Login/Signup"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.map), title: Text("Info About SOSSI")),
        ],
        onTap: changeIndex,
      ),
    );
  }
}

class SOSSIInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(20),
        child:
            Column(children:[
        Text("Saving Our Sons & Sisters international (SOSSI) is a 501(c)3 nonprofit organization that transforms and improves the overall success of the youth, veterans, seniors, families, and communities. Our intergenerational approach creates an ecosystem focused on exposure, developing strategic partnerships between community, educators, industry professionals, nonprofits, and professionals committing services, time and resources to develop a STEM-ready workforce and access to opportunities."),
              Image.asset("assets/sossialpha.png")
    ]))
    );
  }

}


