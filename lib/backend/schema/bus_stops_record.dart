import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusStopsRecord extends FirestoreRecord {
  BusStopsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "LatLgt" field.
  LatLng? _latLgt;
  LatLng? get latLgt => _latLgt;
  bool hasLatLgt() => _latLgt != null;

  void _initializeFields() {
    _latLgt = snapshotData['LatLgt'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('busStops');

  static Stream<BusStopsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusStopsRecord.fromSnapshot(s));

  static Future<BusStopsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusStopsRecord.fromSnapshot(s));

  static BusStopsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusStopsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusStopsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusStopsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusStopsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusStopsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusStopsRecordData({
  LatLng? latLgt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'LatLgt': latLgt,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusStopsRecordDocumentEquality implements Equality<BusStopsRecord> {
  const BusStopsRecordDocumentEquality();

  @override
  bool equals(BusStopsRecord? e1, BusStopsRecord? e2) {
    return e1?.latLgt == e2?.latLgt;
  }

  @override
  int hash(BusStopsRecord? e) => const ListEquality().hash([e?.latLgt]);

  @override
  bool isValidKey(Object? o) => o is BusStopsRecord;
}
