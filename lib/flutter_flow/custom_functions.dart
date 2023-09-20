import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

LatLng returnLatLgn(dynamic json) {
  LatLng returnLatLng(Map<String, dynamic> json) {
    final location = json['results'][0]['geometry']['location'];
    final lat = location['lat'] as double;
    final lng = location['lng'] as double;
    return LatLng(lat, lng);
  }

  return returnLatLng(json);
}

List<AddressPickerStruct> returnAdressesPickerList(dynamic json) {
  final List<AddressPickerStruct> addressList = [];

  if (json.containsKey("results")) {
    final results = json["results"] as List<dynamic>;

    for (final result in results) {
      final formattedAddress = result["formatted_address"] as String;
      final location = result["geometry"]["location"];

      if (location != null) {
        final double lat = location["lat"];
        final double lng = location["lng"];
        final LatLng latLng = LatLng(lat, lng);

        addressList.add(AddressPickerStruct(
          addressName: formattedAddress,
          addressLatLgt: latLng,
        ));
      }
    }
  }

  return addressList;
}
