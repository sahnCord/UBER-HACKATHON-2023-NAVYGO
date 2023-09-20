// ignore_for_file: unnecessary_getters_setters
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NoWaitTimeStruct extends FFFirebaseStruct {
  NoWaitTimeStruct({
    bool? noWaitTime,
    int? amountTimeInMinutes,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _noWaitTime = noWaitTime,
        _amountTimeInMinutes = amountTimeInMinutes,
        super(firestoreUtilData);

  // "noWaitTime" field.
  bool? _noWaitTime;
  bool get noWaitTime => _noWaitTime ?? false;
  set noWaitTime(bool? val) => _noWaitTime = val;
  bool hasNoWaitTime() => _noWaitTime != null;

  // "amountTimeInMinutes" field.
  int? _amountTimeInMinutes;
  int get amountTimeInMinutes => _amountTimeInMinutes ?? 0;
  set amountTimeInMinutes(int? val) => _amountTimeInMinutes = val;
  void incrementAmountTimeInMinutes(int amount) =>
      _amountTimeInMinutes = amountTimeInMinutes + amount;
  bool hasAmountTimeInMinutes() => _amountTimeInMinutes != null;

  static NoWaitTimeStruct fromMap(Map<String, dynamic> data) =>
      NoWaitTimeStruct(
        noWaitTime: data['noWaitTime'] as bool?,
        amountTimeInMinutes: castToType<int>(data['amountTimeInMinutes']),
      );

  static NoWaitTimeStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? NoWaitTimeStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'noWaitTime': _noWaitTime,
        'amountTimeInMinutes': _amountTimeInMinutes,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'noWaitTime': serializeParam(
          _noWaitTime,
          ParamType.bool,
        ),
        'amountTimeInMinutes': serializeParam(
          _amountTimeInMinutes,
          ParamType.int,
        ),
      }.withoutNulls;

  static NoWaitTimeStruct fromSerializableMap(Map<String, dynamic> data) =>
      NoWaitTimeStruct(
        noWaitTime: deserializeParam(
          data['noWaitTime'],
          ParamType.bool,
          false,
        ),
        amountTimeInMinutes: deserializeParam(
          data['amountTimeInMinutes'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'NoWaitTimeStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is NoWaitTimeStruct &&
        noWaitTime == other.noWaitTime &&
        amountTimeInMinutes == other.amountTimeInMinutes;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([noWaitTime, amountTimeInMinutes]);
}

NoWaitTimeStruct createNoWaitTimeStruct({
  bool? noWaitTime,
  int? amountTimeInMinutes,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    NoWaitTimeStruct(
      noWaitTime: noWaitTime,
      amountTimeInMinutes: amountTimeInMinutes,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

NoWaitTimeStruct? updateNoWaitTimeStruct(
  NoWaitTimeStruct? noWaitTimeStruct, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    noWaitTimeStruct
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addNoWaitTimeStructData(
  Map<String, dynamic> firestoreData,
  NoWaitTimeStruct? noWaitTimeStruct,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (noWaitTimeStruct == null) {
    return;
  }
  if (noWaitTimeStruct.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && noWaitTimeStruct.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final noWaitTimeStructData =
      getNoWaitTimeFirestoreData(noWaitTimeStruct, forFieldValue);
  final nestedData =
      noWaitTimeStructData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = noWaitTimeStruct.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getNoWaitTimeFirestoreData(
  NoWaitTimeStruct? noWaitTimeStruct, [
  bool forFieldValue = false,
]) {
  if (noWaitTimeStruct == null) {
    return {};
  }
  final firestoreData = mapToFirestore(noWaitTimeStruct.toMap());

  // Add any Firestore field values
  noWaitTimeStruct.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getNoWaitTimeListFirestoreData(
  List<NoWaitTimeStruct>? noWaitTimeStructs,
) =>
    noWaitTimeStructs
        ?.map((e) => getNoWaitTimeFirestoreData(e, true))
        .toList() ??
    [];
