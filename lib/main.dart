import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import "package:latlong2/latlong.dart" as latLng;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: latLng.LatLng(13.08, 80.27),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: "https://api.mapbox.com/styles/v1/vishaaaal/cl3jlumor002114mli1ayhetg/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidmlzaGFhYWFsIiwiYSI6ImNsM2psYTdqdTAzb24zY3A2am01YWg4Y3cifQ.QY8wwhBOolWWkEMkb-Zzhw",
            additionalOptions: {
              'accessToken':'pk.eyJ1IjoidmlzaGFhYWFsIiwiYSI6ImNsM2psYTdqdTAzb24zY3A2am01YWg4Y3cifQ.QY8wwhBOolWWkEMkb-Zzhw',
              'id' : 'mapbox.mapbox-streets-v8'
            },
            attributionBuilder: (_) {
              return Text("© OpenStreetMap contributors");
            },
          ),
          /*MarkerLayerOptions(
            markers: [
              Marker(
                width: 80.0,
                height: 80.0,
                point: latLng.LatLng(51.5, -0.09),
                builder: (ctx) =>
                    Container(
                      child: FlutterLogo(),
                    ),
              ),
            ],
          ),*/
        ],
      )
    );
  }
}
