import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserLocationsRecord extends FirestoreRecord {
  UserLocationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "userRef" field.
  DocumentReference? _userRef;
  DocumentReference? get userRef => _userRef;
  bool hasUserRef() => _userRef != null;

  // "home" field.
  AddressPickerStruct? _home;
  AddressPickerStruct get home => _home ?? AddressPickerStruct();
  bool hasHome() => _home != null;

  // "work" field.
  AddressPickerStruct? _work;
  AddressPickerStruct get work => _work ?? AddressPickerStruct();
  bool hasWork() => _work != null;

  // "history" field.
  List<AddressPickerStruct>? _history;
  List<AddressPickerStruct> get history => _history ?? const [];
  bool hasHistory() => _history != null;

  void _initializeFields() {
    _userRef = snapshotData['userRef'] as DocumentReference?;
    _home = AddressPickerStruct.maybeFromMap(snapshotData['home']);
    _work = AddressPickerStruct.maybeFromMap(snapshotData['work']);
    _history = getStructList(
      snapshotData['history'],
      AddressPickerStruct.fromMap,
    );
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('userLocations');

  static Stream<UserLocationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UserLocationsRecord.fromSnapshot(s));

  static Future<UserLocationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UserLocationsRecord.fromSnapshot(s));

  static UserLocationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      UserLocationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UserLocationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UserLocationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UserLocationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UserLocationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUserLocationsRecordData({
  DocumentReference? userRef,
  AddressPickerStruct? home,
  AddressPickerStruct? work,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'userRef': userRef,
      'home': AddressPickerStruct().toMap(),
      'work': AddressPickerStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "home" field.
  addAddressPickerStructData(firestoreData, home, 'home');

  // Handle nested data for "work" field.
  addAddressPickerStructData(firestoreData, work, 'work');

  return firestoreData;
}

class UserLocationsRecordDocumentEquality
    implements Equality<UserLocationsRecord> {
  const UserLocationsRecordDocumentEquality();

  @override
  bool equals(UserLocationsRecord? e1, UserLocationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.userRef == e2?.userRef &&
        e1?.home == e2?.home &&
        e1?.work == e2?.work &&
        listEquality.equals(e1?.history, e2?.history);
  }

  @override
  int hash(UserLocationsRecord? e) =>
      const ListEquality().hash([e?.userRef, e?.home, e?.work, e?.history]);

  @override
  bool isValidKey(Object? o) => o is UserLocationsRecord;
}
