import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BusStationsRecord extends FirestoreRecord {
  BusStationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bussesList" field.
  List<String>? _bussesList;
  List<String> get bussesList => _bussesList ?? const [];
  bool hasBussesList() => _bussesList != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  void _initializeFields() {
    _bussesList = getDataList(snapshotData['bussesList']);
    _location = snapshotData['location'] as LatLng?;
    _name = snapshotData['name'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('busStations');

  static Stream<BusStationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BusStationsRecord.fromSnapshot(s));

  static Future<BusStationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BusStationsRecord.fromSnapshot(s));

  static BusStationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BusStationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BusStationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BusStationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BusStationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BusStationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBusStationsRecordData({
  LatLng? location,
  String? name,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'location': location,
      'name': name,
    }.withoutNulls,
  );

  return firestoreData;
}

class BusStationsRecordDocumentEquality implements Equality<BusStationsRecord> {
  const BusStationsRecordDocumentEquality();

  @override
  bool equals(BusStationsRecord? e1, BusStationsRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.bussesList, e2?.bussesList) &&
        e1?.location == e2?.location &&
        e1?.name == e2?.name;
  }

  @override
  int hash(BusStationsRecord? e) =>
      const ListEquality().hash([e?.bussesList, e?.location, e?.name]);

  @override
  bool isValidKey(Object? o) => o is BusStationsRecord;
}
