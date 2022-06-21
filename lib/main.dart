import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latLng;
import 'package:mapbox_app/screens/map_screen.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return MapScreen();
  }
}

class Coord{
  Coord({required this.lat,required this.lng});
  double lat;
  double lng;

  factory Coord.fromJson(Map<String,dynamic> data){
    double lat = data['lat'] as double;
    double lng = data['lng'] as double;
    return Coord(lat: lat ?? 12.995866166666667, lng: lng ?? 80.19463766666667);
  }

  Map<String, dynamic> toJson(){
    return {
  'lat':lat,
  'lng':lng
   };
  }


}
