// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BussesLocationTimeTrackStruct extends FFFirebaseStruct {
  BussesLocationTimeTrackStruct({
    LatLng? routes,
    DateTime? schedule,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _routes = routes,
        _schedule = schedule,
        super(firestoreUtilData);

  // "routes" field.
  LatLng? _routes;
  LatLng? get routes => _routes;
  set routes(LatLng? val) => _routes = val;
  bool hasRoutes() => _routes != null;

  // "schedule" field.
  DateTime? _schedule;
  DateTime? get schedule => _schedule;
  set schedule(DateTime? val) => _schedule = val;
  bool hasSchedule() => _schedule != null;

  static BussesLocationTimeTrackStruct fromMap(Map<String, dynamic> data) =>
      BussesLocationTimeTrackStruct(
        routes: data['routes'] as LatLng?,
        schedule: data['schedule'] as DateTime?,
      );

  static BussesLocationTimeTrackStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic>
          ? BussesLocationTimeTrackStruct.fromMap(data)
          : null;

  Map<String, dynamic> toMap() => {
        'routes': _routes,
        'schedule': _schedule,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'routes': serializeParam(
          _routes,
          ParamType.LatLng,
        ),
        'schedule': serializeParam(
          _schedule,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static BussesLocationTimeTrackStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      BussesLocationTimeTrackStruct(
        routes: deserializeParam(
          data['routes'],
          ParamType.LatLng,
          false,
        ),
        schedule: deserializeParam(
          data['schedule'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'BussesLocationTimeTrackStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is BussesLocationTimeTrackStruct &&
        routes == other.routes &&
        schedule == other.schedule;
  }

  @override
  int get hashCode => const ListEquality().hash([routes, schedule]);
}

BussesLocationTimeTrackStruct createBussesLocationTimeTrackStruct({
  LatLng? routes,
  DateTime? schedule,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    BussesLocationTimeTrackStruct(
      routes: routes,
      schedule: schedule,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

BussesLocationTimeTrackStruct? updateBussesLocationTimeTrackStruct(
  BussesLocationTimeTrackStruct? bussesLocationTimeTrack, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    bussesLocationTimeTrack
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addBussesLocationTimeTrackStructData(
  Map<String, dynamic> firestoreData,
  BussesLocationTimeTrackStruct? bussesLocationTimeTrack,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (bussesLocationTimeTrack == null) {
    return;
  }
  if (bussesLocationTimeTrack.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue &&
      bussesLocationTimeTrack.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final bussesLocationTimeTrackData = getBussesLocationTimeTrackFirestoreData(
      bussesLocationTimeTrack, forFieldValue);
  final nestedData =
      bussesLocationTimeTrackData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      bussesLocationTimeTrack.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getBussesLocationTimeTrackFirestoreData(
  BussesLocationTimeTrackStruct? bussesLocationTimeTrack, [
  bool forFieldValue = false,
]) {
  if (bussesLocationTimeTrack == null) {
    return {};
  }
  final firestoreData = mapToFirestore(bussesLocationTimeTrack.toMap());

  // Add any Firestore field values
  bussesLocationTimeTrack.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getBussesLocationTimeTrackListFirestoreData(
  List<BussesLocationTimeTrackStruct>? bussesLocationTimeTracks,
) =>
    bussesLocationTimeTracks
        ?.map((e) => getBussesLocationTimeTrackFirestoreData(e, true))
        .toList() ??
    [];
