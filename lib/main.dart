import 'package:flutter/material.dart';
import 'components/mapPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Let\'s play ATL!'),
    );
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
      return Text("Sign up/login");
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[getWidgetState()],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.people), title: Text("Login/Signup"),),
        BottomNavigationBarItem(
            icon: Icon(Icons.map), title: Text("Events Near Me")),
      ],
      onTap: changeIndex,
      ),
    );
  }
}
