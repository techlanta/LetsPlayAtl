import 'package:flutter/material.dart';
import 'package:lets_play_atl/screens/registrationScreen.dart';
import 'package:lets_play_atl/screens/loginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Let's Play ATL",
      routes: <String, WidgetBuilder>{
        '/register': (BuildContext context) => new RegistrationScreen(),
        '/login': (BuildContext context) => new LoginScreen(),
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
                      SizedBox(height: 60.0),
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
                                  'LOG IN',
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
      return Text("Map here!");
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
              icon: Icon(Icons.map), title: Text("Events Near Me")),
        ],
        onTap: changeIndex,
      ),
    );
  }
}

