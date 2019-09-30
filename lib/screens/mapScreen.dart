import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lets_play_atl/model/Event.dart';
import 'package:lets_play_atl/providers/singleton.dart';


class MapScreen extends StatefulWidget {
  Singleton singleton;
  MapScreen(this.singleton);
  @override
  State<MapScreen> createState() => MapScreenState();
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _techSquare = CameraPosition(
    target: LatLng(33.7766829, -84.389561),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(33.7766829, -84.389561),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    Event e = Event(name: "Waffle House Charity Run", description: "Run to Waffle House for ATL Charity", latitude: 33.7766829, longitude: -84.389561);
    List<Event> events = [e];
    List<Marker> markers = [];
    for (int i = 0; i < events.length; i++) {
      Event e = events[i];
      markers.add(Marker(
        markerId: MarkerId(i.toString()),
        position: LatLng(e.latitude, e.longitude),
        infoWindow: InfoWindow(
          title: e.name,
          snippet: e.description,
          onTap: () {
            Navigator.pushNamed(context, '/eventDetails', arguments: e);
          }
        )
      ));
    }
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _techSquare,
        markers: Set.from(markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _goToNearestEvent,
        label: Text('Show nearest event!'),
        icon: Icon(Icons.directions_run),
      ),
    );
  }

  Future<void> _goToNearestEvent() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}