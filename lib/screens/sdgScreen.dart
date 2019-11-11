import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lets_play_atl/model/SDG.dart';
import 'package:lets_play_atl/providers/singleton.dart';
import 'package:location/location.dart';

class SDGListScreen extends StatefulWidget {
  Singleton singleton;

  SDGListScreen(this.singleton);

  @override
  SDGListScreenState createState() {
    // TODO: implement createState
    return SDGListScreenState(singleton);
  }

}

class SDGListScreenState extends State<SDGListScreen> {
  Widget body;
  SDGListScreenState(Singleton singleton) {
    body = Center(child: CircularProgressIndicator());
    singleton.sdgProvider.getAllSDG().then((sdgList) {
      this.setState(() {
        body = ListView.builder(itemCount: sdgList.length, itemBuilder: (BuildContext context, int index) {
          return SDGCard(sdgList[index]);
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sustainable Development Goals")),
        body: body
    );
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
          Image.network(sdg.imageLink),
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
      )
    );
  }
}