import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UberPointsRecord extends FirestoreRecord {
  UberPointsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _location = snapshotData['location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('uberPoints');

  static Stream<UberPointsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UberPointsRecord.fromSnapshot(s));

  static Future<UberPointsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UberPointsRecord.fromSnapshot(s));

  static UberPointsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UberPointsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UberPointsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UberPointsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UberPointsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UberPointsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUberPointsRecordData({
  String? name,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class UberPointsRecordDocumentEquality implements Equality<UberPointsRecord> {
  const UberPointsRecordDocumentEquality();

  @override
  bool equals(UberPointsRecord? e1, UberPointsRecord? e2) {
    return e1?.name == e2?.name && e1?.location == e2?.location;
  }

  @override
  int hash(UberPointsRecord? e) =>
      const ListEquality().hash([e?.name, e?.location]);

  @override
  bool isValidKey(Object? o) => o is UberPointsRecord;
}
