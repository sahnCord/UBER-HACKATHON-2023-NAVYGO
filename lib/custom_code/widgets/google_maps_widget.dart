// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:google_maps_widget/google_maps_widget.dart';

class GoogleMapsWidget extends StatefulWidget {
  const GoogleMapsWidget({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  _GoogleMapsWidgetState createState() => _GoogleMapsWidgetState();
}

class _GoogleMapsWidgetState extends State<GoogleMapsWidget> {
  @override
  Widget build(BuildContext context) {
    return GoogleMapsWidget(
      apiKey: "AIzaSyBnD3_VgMGqtcaR-_7oZnwUYJKqCN3rBNQ",
      sourceLatLng: LatLng(
        40.484000837597925,
        -3.369978368282318,
      ),
      destinationLatLng: LatLng(
        40.48017307700204,
        -3.3618026599287987,
      ),
    );
  }
}
