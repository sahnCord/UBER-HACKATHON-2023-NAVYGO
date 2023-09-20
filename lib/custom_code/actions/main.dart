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

// Import the necessary libraries for making HTTP requests in Dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:math' as math; // Add this import for math calculations

// Define your Firebase Admin SDK setup here (Initialize Firebase Admin in main.dart)

Future<DocumentReference?> findNearbyDriver(LatLng userLocation) async {
  final double maxDistanceKm = 5;
  final driversCollection = FirebaseFirestore.instance.collection('drivers');
  final userGeoPoint = GeoPoint(userLocation.latitude, userLocation.longitude);
  final query = driversCollection.where('location', isNotEqualTo: null);
  final snapshot = await query.get();
  DocumentReference? nearbyDriver;
  double minDistance = double.infinity;

  snapshot.docs.forEach((doc) {
    final driverData = doc.data() as Map<String, dynamic>;
    final driverLocation = driverData['location'] as GeoPoint;
    final driverGeoPoint =
        GeoPoint(driverLocation.latitude, driverLocation.longitude);
    final distance = calculateDistance(userGeoPoint, driverGeoPoint);

    if (distance < maxDistanceKm && distance < minDistance) {
      nearbyDriver = doc.reference;
      minDistance = distance;
    }
  });

  return nearbyDriver;
}

double calculateDistance(GeoPoint point1, GeoPoint point2) {
  final double earthRadiusKm = 6371;
  final double lat1 = point1.latitude;
  final double lon1 = point1.longitude;
  final double lat2 = point2.latitude;
  final double lon2 = point2.longitude;
  final double dLat = (lat2 - lat1) * (3.14159265359 / 180);
  final double dLon = (lon2 - lon1) * (3.14159265359 / 180);
  final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
      math.cos(lat1 * (3.14159265359 / 180)) *
          math.cos(lat2 * (3.14159265359 / 180)) *
          math.sin(dLon / 2) *
          math.sin(dLon / 2);
  final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
  final double distance = earthRadiusKm * c;
  return distance;
}

Future<DocumentReference?> findSuitableBus(
    LatLng userLocation, DateTime userTime) async {
  final int maxTimeDifferenceMinutes = 15;
  final bussesCollection = FirebaseFirestore.instance.collection('busses');
  final userGeoPoint = GeoPoint(userLocation.latitude, userLocation.longitude);
  final userTimestamp = Timestamp.fromDate(userTime);
  final query = bussesCollection
      .where('location', isNotEqualTo: null)
      .where('schedule', isGreaterThanOrEqualTo: userTimestamp);
  final snapshot = await query.get();
  DocumentReference? suitableBusRoute;
  int minTimeDifference = int.infinity;

  snapshot.docs.forEach((doc) {
    final busData = doc.data() as Map<String, dynamic>;
    final busLocation = busData['location'] as GeoPoint;
    final busSchedule = (busData['schedule'] as Timestamp).toDate();
    final busGeoPoint = GeoPoint(busLocation.latitude, busLocation.longitude);
    final distance = calculateDistance(userGeoPoint, busGeoPoint);
    final timeDifferenceMinutes =
        calculateTimeDifference(userTime, busSchedule);

    if (timeDifferenceMinutes < maxTimeDifferenceMinutes &&
        timeDifferenceMinutes < minTimeDifference) {
      suitableBusRoute = doc.reference;
      minTimeDifference = timeDifferenceMinutes;
    }
  });

  return suitableBusRoute;
}

int calculateTimeDifference(DateTime date1, DateTime date2) {
  final int diffMillis =
      date2.millisecondsSinceEpoch - date1.millisecondsSinceEpoch;
  return (diffMillis ~/ (1000 * 60)); // Use ~/ for integer division
}

Future<String> getDistanceMatrix(String origin, String destination) async {
  final String apiKey = 'AIzaSyBnD3_VgMGqtcaR-_7oZnwUYJKqCN3rBNQ';
  final String apiUrl =
      'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=$origin&destinations=$destination&key=$apiKey';

  try {
    final response = await http.get(Uri.parse(apiUrl));
    final data = json.decode(response.body);

    if (data['status'] == 'OK') {
      return data['rows'][0]['elements'][0]['distance']['text'];
    } else {
      throw Exception(data['error_message'] ?? 'Distance calculation failed');
    }
  } catch (error) {
    throw error;
  }
}

Future<void> main(DocumentReference orderRef) async {
  // Example: Get user's location and time
  final LatLng userLocation =
      LatLng(latitude: -23.56720809353029, longitude: -46.699435870757426);
  final DateTime userTime = DateTime.now();

  // Find a nearby driver
  final DocumentReference? driverRef = await findNearbyDriver(userLocation);

  // Find a suitable bus route
  final DocumentReference? busRoute =
      await findSuitableBus(userLocation, userTime);

  if (driverRef != null) {
    // A nearby driver is available
    // Update the order with driver information
    await FirebaseFirestore.instance.collection('orders').doc(orderRef).update({
      'processed': true,
      'driverRef': driverRef,
      'timeLeft': calculateTimeLeft(userTime),
    });

    print('Driver found');
  } else if (busRoute != null) {
    // Use public transportation
    // Update the order with bus information
    await FirebaseFirestore.instance.collection('orders').doc(orderRef).update({
      'processed': true,
      'busRoute': busRoute,
      'timeLeft': calculateTimeLeft(userTime),
      'ticketPrice': calculateTicketPrice(),
    });

    print('Bus route found');
  } else {
    // No nearby driver or suitable bus route
    // Dispatch another Uber if needed
    await dispatchAnotherUber('YOUR_ORDER_DATA');
    print('No driver or bus route found, dispatched Uber');
  }
}
