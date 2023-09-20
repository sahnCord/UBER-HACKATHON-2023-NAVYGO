// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersTrackStruct extends FFFirebaseStruct {
  OrdersTrackStruct({
    String? mode,
    List<BussesLocationTimeTrackStruct>? routes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _mode = mode,
        _routes = routes,
        super(firestoreUtilData);

  // "mode" field.
  String? _mode;
  String get mode => _mode ?? '';
  set mode(String? val) => _mode = val;
  bool hasMode() => _mode != null;

  // "routes" field.
  List<BussesLocationTimeTrackStruct>? _routes;
  List<BussesLocationTimeTrackStruct> get routes => _routes ?? const [];
  set routes(List<BussesLocationTimeTrackStruct>? val) => _routes = val;
  void updateRoutes(Function(List<BussesLocationTimeTrackStruct>) updateFn) =>
      updateFn(_routes ??= []);
  bool hasRoutes() => _routes != null;

  static OrdersTrackStruct fromMap(Map<String, dynamic> data) =>
      OrdersTrackStruct(
        mode: data['mode'] as String?,
        routes: getStructList(
          data['routes'],
          BussesLocationTimeTrackStruct.fromMap,
        ),
      );

  static OrdersTrackStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OrdersTrackStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'mode': _mode,
        'routes': _routes?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'mode': serializeParam(
          _mode,
          ParamType.String,
        ),
        'routes': serializeParam(
          _routes,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static OrdersTrackStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrdersTrackStruct(
        mode: deserializeParam(
          data['mode'],
          ParamType.String,
          false,
        ),
        routes: deserializeStructParam<BussesLocationTimeTrackStruct>(
          data['routes'],
          ParamType.DataStruct,
          true,
          structBuilder: BussesLocationTimeTrackStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OrdersTrackStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrdersTrackStruct &&
        mode == other.mode &&
        listEquality.equals(routes, other.routes);
  }

  @override
  int get hashCode => const ListEquality().hash([mode, routes]);
}

OrdersTrackStruct createOrdersTrackStruct({
  String? mode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrdersTrackStruct(
      mode: mode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrdersTrackStruct? updateOrdersTrackStruct(
  OrdersTrackStruct? ordersTrack, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    ordersTrack
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrdersTrackStructData(
  Map<String, dynamic> firestoreData,
  OrdersTrackStruct? ordersTrack,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (ordersTrack == null) {
    return;
  }
  if (ordersTrack.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && ordersTrack.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final ordersTrackData =
      getOrdersTrackFirestoreData(ordersTrack, forFieldValue);
  final nestedData =
      ordersTrackData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = ordersTrack.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrdersTrackFirestoreData(
  OrdersTrackStruct? ordersTrack, [
  bool forFieldValue = false,
]) {
  if (ordersTrack == null) {
    return {};
  }
  final firestoreData = mapToFirestore(ordersTrack.toMap());

  // Add any Firestore field values
  ordersTrack.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrdersTrackListFirestoreData(
  List<OrdersTrackStruct>? ordersTracks,
) =>
    ordersTracks?.map((e) => getOrdersTrackFirestoreData(e, true)).toList() ??
    [];
