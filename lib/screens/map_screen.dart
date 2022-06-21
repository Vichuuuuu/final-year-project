import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import "package:latlong2/latlong.dart" as latLng;

class MapScreen extends StatefulWidget {
  const MapScreen({Key ? key}): super(key:key);

  @override
  State<MapScreen> createState()=> _MapScreen();
}

class _MapScreen extends State<MapScreen> {

  double _lat = 0;
  double _lng = 0;

  @override
  void initState(){
    super.initState();
    getData();

  }

  var _markers = <Marker>[];

  Future<void> getData() async {
    print('start');
     var uri = Uri.parse('https://final-year-project-a801c-default-rtdb.firebaseio.com/raspberry/pi/coordinates.json');
     http.Response response = await http.get(uri);
     if(response.statusCode == 200){
       String data = response.body;


       setState(() {
          _lat = double.parse(convert.jsonDecode(data)["lat"]);
          _lng = double.parse(convert.jsonDecode(data)["lng"]);
       });
       print(data);
       print(_lat);
     }else{
       print(response.statusCode);
     }
    print('end');
  }

  Future<void> handleRefresh(newSetState) async{
    print('start');
    var uri = Uri.parse('https://final-year-project-a801c-default-rtdb.firebaseio.com/raspberry/pi/coordinates.json');
    http.Response response = await http.get(uri);
    if(response.statusCode == 200){
      String data = response.body;
      newSetState(() {
        _lat = double.parse(convert.jsonDecode(data)["lat"]);
        _lng = double.parse(convert.jsonDecode(data)["lng"]);
        _markers.clear();
      });
      print(data);
      print(_lat);
    }else{
      print(response.statusCode);
    }
    print('end');
  }


  @override
  Widget build(BuildContext context){
    return StatefulBuilder(builder: (context, newSetState)
    {
      return Scaffold(
        body: _lat > 0 ? FlutterMap(
          options: MapOptions(
            center: latLng.LatLng(_lat, _lng),
            zoom: 15.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate: "https://api.mapbox.com/styles/v1/vishaaaal/cl3jlumor002114mli1ayhetg/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidmlzaGFhYWFsIiwiYSI6ImNsM2psYTdqdTAzb24zY3A2am01YWg4Y3cifQ.QY8wwhBOolWWkEMkb-Zzhw",
              additionalOptions: {
                'accessToken': 'pk.eyJ1IjoidmlzaGFhYWFsIiwiYSI6ImNsM2psYTdqdTAzb24zY3A2am01YWg4Y3cifQ.QY8wwhBOolWWkEMkb-Zzhw',
                'id': 'mapbox.mapbox-streets-v8'
              },
              attributionBuilder: (_) {
                return Text("© OpenStreetMap contributors");
              },
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: latLng.LatLng(_lat, _lng),
                  builder: (ctx) =>
                      Container(
                        child: Icon(
                          Icons.location_pin,
                          color: Colors.pink,
                          size: 30.0,
                          semanticLabel: 'Text to announce in accessibility modes',
                        ),
                      ),
                )
              ],
            ),
          ],
        ) : Center(
          child: CircularProgressIndicator(
            color: Colors.black,
            strokeWidth: 5,
          ),
        ),
      );
    }
    );
  }
}

