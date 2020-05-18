import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/cupertino.dart';
import './transport_menu.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({ Key key, this.title}) : super(key: key);

  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:  Stack(
          children: <Widget>[
            Container(
                // margin: const EdgeInsets.all(15.0),
                // decoration: BoxDecoration(
                //   border: Border.all(color: Colors.red)
                // ),
                child:   FlutterMap(
                options: MapOptions(
                  center: LatLng(40.71, -74.00),
                  minZoom: 10.00
                ),
                layers: [
                  TileLayerOptions(
                    urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c']),
                      MarkerLayerOptions(markers: [
                        Marker(
                          width: 45,
                          height: 45,
                          point: LatLng(40.71, -74.00),
                          builder: (context) => Container(
                            child: IconButton(
                              icon: Icon(Icons.location_on),
                              onPressed: () {
                                print('Icon pressed');
                              }
                            ),
                          ) 
                        ),
                        Marker(
                          width: 45,
                          height: 45,
                          point: LatLng(40.77, -74.12),
                          builder: (context) => Container(
                            child: IconButton(
                              icon: Icon(Icons.location_on),
                              onPressed: () {
                                print('Icon pressed');
                              }
                            ),
                          ) 
                        ),

                      ]),
                ],
               ),

            ),
            Positioned(
                  top: 50.0,
                  right: 15.0,
                  left: 15.0,
                  child: Container(
                    height: 50.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(1.0, 5.0),
                            blurRadius: 10,
                            spreadRadius: 3)
                      ],
                    ),
                    child: Container(
                      height: 55,
                      // color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(width: 15),
                          Text('\u25FE', style: TextStyle(fontSize: 12)),
                          SizedBox(width: 15),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: 'Where to?', hintStyle: TextStyle(fontSize: 18), border: InputBorder.none),
                            ),
                          ),
                          Container(
                            width: 1,
                            margin: const EdgeInsets.symmetric(vertical: 6),
                            color: Colors.grey[400],
                          ),
                          SizedBox(width: 15),
                          GestureDetector( onTap: () {
                            Navigator.of(context).push(
                            CupertinoPageRoute(
                              // fullscreenDialog: true,
                              builder: (context) => TransportMenu(),
                            ),
                          );
                          }, child: Icon(Icons.directions_bus) ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                    
                  ),
                ),
           
          ],
            )
        )
     
    );
  }
}