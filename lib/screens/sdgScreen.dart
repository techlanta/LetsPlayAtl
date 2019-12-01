import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lets_play_atl/model/SDG.dart';
import 'package:lets_play_atl/providers/singleton.dart';
import 'package:location/location.dart';

class ChooseSDGList extends StatefulWidget {
  Singleton singleton;
  Function callback;
  ChooseSDGList(this.singleton, this.callback);
  @override
  ChooseSDGListState createState() {
    return ChooseSDGListState(singleton);
  }
}

class ChooseSDGListState extends State<ChooseSDGList> {
  Widget body;
  List<SDG> sdgList;
  ChooseSDGListState(Singleton singleton) {
    body = Center(child: CircularProgressIndicator());
    singleton.sdgProvider.getAllSDG().then((sdgList) {
      this.sdgList = sdgList;
      this.setState(() {
        body = Column(children: [
          Container(
              height: 80,
              child: Card(child:FlatButton(
                child: Text("DONE"),
                onPressed: () {
                  widget.callback(sdgList.where((sdg) => sdg.isPicked).toList());
                  Navigator.pop(context);
                },
              ))),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: sdgList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => SDGScreen(sdgList[index])));
                        },
                        child: SDGPickCard(sdgList[index], (){}));
                  }))
        ]);
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sustainable Development Goals")),
        body: body);
  }
}

class SDGListScreen extends StatefulWidget {
  Singleton singleton;
  List<SDG> sdgList;

  SDGListScreen(this.singleton, {this.sdgList});

  @override
  SDGListScreenState createState() {
    return SDGListScreenState(singleton, sdgList);
  }
}

class SDGListScreenState extends State<SDGListScreen> {
  Widget body;
  List<SDG> sdgList;
  SDGListScreenState(Singleton singleton, this.sdgList) {
    body = Center(child: CircularProgressIndicator());
    if (sdgList != null) {
      if (sdgList.length == 0) {
        body = Center(child: Text("No Sustainable Development Goals!"));
      } else {
        body = ListView.builder(
            itemCount: sdgList.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (c) => SDGScreen(sdgList[index])));
                  },
                  child: SDGCard(sdgList[index]));
            });
      }
    } else {
      singleton.sdgProvider.getAllSDG().then((sdgList) {
        this.setState(() {
          body = ListView.builder(
              itemCount: sdgList.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (c) => SDGScreen(sdgList[index])));
                    },
                    child: SDGCard(sdgList[index]));
              });
        });
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Sustainable Development Goals")),
        body: body);
  }
}

class SDGScreen extends StatelessWidget {
  SDG sdg;

  SDGScreen(this.sdg);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(sdg.title)),
      body: Column(
        children: <Widget>[
          Container(color: Colors.green, child: Image.network(sdg.imageLink)),
          Text(sdg.description)
        ],
      ),
    );
  }
}

class SDGCard extends StatelessWidget {
  SDG sdg;
  SDGCard(this.sdg);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(sdg.title),
      leading: Text(sdg.id),
    ));
  }
}

class SDGPickCard extends StatefulWidget {
  final SDG sdg;
  final Function callback;

  SDGPickCard(this.sdg, this.callback);

  @override
  State<StatefulWidget> createState() {
    return SDGPickCardState(sdg);
  }
}

class SDGPickCardState extends State<SDGPickCard> {
  bool isPicked;
  SDG sdg;
  SDGPickCardState(this.sdg) {
    isPicked = false;
    sdg.isPicked = false;
  }
  @override
  Widget build(BuildContext context) {
    return Card(
        child: ListTile(
      title: Text(sdg.title),
      leading: Checkbox(
        value: isPicked,
        onChanged: (res) {
          this.setState(() {
            isPicked = res;
            sdg.isPicked = res;
          });
        },
      ),
    ));
  }
}
