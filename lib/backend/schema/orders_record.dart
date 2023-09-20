import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "orderTime" field.
  DateTime? _orderTime;
  DateTime? get orderTime => _orderTime;
  bool hasOrderTime() => _orderTime != null;

  // "source" field.
  LatLng? _source;
  LatLng? get source => _source;
  bool hasSource() => _source != null;

  // "destination" field.
  LatLng? _destination;
  LatLng? get destination => _destination;
  bool hasDestination() => _destination != null;

  // "track" field.
  List<OrdersTrackStruct>? _track;
  List<OrdersTrackStruct> get track => _track ?? const [];
  bool hasTrack() => _track != null;

  // "isRidesharing" field.
  bool? _isRidesharing;
  bool get isRidesharing => _isRidesharing ?? false;
  bool hasIsRidesharing() => _isRidesharing != null;

  // "ticketPrice" field.
  double? _ticketPrice;
  double get ticketPrice => _ticketPrice ?? 0.0;
  bool hasTicketPrice() => _ticketPrice != null;

  // "numberOfPassengers" field.
  int? _numberOfPassengers;
  int get numberOfPassengers => _numberOfPassengers ?? 0;
  bool hasNumberOfPassengers() => _numberOfPassengers != null;

  // "timeLeft" field.
  DateTime? _timeLeft;
  DateTime? get timeLeft => _timeLeft;
  bool hasTimeLeft() => _timeLeft != null;

  // "distance" field.
  double? _distance;
  double get distance => _distance ?? 0.0;
  bool hasDistance() => _distance != null;

  // "isOpenToRidesharing" field.
  bool? _isOpenToRidesharing;
  bool get isOpenToRidesharing => _isOpenToRidesharing ?? false;
  bool hasIsOpenToRidesharing() => _isOpenToRidesharing != null;

  // "driverRef" field.
  DocumentReference? _driverRef;
  DocumentReference? get driverRef => _driverRef;
  bool hasDriverRef() => _driverRef != null;

  // "destinationAddress" field.
  String? _destinationAddress;
  String get destinationAddress => _destinationAddress ?? '';
  bool hasDestinationAddress() => _destinationAddress != null;

  // "driverLocation" field.
  LatLng? _driverLocation;
  LatLng? get driverLocation => _driverLocation;
  bool hasDriverLocation() => _driverLocation != null;

  // "mainUserRef" field.
  DocumentReference? _mainUserRef;
  DocumentReference? get mainUserRef => _mainUserRef;
  bool hasMainUserRef() => _mainUserRef != null;

  // "secondaryUsersRef" field.
  List<DocumentReference>? _secondaryUsersRef;
  List<DocumentReference> get secondaryUsersRef =>
      _secondaryUsersRef ?? const [];
  bool hasSecondaryUsersRef() => _secondaryUsersRef != null;

  void _initializeFields() {
    _orderTime = snapshotData['orderTime'] as DateTime?;
    _source = snapshotData['source'] as LatLng?;
    _destination = snapshotData['destination'] as LatLng?;
    _track = getStructList(
      snapshotData['track'],
      OrdersTrackStruct.fromMap,
    );
    _isRidesharing = snapshotData['isRidesharing'] as bool?;
    _ticketPrice = castToType<double>(snapshotData['ticketPrice']);
    _numberOfPassengers = castToType<int>(snapshotData['numberOfPassengers']);
    _timeLeft = snapshotData['timeLeft'] as DateTime?;
    _distance = castToType<double>(snapshotData['distance']);
    _isOpenToRidesharing = snapshotData['isOpenToRidesharing'] as bool?;
    _driverRef = snapshotData['driverRef'] as DocumentReference?;
    _destinationAddress = snapshotData['destinationAddress'] as String?;
    _driverLocation = snapshotData['driverLocation'] as LatLng?;
    _mainUserRef = snapshotData['mainUserRef'] as DocumentReference?;
    _secondaryUsersRef = getDataList(snapshotData['secondaryUsersRef']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  DateTime? orderTime,
  LatLng? source,
  LatLng? destination,
  bool? isRidesharing,
  double? ticketPrice,
  int? numberOfPassengers,
  DateTime? timeLeft,
  double? distance,
  bool? isOpenToRidesharing,
  DocumentReference? driverRef,
  String? destinationAddress,
  LatLng? driverLocation,
  DocumentReference? mainUserRef,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'orderTime': orderTime,
      'source': source,
      'destination': destination,
      'isRidesharing': isRidesharing,
      'ticketPrice': ticketPrice,
      'numberOfPassengers': numberOfPassengers,
      'timeLeft': timeLeft,
      'distance': distance,
      'isOpenToRidesharing': isOpenToRidesharing,
      'driverRef': driverRef,
      'destinationAddress': destinationAddress,
      'driverLocation': driverLocation,
      'mainUserRef': mainUserRef,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.orderTime == e2?.orderTime &&
        e1?.source == e2?.source &&
        e1?.destination == e2?.destination &&
        listEquality.equals(e1?.track, e2?.track) &&
        e1?.isRidesharing == e2?.isRidesharing &&
        e1?.ticketPrice == e2?.ticketPrice &&
        e1?.numberOfPassengers == e2?.numberOfPassengers &&
        e1?.timeLeft == e2?.timeLeft &&
        e1?.distance == e2?.distance &&
        e1?.isOpenToRidesharing == e2?.isOpenToRidesharing &&
        e1?.driverRef == e2?.driverRef &&
        e1?.destinationAddress == e2?.destinationAddress &&
        e1?.driverLocation == e2?.driverLocation &&
        e1?.mainUserRef == e2?.mainUserRef &&
        listEquality.equals(e1?.secondaryUsersRef, e2?.secondaryUsersRef);
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality().hash([
        e?.orderTime,
        e?.source,
        e?.destination,
        e?.track,
        e?.isRidesharing,
        e?.ticketPrice,
        e?.numberOfPassengers,
        e?.timeLeft,
        e?.distance,
        e?.isOpenToRidesharing,
        e?.driverRef,
        e?.destinationAddress,
        e?.driverLocation,
        e?.mainUserRef,
        e?.secondaryUsersRef
      ]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
