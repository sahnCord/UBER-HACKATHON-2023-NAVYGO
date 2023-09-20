// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future addBusPoints() async {
  // Add your function code here!

  void addCoordinates() async {
    // Create a Firestore instance
    final firestore = FirebaseFirestore.instance;

    // Add each coordinate to Firestore
    final coordinates = [
      GeoPoint(-23.56720809353029, -46.699435870757426),
      GeoPoint(-23.567032284995378, -46.69646934201702),
      GeoPoint(-23.56738089870456, -46.68689752885782),
      GeoPoint(-23.565444144251945, -46.68220670651984),
      GeoPoint(-23.56129987876485, -46.672982015102946),
      GeoPoint(-23.556767618783194, -46.66545979549347),
      GeoPoint(-23.55281629021895, -46.65914197621584),
      GeoPoint(-23.548327908615683, -46.65046080125569),
      GeoPoint(-23.544783112394384, -46.64355134672227),
      GeoPoint(-23.54017279721176, -46.637064488807916),
      GeoPoint(-23.53610473794124, -46.63455003899151),
      GeoPoint(-23.50545431619165, -46.624813350372975),
      GeoPoint(-23.50855325714523, -46.62491553647436),
      GeoPoint(-23.513928911669638, -46.625133557192314),
      GeoPoint(-23.523169193426522, -46.625739170302),
      GeoPoint(-23.5265674993007, -46.63043872803222),
      GeoPoint(-23.531631478515223, -46.632715833324625),
      GeoPoint(-23.538078343441377, -46.63391965341479),
      GeoPoint(-23.541587305963372, -46.634307245809524),
      GeoPoint(-23.54115327793234, -46.57814758138341),
      GeoPoint(-23.542553201975863, -46.58357858705735),
      GeoPoint(-23.54298902434068, -46.58628688699014),
      GeoPoint(-23.543596531899674, -46.59083913574962),
      GeoPoint(-23.54463985356786, -46.59534816697185),
      GeoPoint(-23.545630341157384, -46.5987335418528),
      GeoPoint(-23.54658120223659, -46.60046224390281),
      GeoPoint(-23.549262065149218, -46.60510092778415),
      GeoPoint(-23.552299429980593, -46.61083445631263),
      GeoPoint(-23.55249751654245, -46.6162078385874),
      GeoPoint(-23.552048519886934, -46.62037112938101),
      GeoPoint(-23.55152763237402, -46.624580274257525),
      GeoPoint(-23.54940449451792, -46.625526768638586),
      GeoPoint(-23.54660106767473, -46.62641197828726),
      GeoPoint(-23.543513853199872, -46.62937544702227),
      GeoPoint(-23.545489678810952, -46.6310776046623),
      GeoPoint(-23.546881719908484, -46.63088167284387),
    ];

    final value = coordinates;
    for (final coord in value) {
      final docRef = await firestore.collection("busStops").add({
        "LatLgt": coord,
      });
      print("Added document with ID: ${docRef.id}");
    }
  }

  addCoordinates();
}
