import 'package:flutter/material.dart';
import 'package:ikaze_mobile/HomeView/home_view.dart';
import 'package:ikaze_mobile/services/location_service.dart';
import 'package:ikaze_mobile/dataModels/user_location.dart';
import 'package:provider/provider.dart';

import '../dataModels/user_location.dart';

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
      body: StreamProvider<UserLocation>(
      create: (context) => LocationService().locationStream,
      child: HomeView(),
      )
     
    );
  }
}