// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StopsStruct extends FFFirebaseStruct {
  StopsStruct({
    int? numberOfStops,
    List<LatLng>? locations,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _numberOfStops = numberOfStops,
        _locations = locations,
        super(firestoreUtilData);

  // "numberOfStops" field.
  int? _numberOfStops;
  int get numberOfStops => _numberOfStops ?? 0;
  set numberOfStops(int? val) => _numberOfStops = val;
  void incrementNumberOfStops(int amount) =>
      _numberOfStops = numberOfStops + amount;
  bool hasNumberOfStops() => _numberOfStops != null;

  // "locations" field.
  List<LatLng>? _locations;
  List<LatLng> get locations => _locations ?? const [];
  set locations(List<LatLng>? val) => _locations = val;
  void updateLocations(Function(List<LatLng>) updateFn) =>
      updateFn(_locations ??= []);
  bool hasLocations() => _locations != null;

  static StopsStruct fromMap(Map<String, dynamic> data) => StopsStruct(
        numberOfStops: castToType<int>(data['numberOfStops']),
        locations: getDataList(data['locations']),
      );

  static StopsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? StopsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'numberOfStops': _numberOfStops,
        'locations': _locations,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'numberOfStops': serializeParam(
          _numberOfStops,
          ParamType.int,
        ),
        'locations': serializeParam(
          _locations,
          ParamType.LatLng,
          true,
        ),
      }.withoutNulls;

  static StopsStruct fromSerializableMap(Map<String, dynamic> data) =>
      StopsStruct(
        numberOfStops: deserializeParam(
          data['numberOfStops'],
          ParamType.int,
          false,
        ),
        locations: deserializeParam<LatLng>(
          data['locations'],
          ParamType.LatLng,
          true,
        ),
      );

  @override
  String toString() => 'StopsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is StopsStruct &&
        numberOfStops == other.numberOfStops &&
        listEquality.equals(locations, other.locations);
  }

  @override
  int get hashCode => const ListEquality().hash([numberOfStops, locations]);
}

StopsStruct createStopsStruct({
  int? numberOfStops,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StopsStruct(
      numberOfStops: numberOfStops,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StopsStruct? updateStopsStruct(
  StopsStruct? stops, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stops
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStopsStructData(
  Map<String, dynamic> firestoreData,
  StopsStruct? stops,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stops == null) {
    return;
  }
  if (stops.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stops.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stopsData = getStopsFirestoreData(stops, forFieldValue);
  final nestedData = stopsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stops.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStopsFirestoreData(
  StopsStruct? stops, [
  bool forFieldValue = false,
]) {
  if (stops == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stops.toMap());

  // Add any Firestore field values
  stops.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStopsListFirestoreData(
  List<StopsStruct>? stopss,
) =>
    stopss?.map((e) => getStopsFirestoreData(e, true)).toList() ?? [];
