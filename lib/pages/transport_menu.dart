import 'package:flutter/material.dart';
import 'package:ikaze_mobile/Views/home_view.dart';
import 'package:ikaze_mobile/services/location_service.dart';
import 'package:ikaze_mobile/dataModels/user_location.dart';
import 'package:provider/provider.dart';

import '../dataModels/user_location.dart';

class TransportMenu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TransportMenuState();
}

class TransportMenuState extends State<TransportMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: MaterialApp(
        title: 'My location B',
        home: HomeView()),
    ));
  }
}