import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BussesRecord extends FirestoreRecord {
  BussesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "outwardRoute" field.
  List<BussesLocationTimeTrackStruct>? _outwardRoute;
  List<BussesLocationTimeTrackStruct> get outwardRoute =>
      _outwardRoute ?? const [];
  bool hasOutwardRoute() => _outwardRoute != null;

  // "returnRoute" field.
  List<BussesLocationTimeTrackStruct>? _returnRoute;
  List<BussesLocationTimeTrackStruct> get returnRoute =>
      _returnRoute ?? const [];
  bool hasReturnRoute() => _returnRoute != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "ticketPrice" field.
  double? _ticketPrice;
  double get ticketPrice => _ticketPrice ?? 0.0;
  bool hasTicketPrice() => _ticketPrice != null;

  // "routersBack" field.
  List<LatLng>? _routersBack;
  List<LatLng> get routersBack => _routersBack ?? const [];
  bool hasRoutersBack() => _routersBack != null;

  void _initializeFields() {
    _outwardRoute = getStructList(
      snapshotData['outwardRoute'],
      BussesLocationTimeTrackStruct.fromMap,
    );
    _returnRoute = getStructList(
      snapshotData['returnRoute'],
      BussesLocationTimeTrackStruct.fromMap,
    );
    _name = snapshotData['name'] as String?;
    _ticketPrice = castToType<double>(snapshotData['ticketPrice']);
    _routersBack = getDataList(snapshotData['routersBack']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('busses');

  static Stream<BussesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BussesRecord.fromSnapshot(s));

  static Future<BussesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BussesRecord.fromSnapshot(s));

  static BussesRecord fromSnapshot(DocumentSnapshot snapshot) => BussesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BussesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BussesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BussesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BussesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBussesRecordData({
  String? name,
  double? ticketPrice,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'ticketPrice': ticketPrice,
    }.withoutNulls,
  );

  return firestoreData;
}

class BussesRecordDocumentEquality implements Equality<BussesRecord> {
  const BussesRecordDocumentEquality();

  @override
  bool equals(BussesRecord? e1, BussesRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.outwardRoute, e2?.outwardRoute) &&
        listEquality.equals(e1?.returnRoute, e2?.returnRoute) &&
        e1?.name == e2?.name &&
        e1?.ticketPrice == e2?.ticketPrice &&
        listEquality.equals(e1?.routersBack, e2?.routersBack);
  }

  @override
  int hash(BussesRecord? e) => const ListEquality().hash([
        e?.outwardRoute,
        e?.returnRoute,
        e?.name,
        e?.ticketPrice,
        e?.routersBack
      ]);

  @override
  bool isValidKey(Object? o) => o is BussesRecord;
}
