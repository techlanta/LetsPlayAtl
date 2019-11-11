import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:lets_play_atl/model/Event.dart';
import 'package:lets_play_atl/providers/singleton.dart';
import 'package:location/location.dart';


class MapScreen extends StatefulWidget {
  Singleton singleton;
  Location location = new Location();

  MapScreen(this.singleton);
  @override
  State<MapScreen> createState() => MapScreenState(LatLng(33.7766829, -84.389561));
}

class MapScreenState extends State<MapScreen> {
  Completer<GoogleMapController> _controller = Completer();
  LatLng latLng;
  List<Marker> markers;
  MapScreenState(this.latLng) {
    _nearestEvent =  CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(33.7766829, -84.389561),
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    Location location = new Location();
    events = [];
    markers = [];
    location.getLocation().then((locationData){
      this.setState((){
        latLng = LatLng(locationData.latitude, locationData.longitude);
        widget.singleton.eventProvider.getAllEventsNearLocation(latLng).then((newEvents) {
          this.setState(() {
            events = newEvents;
            if (events.length > 0) {
              this.setState(() {
                _nearestEvent = CameraPosition(
                    bearing: 192.8334901395799,
                    target: LatLng(events[0].latitude, events[0].longitude),
                    tilt: 59.440717697143555,
                    zoom: 19.151926040649414);
              });
            }
            for (int i = 0; i < events.length; i++) {
              Event e = events[i];
              print(e.toJsonDict());
              if (e.latitude == null || e.longitude == null) {
                continue;
              }
              markers.add(Marker(
                  markerId: MarkerId(i.toString()),
                  position: LatLng(e.latitude, e.longitude),
                  infoWindow: InfoWindow(
                      title: e.name,
                      snippet: e.description,
                      onTap: () {
                        Navigator.pushNamed(
                            context, '/eventDetails', arguments: e);
                      }
                  )
              ));
            }
        });

        });

      });



      _controller.future.then((controller){
        controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: latLng,
          zoom: 14.4746
        )));
      });


    });
  }
  List<Event> events;




  CameraPosition _nearestEvent;

  @override
  Widget build(BuildContext context) {
    CameraPosition _currentLocation = CameraPosition(
      target: latLng,
      zoom: 5,
    );
    for (int i = 0; i < events.length; i++) {
      Event e = events[i];
      print(e.toJsonDict());
      if (e.longitude == null || e.latitude == null) {
        continue;
      } else {
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
    }
    return new Scaffold(
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _currentLocation,
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
    controller.animateCamera(CameraUpdate.newCameraPosition(_nearestEvent));
  }
}