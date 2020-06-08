import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:flutter/cupertino.dart';
import '../pages/transport_menu.dart';
import 'package:ikaze_mobile/dataModels/user_location.dart';
import 'package:provider/provider.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';


class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var userLocation = Provider.of<UserLocation>(context);
    if (userLocation == null && userLocation == null) {
      return Scaffold(
        body: Center(),
      );
    }
    return SafeArea(
      child: Stack(
          children: <Widget>[
            Container(
                child:   FlutterMap(
                options: MapOptions(
                  center: LatLng(userLocation.latitude, userLocation.longitude),
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
                          point: LatLng(userLocation.latitude, userLocation.longitude),
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
                            child: TypeAheadField(
  textFieldConfiguration: TextFieldConfiguration(
    autofocus: true,
    style: DefaultTextStyle.of(context).style.copyWith(
      fontStyle: FontStyle.italic
    ),
    decoration: InputDecoration(
      border: OutlineInputBorder()
    )
  ),
  suggestionsCallback: (pattern) async {
    return await BackendService.getSuggestions(pattern);
  },
  itemBuilder: (context, suggestion) {
    return ListTile(
      leading: Icon(Icons.shopping_cart),
      title: Text(suggestion['name']),
      subtitle: Text('\$${suggestion['price']}'),
    );
  },
  onSuggestionSelected: (suggestion) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ProductPage(product: suggestion)
    ));
  },
)
                            // TextField(
                            //   decoration: InputDecoration(
                            //       hintText: 'Where to?', hintStyle: TextStyle(fontSize: 18), border: InputBorder.none),
                            // ),
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
      );
  }
}