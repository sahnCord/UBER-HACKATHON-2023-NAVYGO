// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrderStruct extends FFFirebaseStruct {
  OrderStruct({
    List<OrdersTrackStruct>? orderTrack,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _orderTrack = orderTrack,
        super(firestoreUtilData);

  // "orderTrack" field.
  List<OrdersTrackStruct>? _orderTrack;
  List<OrdersTrackStruct> get orderTrack => _orderTrack ?? const [];
  set orderTrack(List<OrdersTrackStruct>? val) => _orderTrack = val;
  void updateOrderTrack(Function(List<OrdersTrackStruct>) updateFn) =>
      updateFn(_orderTrack ??= []);
  bool hasOrderTrack() => _orderTrack != null;

  static OrderStruct fromMap(Map<String, dynamic> data) => OrderStruct(
        orderTrack: getStructList(
          data['orderTrack'],
          OrdersTrackStruct.fromMap,
        ),
      );

  static OrderStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? OrderStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'orderTrack': _orderTrack?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'orderTrack': serializeParam(
          _orderTrack,
          ParamType.DataStruct,
          true,
        ),
      }.withoutNulls;

  static OrderStruct fromSerializableMap(Map<String, dynamic> data) =>
      OrderStruct(
        orderTrack: deserializeStructParam<OrdersTrackStruct>(
          data['orderTrack'],
          ParamType.DataStruct,
          true,
          structBuilder: OrdersTrackStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'OrderStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is OrderStruct &&
        listEquality.equals(orderTrack, other.orderTrack);
  }

  @override
  int get hashCode => const ListEquality().hash([orderTrack]);
}

OrderStruct createOrderStruct({
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    OrderStruct(
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

OrderStruct? updateOrderStruct(
  OrderStruct? order, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    order
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addOrderStructData(
  Map<String, dynamic> firestoreData,
  OrderStruct? order,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (order == null) {
    return;
  }
  if (order.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && order.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final orderData = getOrderFirestoreData(order, forFieldValue);
  final nestedData = orderData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = order.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getOrderFirestoreData(
  OrderStruct? order, [
  bool forFieldValue = false,
]) {
  if (order == null) {
    return {};
  }
  final firestoreData = mapToFirestore(order.toMap());

  // Add any Firestore field values
  order.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getOrderListFirestoreData(
  List<OrderStruct>? orders,
) =>
    orders?.map((e) => getOrderFirestoreData(e, true)).toList() ?? [];
